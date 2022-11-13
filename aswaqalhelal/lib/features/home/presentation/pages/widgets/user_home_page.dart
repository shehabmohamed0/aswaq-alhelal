part of '../home_page.dart';

class UserHomeWidget extends StatefulWidget {
  const UserHomeWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final InstitutionsCubit cubit;

  @override
  State<UserHomeWidget> createState() => _UserHomeWidgetState();
}

class _UserHomeWidgetState extends State<UserHomeWidget> {
  @override
  void dispose() {
    widget.cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    return BlocConsumer<AppBloc, AppState>(
      listenWhen: (previous, current) {
        if (previous.profile.isUser && current.profile.isUser) {
          final prevUser = previous.profile as UserProfile;
          final currUser = current.profile as UserProfile;
          if (prevUser.address != currUser.address) {
            return true;
          }
        }
        return false;
      },
      listener: (context, state) {
        dismissLoadingDialog();
        widget.cubit.getInstitutions(state.profile.toUser().address!);
      },
      buildWhen: (previous, current) {
        if (previous.profile.isUser && current.profile.isUser) {
          final prevUser = previous.profile as UserProfile;
          final currUser = current.profile as UserProfile;
          if (prevUser != currUser) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        final user = state.profile as UserProfile;
        final address = user.address!;
        return RefreshIndicator(
          onRefresh: () async {
            return widget.cubit.getInstitutions(address);
          },
          child: CustomScrollView(
            clipBehavior: Clip.antiAlias,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   intl.location,
                            //   style: const TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.black45),
                            // ),
                            // const SizedBox(height: 4),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  clipBehavior: Clip.antiAlias,
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8),
                                    ),
                                  ),
                                  builder: (context) => AddressesBottomSheet(
                                    userId: user.id,
                                    currentAddress: user.address!,
                                    // cubit: widget.cubit
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on_rounded,
                                      size: 20),
                                  const SizedBox(width: 2),
                                  Flexible(
                                    child: Text(
                                      '${address.neighborhood} - ${address.city} - ${address.governate}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16) +
                    const EdgeInsets.only(top: 4),
                sliver: SliverToBoxAdapter(
                  child: Text(intl.institutions,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w600)),
                ),
              ),
              const InstitutionsSliverWidget()
            ],
          ),
        );
      },
    );
  }
}

class AddressesBottomSheet extends StatefulWidget {
  const AddressesBottomSheet({
    super.key,
    required this.userId,
    required this.currentAddress,
  });
  final String userId;
  final Address currentAddress;
  @override
  State<AddressesBottomSheet> createState() => _AddressesBottomSheetState();
}

class _AddressesBottomSheetState extends State<AddressesBottomSheet> {
  List<Address>? addresses;
  bool isError = false;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection(FirestorePath.addresses(widget.userId))
        .get(const GetOptions(source: Source.cache))
        .then((sapshot) {
      setState(() {
        addresses = sapshot.docs.map(AddressModel.fromFirestore).toList();
      });
    }).onError((error, stackTrace) {
      setState(() {
        isError = true;
        addresses = [];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    if (isError) {
      return CheckInternetConnection(onPressed: () {});
    }
    if (addresses == null) {
      return Column(children: const [LoadingWidget()]);
    }
    log(MediaQuery.of(context).size.width.toString());

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text(
            intl.chooseDeliveryLocation,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ),
        if (addresses?.isNotEmpty ?? false)
          ...addresses!
              .map((address) => Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 32,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: AddressWidget(
                          address: address,
                          onTap: widget.currentAddress.id == address.id
                              ? () {}
                              : () {
                                  showLoadingDialog();
                                  FirebaseFirestore.instance
                                      .doc(FirestorePath.profile(widget.userId))
                                      .update({
                                    'address':
                                        (address as AddressModel).toJson()
                                  }).then((value) {
                                    // widget.cubit.getInstitutions(address);
                                    // EasyLoading.dismiss();
                                    Navigator.pop(context);
                                  }).onError((error, stackTrace) {
                                    dismissLoadingDialog();
                                    showErrorSnackBar(
                                        context, intl.somethingWentWrong);
                                  });
                                },
                        ),
                      ),
                    ],
                  ))
              .toList(),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.addAddresses).then((value) {
                final address = value as Address?;
                //   if (address != null) {
                //     setState(() {
                //       addresses!.add(address);
                //       widget.cubit.getInstitutions(address);
                //     });
                //     Navigator.pop(context);
                //   }
              });
            },
            child: Row(
              children: [
                const SizedBox(
                  height: 22,
                  child: Align(
                    alignment: Alignment(0, 1),
                    child: MapCenterMarker(
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 22),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      intl.deliverToDifferentAddress,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      intl.addNewAddress,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class LocationListTile extends StatelessWidget {
  const LocationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 100,
    );
  }
}
