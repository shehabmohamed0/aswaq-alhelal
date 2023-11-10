import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/extensions/prepare_for_search.dart';
import '../../../institution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';

class FirestoreSuggestionsTextField<T> extends StatefulWidget {
  const FirestoreSuggestionsTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.collectionPath,
    required this.fieldName,
    required this.parseFunction,
    required this.minCharsForSuggestions,
    required this.emptySuggestionsWidget,
    this.beforeSearchQuery,
    this.suggestionBuilder,
    required this.onSuggestionSelected,
    required this.onEmptyWidgetClicked,
    required this.suggestionToString,
    required this.onRemoveSelection,
    this.enable = true,
    this.showRemoveButton = false,
    this.autoFocus = false,
    this.validator,
    this.autovalidateMode,
    this.errorText,
    this.labelText,
    this.errorStyle,
    this.fixedSuggestions,
    required this.additionAvailible,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final String collectionPath;
  final String fieldName;
  final bool additionAvailible;
  final T Function(QueryDocumentSnapshot<Map<String, dynamic>> document)
      parseFunction;
  final int minCharsForSuggestions;
  final String Function(T suggestion) suggestionToString;
  final Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)?
      beforeSearchQuery;
  final Widget Function(BuildContext context, T suggestion)? suggestionBuilder;
  final void Function(T) onSuggestionSelected;
  final void Function() onEmptyWidgetClicked;
  final void Function() onRemoveSelection;
  final bool enable;
  final bool showRemoveButton;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  final String? labelText;
  final TextStyle? errorStyle;
  final List<T>? fixedSuggestions;
  final Widget emptySuggestionsWidget;
  @override
  State<FirestoreSuggestionsTextField<T>> createState() =>
      _FirestoreSuggestionsTextFieldState<T>();
}

class _FirestoreSuggestionsTextFieldState<T>
    extends State<FirestoreSuggestionsTextField<T>> {
  late final StreamController<String> streamController;
  late final StreamSubscription<String> subscription;

  AutoSuggestionState suggestionState = AutoSuggestionState.emptyText;
  List<T> suggestions = [];

  @override
  void initState() {
    super.initState();
    streamController = StreamController();
    subscription = streamController.stream
        .debounceTime(const Duration(milliseconds: 300))
        .listen(
      (text) async {
        try {
          setState(() => suggestionState = AutoSuggestionState.loading);

          final searchText = text /*.prepareForSearch()*/;
          if (searchText.length < widget.minCharsForSuggestions) {
            setState(() {
              suggestions = [];
              suggestionState = AutoSuggestionState.emptyText;
            });
            return;
          }
          suggestions = await getSuggestion(searchText);
          if (widget.fixedSuggestions != null) {
            suggestions.addAll(widget.fixedSuggestions!);
          }
          if (suggestions.isEmpty) {
            setState(() => suggestionState = AutoSuggestionState.loaded);
            return;
          }
          if (widget.additionAvailible) {
            final suggestionNameExsits =
                _suggestionNameEqualsSearchText(searchText);
            suggestionState = suggestionNameExsits
                ? AutoSuggestionState.loaded
                : AutoSuggestionState.loadedButCanAdd;
          } else {
            suggestionState = AutoSuggestionState.loaded;
          }
          setState(() {});
        } catch (e) {
          // rethrow;
          suggestionState = AutoSuggestionState.error;
        }
        setState(() {});
      },
    );
  }

  bool _suggestionNameEqualsSearchText(String searchText) {
    return suggestions.indexWhere(
          (element) =>
              widget.suggestionToString(element).prepareForSearch() ==
              searchText,
        ) !=
        -1;
  }

  Future<List<T>> getSuggestion(String pattern) async {
    var collection =
        FirebaseFirestore.instance.collection(widget.collectionPath);

    var query = _applyBeforeSearchQuery(collection);

    return query
        .where(widget.fieldName, isGreaterThanOrEqualTo: pattern)
        .where(widget.fieldName, isLessThanOrEqualTo: "$pattern\uf8ff")
        .orderBy(widget.fieldName)
        .get()
        .then(
          (value) => value.docs.map(widget.parseFunction).toList(),
        );
  }

  Query<Map<String, dynamic>> _applyBeforeSearchQuery(
      Query<Map<String, dynamic>> query) {
    if (widget.beforeSearchQuery == null) {
      return query;
    }

    return widget.beforeSearchQuery!(query);
  }

  @override
  void dispose() {
    subscription.cancel();
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoSuggestTextField<T>(
      controller: widget.controller,
      focusNode: widget.focusNode,
      suggestions: suggestions,
      suggestionBuilder: widget.suggestionBuilder ??
          (context, suggestion) => ListTile(
                title: Text(
                  widget.suggestionToString(suggestion),
                ),
              ),
      onSuggestionSelected: (suggestion) {
        widget.onSuggestionSelected(suggestion);
        widget.focusNode.unfocus();
      },
      onEmptyWidgetClicked: () {
        widget.onEmptyWidgetClicked();
        widget.focusNode.unfocus();
      },
      onChanged: (text) {
        streamController.add(text);
      },
      suggestionState: suggestionState,
      onRemoveSelection: widget.onRemoveSelection,
      enabled: widget.enable,
      showRemoveButton: widget.showRemoveButton,
      autoFocus: widget.autoFocus,
      autovalidateMode: widget.autovalidateMode,
      emptyWidget: widget.emptySuggestionsWidget,
      errorStyle: widget.errorStyle,
      errorText: widget.errorText,
      errorWidget: null,
      labelText: widget.labelText,
      loadingWidget: null,
      validator: widget.validator,
    );
  }
}
