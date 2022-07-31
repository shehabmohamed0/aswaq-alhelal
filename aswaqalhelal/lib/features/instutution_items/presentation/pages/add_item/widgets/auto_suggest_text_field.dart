import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum AutoSuggestionState {
  loading,
  loaded,
  error,
  emptyText,
}

class AutoSuggestTextField<T> extends StatefulWidget {
  const AutoSuggestTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.errorText,
    required this.suggestions,
    required this.suggestionBuilder,
    required this.onSuggestionSelected,
    required this.errorWidget,
    required this.emptyWidget,
    required this.onEmptyWidgetClicked,
    required this.loadingWidget,
    required this.onChanged,
    required this.suggestionState,
    required this.onRemoveSelection,
    required this.enabled,
    required this.isEdit,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode focusNode;
  final String? errorText;
  final Function(String val) onChanged;
  final List<T> suggestions;
  final Widget Function(BuildContext context, T t) suggestionBuilder;
  final Function(T suggestion) onSuggestionSelected;
  final AutoSuggestionState suggestionState;
  final Widget emptyWidget;
  final VoidCallback onEmptyWidgetClicked;
  final Widget loadingWidget;
  final Widget errorWidget;
  final VoidCallback onRemoveSelection;
  final bool enabled;
  final bool isEdit;
  @override
  State<AutoSuggestTextField<T>> createState() =>
      _AutoSuggestTextFieldState<T>();
}

class _AutoSuggestTextFieldState<T> extends State<AutoSuggestTextField<T>> {
  late final LayerLink layerLink;

  List<OverlayEntry> entries = [];

  @override
  void initState() {
    super.initState();
    layerLink = LayerLink();
    // WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());

    widget.focusNode.addListener(
      () {
        if (widget.focusNode.hasFocus) {
          log('show');
          showOverlay();
        } else {
          log('Hide');

          hideOverlay();
        }
      },
    );
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    entries.add(OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: Material(
              elevation: 8, color: Colors.white, child: buildOverlay()),
        ),
      ),
    ));

    overlay.insertAll(entries);
  }

  Widget buildOverlay() {
    switch (widget.suggestionState) {
      case AutoSuggestionState.loading:
        return widget.loadingWidget;
      case AutoSuggestionState.loaded:
        if (widget.suggestions.isEmpty) {
          return GestureDetector(
              onTap: () {
                widget.onEmptyWidgetClicked();
              },
              child: widget.emptyWidget);
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.suggestions
              .map<Widget>(
                (T suggestion) => InkWell(
                  onTap: () {
                    widget.onSuggestionSelected(suggestion);
                  },
                  child: widget.suggestionBuilder(context, suggestion),
                ),
              )
              .toList(),
        );
      case AutoSuggestionState.error:
        return widget.errorWidget;
      case AutoSuggestionState.emptyText:
        return const SizedBox.shrink();
    }
  }

  void hideOverlay() {
    for (var element in entries) {
      element.remove();
    }
    entries.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AutoSuggestTextField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enabled != widget.enabled) return;
    if (oldWidget.suggestionState != widget.suggestionState ||
        oldWidget.suggestions != widget.suggestions) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        hideOverlay();
        SchedulerBinding.instance?.addPostFrameCallback((_) {
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
                filled: !widget.enabled,
                fillColor: widget.enabled ? null : Colors.grey.shade200,
                errorText: widget.errorText,
                border: const OutlineInputBorder(),
                disabledBorder: const OutlineInputBorder(),
                errorBorder: const OutlineInputBorder(),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide()),
                focusedBorder: const OutlineInputBorder(),
              ),
            ),
          ),
          if (!widget.enabled && !widget.isEdit)
            Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: 12,
              end: 10,
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
