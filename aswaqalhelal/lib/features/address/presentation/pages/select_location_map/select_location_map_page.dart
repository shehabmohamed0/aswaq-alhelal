import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../bloc/select_location_map/select_location_map_bloc.dart';

class SelectLocationMapPage extends StatefulWidget {
  const SelectLocationMapPage({Key? key}) : super(key: key);

  @override
  State<SelectLocationMapPage> createState() => _SelectLocationMapPageState();
}

class _SelectLocationMapPageState extends State<SelectLocationMapPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectLocationMapBloc>();
    final geoPoint = ModalRoute.of(context)?.settings.arguments as GeoPoint?;
    late GoogleMapController _mapController;
    return Scaffold(
      appBar: AppBar(
        title: Text('intl.deliveryLocation'),
        elevation: 1,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Stack(
        children: [
          BlocConsumer<SelectLocationMapBloc, SelectLocationMapState>(
            listener: (context, state) {
              if (state.mapStatus == MapStatus.locationSelected) {
                _mapController
                    .animateCamera(CameraUpdate.newLatLng(state.position));
              }
            },
            buildWhen: (_, __) => false,
            builder: (context, state) {
              return Positioned(
                top: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                        target: geoPoint == null
                            ? state.position
                            : LatLng(geoPoint.lat, geoPoint.long),
                        zoom: 16.0),
                    onMapCreated: (mapController) {
                      _mapController = mapController;
                    },
                    onCameraMoveStarted: () {
                      bloc.add(CameraMoveStarted());
                    },
                    onCameraMove: (position) {
                      bloc.add(CameraMoving(position));
                    },
                    onCameraIdle: () {
                      bloc.add(CameraIdle());
                    },
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 90,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                primary: Colors.white,
                onPrimary: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                bloc.add(GetUserLocation());
              },
              child: const Icon(
                Icons.gps_fixed,
              ),
            ),
          ),
          /*,*/
          Positioned(
              right: 20,
              left: 20,
              bottom: 20,
              child: BlocBuilder<SelectLocationMapBloc, SelectLocationMapState>(
                buildWhen: ((previous, current) =>
                    previous.mapStatus != current.mapStatus),
                builder: (context, state) {
                  return Visibility(
                    visible: state.mapStatus != MapStatus.cameraMoving,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child:  Text('intl.confirm'),
                      onPressed: () {
                        final geoPoint = GeoPoint(
                            lat: state.position.latitude,
                            long: state.position.longitude);
                        Navigator.pop(context, geoPoint);
                      },
                    ),
                  );
                },
              )),
          /*.*/
          Align(
            alignment: Alignment.center,
            child: BlocBuilder<SelectLocationMapBloc, SelectLocationMapState>(
              buildWhen: ((previous, current) =>
                  previous.mapStatus != current.mapStatus),
              builder: (context, state) {
                return Opacity(
                    opacity:
                        state.mapStatus == MapStatus.cameraMoving ? 0.5 : 1,
                    child: const MapCenterMarker());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MapCenterMarker extends StatelessWidget {
  const MapCenterMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CenterMapMarker(Theme.of(context).primaryColor),
    );
  }
}

class CenterMapMarker extends CustomPainter {
  final Color color;
  CenterMapMarker(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = color;
    canvas.drawCircle(
      const Offset(0, -34),
      12,
      paint,
    );
    paint.strokeWidth = 3;
    canvas.drawLine(const Offset(0, 0), const Offset(0, -34), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
