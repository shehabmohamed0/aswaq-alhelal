import 'package:aswaqalhelal/core/resources/color_manager.dart';
import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../domain/entities/order.dart';
import '../../../domain/entities/order_item.dart';
import '../../cubit/cubit/institution_orders_cubit.dart';
import '../../cubit/user_orders/user_orders_bloc.dart';
import '../../cubit/user_orders/user_orders_event.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({
    super.key,
    required this.order,
    this.isUser = false,
  });
  final Order order;
  final bool isUser;
  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _curve;
  late final Animation<double> _rotation;
  final ValueNotifier<bool> expanded = ValueNotifier(false);
  final opacityKey = GlobalKey();
  @override
  void didUpdateWidget(covariant OrderWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500));

    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    _rotation = Tween<double>(begin: 0, end: 0.5).animate(_curve);
  }

  _toggleContainer() {
    if (_curve.status != AnimationStatus.completed) {
      _controller.forward();
      expanded.value = true;
    } else {
      expanded.value = false;
      _controller.animateBack(0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        _toggleContainer();
      },
      //#C3634B
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ValueListenableBuilder<bool>(
          valueListenable: expanded,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.order.name ?? intl.anonymousUser,
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primary),
                  ),
                  const Spacer(),
                  FittedBox(
                    child: Text(
                      '${widget.order.orderNumber}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 4),
                  _OrderStateWidget(orderState: widget.order.orderState),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: ColorManager.primary,
                      shape: const CircleBorder(),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        onPressed: widget.order.phoneNumber == null
                            ? null
                            : () {
                                launchUrl(Uri.parse(
                                    "tel://${widget.order.phoneNumber}"));
                              },
                        icon: const Icon(
                          Icons.phone,
                          size: 20,
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(width: 4),
                  Text(
                    widget.order.phoneNumber ?? '----------',
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black45),
                  ),
                  const Spacer(),
                  Text(
                    timeago.format(
                      widget.order.creationTime,
                      allowFromNow: true,
                    ),
                    style: const TextStyle(color: Colors.black45),
                  )
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: RotationTransition(
                  turns: _rotation,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ],
          ),
          builder: (context, expanded, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(8),
              height: 105,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, -4))
                ],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                  bottomLeft: expanded ? const Radius.circular(8) : Radius.zero,
                  bottomRight:
                      expanded ? const Radius.circular(8) : Radius.zero,
                ),
              ),
              child: child),
        ),
        SizeTransition(
          sizeFactor: _curve,
          axis: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              shrinkWrap: true,
              itemCount: widget.order.items.length,
              itemBuilder: (context, index) =>
                  _ItemDetails(orderItem: widget.order.items[index]),
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: expanded,
          child: RichText(
            text: TextSpan(
              text: AppLocalizations.of(context).totalPrice_,
              style: TextStyle(
                  color: ColorManager.primary, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: '${widget.order.totalPrice}',
                    style: const TextStyle(color: Colors.black)),
                TextSpan(
                  text: intl.egp,
                  style: TextStyle(
                    color: Colors.amber.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          builder: (_, expanded, child) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 8,
                    offset: const Offset(0, 6))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: expanded ? const Radius.circular(8) : Radius.zero,
                  topRight: expanded ? const Radius.circular(8) : Radius.zero,
                  bottomLeft: const Radius.circular(8),
                  bottomRight: const Radius.circular(8)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                child!,
                const Spacer(),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: expanded ? 1 : 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.order.orderState.isPending)
                        TextButton(
                          onPressed: !expanded
                              ? null
                              : () {
                                  showDialog<bool>(
                                    context: context,
                                    builder: (context) => _DeclineOrderDialog(
                                        isUser: widget.isUser),
                                  ).then((decline) {
                                    if (decline ?? false) {
                                      if (widget.isUser) {
                                        context
                                            .read<UserOrdersBloc>()
                                            .add(OrderCanceled(widget.order));
                                      } else {
                                        context
                                            .read<InstitutionOrdersCubit>()
                                            .deline(widget.order);
                                      }
                                    }
                                  });
                                },
                          child: Text(
                            widget.isUser ? intl.cancel : intl.decline,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      const SizedBox(width: 4),
                      if (!widget.order.orderState.isShipping && !widget.isUser)
                        _OrderActionButton(
                          expanded: expanded,
                          orderState: widget.order.orderState,
                          onPressed: () {
                            if (widget.order.orderState == OrderState.pending) {
                              context
                                  .read<InstitutionOrdersCubit>()
                                  .acceptOrder(widget.order);
                            } else if (widget.order.orderState ==
                                OrderState.processing) {
                              context
                                  .read<InstitutionOrdersCubit>()
                                  .moveToShipping(widget.order);
                            } else {}
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class _DeclineOrderDialog extends StatelessWidget {
  const _DeclineOrderDialog({
    Key? key,
    required this.isUser,
  }) : super(key: key);
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    return SimpleDialog(
      title: Text(
        isUser
            ? intl.areYouSureToCancelTheOrder
            : intl.areYouSureToDeclineTheOrder,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      titlePadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
                style:
                    ElevatedButton.styleFrom(foregroundColor: Colors.black54),
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(intl.cancel)),
            const SizedBox(width: 4),
            OutlinedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  intl.decline,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                )),
          ],
        )
      ],
    );
  }
}

class _OrderActionButton extends StatelessWidget {
  const _OrderActionButton({
    required this.expanded,
    required this.orderState,
    required this.onPressed,
  });
  final bool expanded;
  final OrderState orderState;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    late final Color nextColor;
    late final String text;
    if (orderState == OrderState.pending) {
      nextColor = Colors.amber.shade600;
      text = 'Accept';
    } else if (orderState == OrderState.processing) {
      nextColor = Colors.blueAccent;
      text = 'To shipping';
    } else {
      text = 'Complete';
      nextColor = Colors.greenAccent;
    }

    return AnimatedOpacity(
      key: UniqueKey(),
      duration: const Duration(seconds: 300),
      opacity: expanded ? 1 : 0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: nextColor),
        onPressed: !expanded ? null : onPressed,
        child: Text(text),
      ),
    );
  }
}

class _OrderStateWidget extends StatelessWidget {
  const _OrderStateWidget({Key? key, required this.orderState})
      : super(key: key);
  final OrderState orderState;
  @override
  Widget build(BuildContext context) {
    Color color = _buildColor();
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(2),
      child: Text(
        toBeginningOfSentenceCase(orderState.toString())!,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _buildColor() {
    switch (orderState) {
      case OrderState.pending:
        return const Color(0xffC3634B);
      case OrderState.processing:
        return Colors.amber.shade600;
      case OrderState.shipping:
        return Colors.blueAccent;
      case OrderState.completed:
        return Colors.greenAccent;
      case OrderState.declined:
        return Colors.grey.shade700;
      case OrderState.canceled:
        return Colors.grey.shade700;
    }
  }
}

class _ItemDetails extends StatelessWidget {
  // ignore: unused_element
  const _ItemDetails({super.key, required this.orderItem});
  final OrderItem orderItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: SizedBox(
                child: Row(
                  children: [
                    if (orderItem.item.imageUrl == null)
                      const Expanded(
                          child: FittedBox(child: FaIcon(FontAwesomeIcons.box)))
                    else
                      CachedNetworkImage(
                        imageUrl: orderItem.item.imageUrl!,
                        height: 60,
                      ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: AutoSizeText(
                        orderItem.item.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: RichText(
                          maxLines: 1,
                          text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              text: '${orderItem.quantity}',
                              children: [
                                const TextSpan(
                                  text: ' x ',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                TextSpan(
                                  text: orderItem.unit.name,
                                  style: TextStyle(
                                      color: Colors.amber.shade700,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: RichText(
                        maxLines: 1,
                        text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            text: '${orderItem.quantity * orderItem.price}',
                            children: [
                              TextSpan(
                                text: ' EGP',
                                style: TextStyle(
                                  color: Colors.amber.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
