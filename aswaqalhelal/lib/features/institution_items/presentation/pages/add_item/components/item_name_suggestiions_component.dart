part of '../add_items_page.dart';

class _ItemNameSuggestionsComponent extends StatelessWidget {
  const _ItemNameSuggestionsComponent({
    Key? key,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.current;
    final bloc = context.read<AddItemBloc>();
    return BlocBuilder<AddItemBloc, AddItemState>(
      buildWhen: _ifSuggestionStateChanged,
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(
            child: AutoSuggestTextField<ReferenceItem>(
              labelText: intl.name,
              controller: controller,
              autoFocus: true,
              focusNode: focusNode,
              enabled: !state.itemFromReference && !state.addingNewItem,
              showRemoveButton: !state.isEdit,
              onRemoveSelection: () {
                bloc.add(RemoveSelectionPressed());
                controller.clear();
              },
              suggestions: state.suggestions,
              onSuggestionSelected: (item) {
                controller.text = item.name;
                focusNode.unfocus();
                bloc.add(AddItemSelectedEvent(item));
              },
              suggestionBuilder: (context, item) {
                return ListTile(
                  title: Text(item.name),
                  leading: const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                );
              },
              suggestionState: state.suggestionState,
              onEmptyWidgetClicked: () {
                focusNode.unfocus();
                bloc.add(AddNewItem(controller.text));
              },
              errorWidget: ListTile(title: Text(intl.error)),
              loadingWidget: const Center(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CircularProgressIndicator(),
                ),
              ),
              onChanged: (text) => bloc.add(AddItemSearch(text)),
            ),
          ),
        );
      },
    );
  }

  bool _ifSuggestionStateChanged(AddItemState previous, AddItemState current) =>
      previous.suggestionState != current.suggestionState ||
      previous.itemFromReference != current.itemFromReference ||
      previous.addingNewItem != current.addingNewItem;
}
