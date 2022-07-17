import 'widgets/item_grid_widget.dart';
import 'widgets/item_list_tile.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../instutution_items/domain/entities/institution_item.dart';
import '../../../instutution_items/domain/entities/unit.dart';
import '../../../instutution_items/presentation/widgets/item_widget.dart';
import 'widgets/app_drawer.dart';
import 'widgets/items_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).aswaqLhelal),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ItemsWidget(),
      ),
    );
  }
}
/*

 InstitutionItem(
                    id: 'id',
                    referenceId: 'referenceId',
                    institutionId: 'institutionId',
                    name: 'shehab',
                    units: [Unit(name: 'name', quantity: 10, price: 10)])
 */
/*
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
 */
