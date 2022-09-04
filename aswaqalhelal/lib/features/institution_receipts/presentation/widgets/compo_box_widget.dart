import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ComboBoxWidget<T> extends StatefulWidget {
  const ComboBoxWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.suggestions,
    required this.suggestionBuilder,
    required this.onSuggestionSelected,
    required this.onChanged,
    required this.onRemoveSelection,
    required this.enabled,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final List<T> suggestions;
  final Widget Function(BuildContext context, T t) suggestionBuilder;
  final Function(T suggestion) onSuggestionSelected;
  final void Function(String value) onChanged;
  final void Function()? onRemoveSelection;
  final bool enabled;

  @override
  State<ComboBoxWidget<T>> createState() => _ComboBoxWidgetState<T>();
}

class _ComboBoxWidgetState<T> extends State<ComboBoxWidget<T>> {
  late final LayerLink layerLink;
  List<OverlayEntry> entries = [];
  List<ScrollController> scrollControllers = [];
  @override
  void initState() {
    super.initState();
    layerLink = LayerLink();
    // WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());
    widget.focusNode.addListener(
      _listener,
    );
  }

  void _listener() {
    if (widget.focusNode.hasFocus) {
      log('show');
      showOverlay();
    } else {
      log('Hide');

      hideOverlay();
    }
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        top: 0,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: Material(
            elevation: 8,
            color: Colors.white,
            child: buildOverlay(),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    entries.add(entry);
  }

  Widget buildOverlay() {
    final controller = ScrollController();
    scrollControllers.add(controller);
    return widget.suggestions.isEmpty
        ? const SizedBox.shrink()
        : ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 3),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Scrollbar(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: widget.suggestions
                      .map(
                        (item) => InkWell(
                          onTap: () => widget.onSuggestionSelected(item),
                          child: widget.suggestionBuilder(context, item),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
  }

  void hideOverlay() {
    for (var entry in entries) {
      entry.remove();
    }
    for (var controller in scrollControllers) {
      controller.dispose();
    }
    entries.clear();
    scrollControllers.clear();
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_listener);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ComboBoxWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enabled != widget.enabled) return;
    if (oldWidget.suggestions != widget.suggestions) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        hideOverlay();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          showOverlay();
        });
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Stack(
        children: [
          AbsorbPointer(
            absorbing: !widget.enabled,
            child: TextField(
              focusNode: widget.focusNode,
              controller: widget.controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: !widget.enabled,
                fillColor: widget.enabled ? null : Colors.grey.shade200,
              ),
            ),
          ),
          if (!widget.enabled && widget.onRemoveSelection != null)
            PositionedDirectional(
              bottom: 1,
              end: 8,
              top: 1,
              child: GestureDetector(
                onTap: widget.onRemoveSelection,
                child: const Icon(
                  Icons.close_rounded,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
