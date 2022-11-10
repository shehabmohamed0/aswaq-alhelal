part of '../add_items_page.dart';

class _NewButtonComponent extends StatelessWidget {
  const _NewButtonComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    return BlocBuilder<AddItemBloc, AddItemState>(
      buildWhen: _succefullyAddedAnItemOrStartToAddNewOne,
      builder: (context, state) {
        return TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () async {
              if (state.status == AddItemStatus.success) {
                context.read<AddItemBloc>().add(NewButtonClicked());
                return;
              }
              if (state.itemName.pure &&
                  state.imageFile.pure &&
                  state.imageUrl.pure &&
                  context.read<ItemUnitsBloc>().state.units.first.isPure()) {
                // context.read<AddItemBloc>().add(NewButtonClicked());

                return;
              }
              final reset = await showDialog<bool>(
                    context: context,
                    builder: (context) => SimpleDialog(
                      title: Text(intl.areYouSureToAddNewItemPreviousDataWill),
                      contentPadding:
                          const EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 16.0),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Text(intl.yes)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: Text(intl.cancel)),
                          ],
                        )
                      ],
                    ),
                  ) ??
                  false;
              if (reset) {
                // ignore: use_build_context_synchronously
                context.read<AddItemBloc>().add(NewButtonClicked());
              }
            },
            child: Text(intl.new_));
      },
    );
  }

  bool _succefullyAddedAnItemOrStartToAddNewOne(
      AddItemState previous, AddItemState current) {
    return (previous.status != current.status &&
            (current.status == AddItemStatus.success ||
                current.status == AddItemStatus.reset)) ||
        current.isEdit && current.status == AddItemStatus.initial;
  }
}
