import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../address/domain/entities/geo_point.dart';
import '../cubit/location_widget/location_widget_cubit.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget(
      {Key? key, required this.onGeoPointSelected, this.geoPoint})
      : super(key: key);
  final void Function(GeoPoint geoPoint) onGeoPointSelected;
  final GeoPoint? geoPoint;

  @override
  Widget build(BuildContext context) {
    if (geoPoint != null) {
      context.read<LocationWidgetCubit>().geoPointChanged(geoPoint!);
    }
    return BlocConsumer<LocationWidgetCubit, LocationWidgetState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == LocationWidgetStatus.loaded) {
          onGeoPointSelected(state.geoPointOrNull.toNullable()!);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Location',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                if (state.status == LocationWidgetStatus.loading)
                  SizedBox.square(
                      dimension: 16, child: CircularProgressIndicator())
                else if (state.status == LocationWidgetStatus.loaded)
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  )
              ],
            ),
            SizedBox(height: 8),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {
                context.read<LocationWidgetCubit>().getCurrentLocation();
              },
              label: Text(
                'Current location',
                style: TextStyle(fontSize: 16),
              ),
              icon: const Icon(
                Icons.my_location,
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
              ),
              label: Text('Select location', style: TextStyle(fontSize: 16)),
              icon: const Icon(
                Icons.location_on_outlined,
                size: 28,
              ),
              onPressed: () async {
                Navigator.of(context)
                    .pushNamed(Routes.selectLocationMap,
                        arguments: state.geoPointOrNull.toNullable())
                    .then((geoPoint) {
                  if (geoPoint != null) {
                    context
                        .read<LocationWidgetCubit>()
                        .geoPointChanged(geoPoint as GeoPoint);
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }
}
