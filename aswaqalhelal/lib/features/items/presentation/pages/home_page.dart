import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../../../institutions/presentation/widgets/institutions_widget.dart';
import '../cubit/items/items_cubit.dart';
import 'widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemsCubit>(
      create: (context) => locator()..getItems(),
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).aswaqLhelal),
          elevation: 0,
        ),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CarouselSlider(
                  items: const [
                    OfferWidget(
                      color: Colors.red,
                    ),
                    OfferWidget(
                      color: Colors.green,
                    ),
                    OfferWidget(
                      color: Colors.yellow,
                    ),
                  ],
                  options: CarouselOptions(
                      aspectRatio: 19 / 9,
                      autoPlay: true,
                      enlargeCenterPage: true),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Institutions',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const InstitutionsSliverWidget()
          ],
        ),
      ),
    );
  }
}

class OfferWidget extends StatelessWidget {
  const OfferWidget({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    );
  }
}
