import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:storeapp/core/constants/map_constants.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/presentation/cubit/location_picker_cubit.dart';
import 'package:storeapp/features/orders/presentation/cubit/location_picker_state.dart';
import 'package:storeapp/features/orders/presentation/widgets/locate_me_button.dart';

class LocationPickerMap extends StatefulWidget {
  const LocationPickerMap({super.key, this.initial});

  /// Where the map starts. Cairo when null (until the device location arrives).
  final GeoPoint? initial;

  @override
  State<LocationPickerMap> createState() => _LocationPickerMapState();
}

class _LocationPickerMapState extends State<LocationPickerMap> {
  final MapController _controller = MapController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final start = widget.initial;

    return BlocListener<LocationPickerCubit, LocationPickerState>(
      listenWhen: (previous, current) =>
          previous.focusRequest != current.focusRequest,
      listener: (context, state) {
        final point = state.point;
        if (point == null) return;
        _controller.move(
          LatLng(point.lat, point.lng),
          MapConstants.pickedZoom,
        );
      },
      child: Stack(
        children: [
          FlutterMap(
            mapController: _controller,
            options: MapOptions(
              initialCenter: start == null
                  ? const LatLng(MapConstants.defaultLat, MapConstants.defaultLng)
                  : LatLng(start.lat, start.lng),
              initialZoom: start == null
                  ? MapConstants.defaultZoom
                  : MapConstants.pickedZoom,
              onTap: (tapPosition, point) {
                context
                    .read<LocationPickerCubit>()
                    .pick(GeoPoint(point.latitude, point.longitude));
              },
            ),
            children: [
              TileLayer(
                urlTemplate: MapConstants.tileUrl,
                userAgentPackageName: MapConstants.userAgentPackage,
              ),
              BlocBuilder<LocationPickerCubit, LocationPickerState>(
                buildWhen: (previous, current) => previous.point != current.point,
                builder: (context, state) {
                  final selected = state.point;
                  return MarkerLayer(
                    markers: [
                      if (selected != null)
                        Marker(
                          point: LatLng(selected.lat, selected.lng),
                          width: MapConstants.pinSize,
                          height: MapConstants.pinSize,
                          alignment: Alignment.topCenter,
                          child: const Icon(
                            Icons.location_on,
                            size: MapConstants.pinSize,
                            color: AppColors.danger,
                          ),
                        ),
                    ],
                  );
                },
              ),
              RichAttributionWidget(
                attributions: [TextSourceAttribution(MapConstants.attribution)],
              ),
            ],
          ),
          const Positioned(right: 16, bottom: 36, child: LocateMeButton()),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BlocSelector<LocationPickerCubit, LocationPickerState, bool>(
              selector: (state) => state.isLocating,
              builder: (context, isLocating) {
                return isLocating
                    ? const LinearProgressIndicator()
                    : const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
