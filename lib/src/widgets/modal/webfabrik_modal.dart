import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_dotted_timeline.dart';
part '_header.dart';
part '_modal_handle.dart';
part '_vertical_list_item_divider.dart';
part '_webfabrik_list_icon.dart';
part '_webfabrik_list_item.dart';

/* To-Do:
    - [ ] Factor in velocity of drag to determine if a drag was significant
    - [ ] Fix onPointerUp sometimes not being called (might only be an issue in simulators)
      - This is (at least partly) due to the maplibre package. It introduces (as ios support is still in alpha) render issues, 
        which includes that the pointer events get interrupted on fade out of the attribution widget
*/

/// {@template webfabrik_modal}
/// A draggable modal sheet that displays the user's location history.
///
/// This widget allows the user to view their location history in a list format.
/// It can be dragged to three different heights: small, medium (implicitly),
/// and large, controlled by a [DraggableScrollableController].
///
/// The modal includes a header, a draggable handle, and a scrollable list
/// of location and activity items.
/// {@endtemplate}
class WebfabrikModal extends StatefulWidget {
  /// {@macro webfabrik_modal}
  const WebfabrikModal({
    super.key,
    required this.builder,
    required this.title,
    required this.secondaryButtons,
    required this.legend,
    this.displayBackButton = true,
    this.onBackPressed,
  });

  /// The maximum height of the modal, occupying the full screen.
  static const double largeModalHeight = 1;

  /// The default medium height of the modal.
  static const double mediumModalHeight = .6;

  /// The minimum height of the modal when collapsed.
  static const double smallModalHeight = .3;

  /// The child of the modal.
  final Widget Function(BuildContext context, ScrollController scrollController)
  builder;

  /// The title of the modal.
  final String title;

  /// The secondary buttons of the modal.
  final List<Widget> secondaryButtons;

  /// Whether to display the back button.
  final bool displayBackButton;

  /// The callback to be called when the back button is pressed.
  final VoidCallback? onBackPressed;

  final Widget legend;

  @override
  State<WebfabrikModal> createState() => _WebfabrikModalState();
}

class _WebfabrikModalState extends State<WebfabrikModal> {
  late DraggableScrollableController _draggableScrollableController;
  double _dragStart = 0;
  double _dragPosition = 0;

  @override
  void initState() {
    super.initState();
    _draggableScrollableController = DraggableScrollableController();

    _draggableScrollableController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: WebfabrikModal.mediumModalHeight,
      minChildSize: WebfabrikModal.smallModalHeight,
      maxChildSize: WebfabrikModal.largeModalHeight,
      snap: true,
      snapSizes: const [
        WebfabrikModal.smallModalHeight,
        WebfabrikModal.largeModalHeight,
      ],
      controller: _draggableScrollableController,
      snapAnimationDuration: theme.durations.medium,
      builder:
          (context, scrollController) => Column(
            children: [
              AnimatedOpacity(
                opacity: _shouldDisplayLegend() ? 1 : 0,
                duration: theme.durations.short,
                curve: Curves.easeOut,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: theme.spacing.medium,
                  ),
                  child: widget.legend,
                ),
              ),
              const SmallGap(),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(theme.radii.xLarge),
                  ),
                  child: BackdropFilter(
                    filter: theme.misc.blurFilter,
                    child: Container(
                      color: theme.colors.translucentBackground,
                      child: Column(
                        children: [
                          Listener(
                            behavior: HitTestBehavior.translucent,
                            onPointerDown:
                                (event) =>
                                    _verticalDragStart(event.position.dy),
                            onPointerUp: (_) => _verticalDragEnd(theme: theme),
                            onPointerMove: (event) {
                              _verticalDragUpdate(
                                event.delta.dy,
                                event.position.dy,
                              );
                            },
                            onPointerCancel:
                                (_) => _verticalDragEnd(theme: theme),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: theme.spacing.medium,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const MediumGap(),
                                  const _ModalHandle(),
                                  const MediumGap(),
                                  _Header(
                                    title: widget.title,
                                    displayBackButton: widget.displayBackButton,
                                    secondaryButtons: widget.secondaryButtons,
                                    onBackPressed: widget.onBackPressed,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: widget.builder(context, scrollController),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  bool _shouldDisplayLegend() {
    if (!_draggableScrollableController.isAttached) {
      return true;
    }

    return _draggableScrollableController.size <=
        WebfabrikModal.mediumModalHeight;
  }

  /// Records the start position of a vertical drag gesture.
  ///
  /// Stores the initial y-coordinate of the pointer when dragging begins.
  void _verticalDragStart(double dragStartPosition) {
    _dragStart = dragStartPosition;
    _dragPosition = dragStartPosition;
  }

  /// Updates the modal height in response to the user's drag movement.
  ///
  /// Adjusts the [DraggableScrollableController] based on the drag delta,
  /// clamped between [smallModalHeight] and [largeModalHeight], and updates
  /// the current drag position.
  void _verticalDragUpdate(double dragDelta, double dragPosition) {
    double currentExtent = _draggableScrollableController.size;

    double newExtent =
        (currentExtent - dragDelta / MediaQuery.of(context).size.height).clamp(
          WebfabrikModal.smallModalHeight,
          WebfabrikModal.largeModalHeight,
        );
    _draggableScrollableController.jumpTo(newExtent);
    _dragPosition = dragPosition;
  }

  /// Handles completion of a vertical drag by animating to the nearest snap point.
  ///
  /// Determines drag direction and significance to animate the modal to
  /// either [largeModalHeight] or [smallModalHeight] with an easing curve.
  void _verticalDragEnd({required WebfabrikThemeData theme}) {
    final double dragDelta = _dragStart - _dragPosition;

    if (dragDelta != 0) {
      final VerticalDirection dragDirection =
          _dragStart > _dragPosition
              ? VerticalDirection.up
              : VerticalDirection.down;
      final bool isDragSignificant = dragDelta.abs() > 70;

      final VerticalDirection dragDirectionToAnimate =
          isDragSignificant ? dragDirection : dragDirection.flip();

      _draggableScrollableController.animateTo(
        _getModalHeight(dragDirectionToAnimate),
        duration: theme.durations.medium,
        curve: Curves.easeOut,
      );
    }
  }

  /// Returns the target modal height based on the drag direction.
  ///
  /// If dragging up, returns [largeModalHeight], otherwise returns [smallModalHeight].
  double _getModalHeight(VerticalDirection dragDirection) {
    if (dragDirection == VerticalDirection.up) {
      return WebfabrikModal.largeModalHeight;
    } else {
      return WebfabrikModal.smallModalHeight;
    }
  }
}

enum VerticalDirection {
  up,
  down;

  VerticalDirection flip() {
    if (this == VerticalDirection.up) {
      return VerticalDirection.down;
    } else {
      return VerticalDirection.up;
    }
  }
}
