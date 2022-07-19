import 'package:flutter/material.dart';

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
    required this.errorWidget,
    required this.emptyWidget,
    required this.oneEmptyWidgetClicked,
    required this.loadingWidget,
    required this.onChanged,
    required this.suggestionState,
    required this.onSuggestionSelected,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode focusNode;
  final String? errorText;
  final Function(String val) onChanged;
  final List<T> suggestions;
  final Widget Function(BuildContext context, T t) suggestionBuilder;
  final Function(T suggestion) onSuggestionSelected;
  final Widget emptyWidget;
  final VoidCallback oneEmptyWidgetClicked;
  final Widget loadingWidget;
  final Widget errorWidget;
  final AutoSuggestionState suggestionState;
  @override
  State<AutoSuggestTextField<T>> createState() =>
      _AutoSuggestTextFieldState<T>();
}

class _AutoSuggestTextFieldState<T> extends State<AutoSuggestTextField<T>> {
  late final LayerLink layerLink;

  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    layerLink = LayerLink();
    // WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());

    widget.focusNode.addListener(
      () {
        if (widget.focusNode.hasFocus) {
          showOverlay();
        } else {
          hideOverlay();
        }
      },
    );
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    entry = OverlayEntry(
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
    );
    overlay.insert(entry!);
  }

  Widget buildOverlay() {
    switch (widget.suggestionState) {
      case AutoSuggestionState.loading:
        return widget.loadingWidget;
      case AutoSuggestionState.loaded:
        if (widget.suggestions.isEmpty) {
          return GestureDetector(
              onTap: () {
                widget.oneEmptyWidgetClicked();
                widget.focusNode.unfocus();
              },
              child: widget.emptyWidget);
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.suggestions
              .map<Widget>(
                (T suggestion) => InkWell(
                  onTap: () {
                    widget.focusNode.unfocus();
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
    entry?.remove();
    entry = null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AutoSuggestTextField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.suggestionState != widget.suggestionState ||
        oldWidget.suggestions != widget.suggestions) {
      hideOverlay();
      Future.delayed(const Duration(milliseconds: 50)).then(
        (value) {
          showOverlay();
        },
      );
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
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          errorText: widget.errorText,
          border: const OutlineInputBorder(),
          disabledBorder: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
