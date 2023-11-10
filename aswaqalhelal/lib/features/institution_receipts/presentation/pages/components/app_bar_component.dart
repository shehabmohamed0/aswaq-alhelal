part of '../receipt_page.dart';

class _AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final cubit = context.read<InstitutionReceiptsCubit>();
    final userId =
        context.select((AppBloc element) => element.state.profile.id);
    final institution =
        ModalRoute.of(context)!.settings.arguments as InstitutionProfile;
    return AppBar(
      centerTitle: false,
      title: Text(intl.receipt),
      elevation: 0,
      actions: [
        BlocBuilder<InstitutionReceiptsCubit, InstitutionReceiptsState>(
          buildWhen: (previous, current) =>
              previous.savedOrder != current.savedOrder,
          builder: (context, state) {
            return IconButton(
              style: IconButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: state.savedOrder.isSome()
                  ? () async {
                      savePdfFile(
                        'fileName',
                        await createPdf(
                          state.savedOrder.toNullable()!,
                        ),
                      );
                    }
                  : null,
              splashRadius: 24,
              icon: Icon(
                Icons.print,
                color: state.savedOrder.isSome()
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
            );
          },
        ),
        const SizedBox(width: 4),
        BlocBuilder<InstitutionReceiptsCubit, InstitutionReceiptsState>(
          buildWhen: (previous, current) =>
              previous.totalPrice != current.totalPrice ||
              previous.savedOrder != current.savedOrder ||
              previous.receiptItems != current.receiptItems,
          builder: (context, state) {
            return IconButton(
              onPressed:
                  state.receiptItems.isNotEmpty && state.savedOrder.isNone()
                      ? () => cubit.saveReceipt(
                            institution,
                            userId,
                          )
                      : null,
              splashRadius: 24,
              icon: Icon(
                Icons.save,
                color:
                    state.receiptItems.isNotEmpty && state.savedOrder.isNone()
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
              ),
            );
          },
        ),
        BlocBuilder<InstitutionReceiptsCubit, InstitutionReceiptsState>(
          builder: (context, state) {
            return TextButton(
              onPressed: () async {
                if (state.savedOrder.isSome()) {
                  cubit.reset();
                  return;
                }
                final reset = await showDialog<bool>(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title:
                            Text(intl.areYouSureToAddANewReceiptPreviousData),
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
                  cubit.reset();
                }
              },
              child: Text(intl.new_),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
