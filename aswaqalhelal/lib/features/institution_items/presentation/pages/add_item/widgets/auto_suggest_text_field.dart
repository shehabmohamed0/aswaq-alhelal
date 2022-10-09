import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum AutoSuggestionState {
  loading,
  loaded,
  loadedButCanAdd,
  error,
  emptyText,
  emptyShowNoSuggestions
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
    this.errorWidget,
    this.labelText,
    this.emptyWidget,
    required this.onEmptyWidgetClicked,
    this.loadingWidget,
    required this.onChanged,
    required this.suggestionState,
    required this.onRemoveSelection,
    this.enabled = true,
    this.showRemoveButton = true,
    this.validator,
    this.autovalidateMode,
this.autoFocus = false
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? errorText;
  final String? labelText;
  final Function(String val) onChanged;
  final List<T> suggestions;
  final Widget Function(BuildContext context, T t) suggestionBuilder;
  final Function(T suggestion) onSuggestionSelected;
  final AutoSuggestionState suggestionState;
  final Widget? emptyWidget;
  final VoidCallback onEmptyWidgetClicked;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final VoidCallback onRemoveSelection;
  final bool showRemoveButton;
  final bool enabled;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
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
      _listener,
    );
  }

  void _listener() {
    if (widget.focusNode.hasFocus) {
      showOverlay();
    } else {

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
    switch (widget.suggestionState) {
      case AutoSuggestionState.loading:
        return widget.loadingWidget ??
            const Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: CircularProgressIndicator(),
              ),
            );
      case AutoSuggestionState.loadedButCanAdd:
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
              .toList()
            ..add(
              GestureDetector(
                onTap: widget.onEmptyWidgetClicked,
                child: widget.emptyWidget ??
                    ListTile(
                      leading: const Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                      title: Text(widget.controller.text),
                    ),
              ),
            ),
        );

      case AutoSuggestionState.loaded:
        if (widget.suggestions.isEmpty) {
          return GestureDetector(
            onTap: () {
              widget.onEmptyWidgetClicked();
            },
            child: widget.emptyWidget ??
                ListTile(
                  leading: const Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  title: Text(widget.controller.text),
                ),
          );
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
        return widget.errorWidget ?? const ListTile(title: Text('Error'));
      case AutoSuggestionState.emptyText:
        return const SizedBox.shrink();
      case AutoSuggestionState.emptyShowNoSuggestions:
        return const ListTile(
          title: Text('No Suggestions'),
        );
    }
  }

  void hideOverlay() {
    for (var entry in entries) {
      entry.remove();
    }
    entries.clear();
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_listener);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AutoSuggestTextField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enabled != widget.enabled) return;
    if (oldWidget.suggestionState != widget.suggestionState ||
        oldWidget.suggestions != widget.suggestions) {
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
            child: TextFormField(
              autofocus: widget.autoFocus,
              focusNode: widget.focusNode,
              controller: widget.controller,
              onChanged: widget.onChanged,
              autovalidateMode: widget.autovalidateMode,
              validator: widget.validator,
              decoration: InputDecoration(
                labelText: widget.labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: !widget.enabled,
                fillColor: widget.enabled ? null : Colors.grey.shade200,
                errorText: widget.errorText,
              ),
            ),
          ),
          if (!widget.enabled && widget.showRemoveButton)
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
