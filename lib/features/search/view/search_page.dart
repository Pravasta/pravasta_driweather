import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/core/common/routes/navigation.dart';
import 'package:weather_app/core/common/routes/routes_name.dart';
import 'package:weather_app/core/components/background/background_page.dart';
import 'package:weather_app/core/components/field/default_field.dart';
import 'package:weather_app/core/constant/style/app_colors.dart';
import 'package:weather_app/core/constant/style/app_text.dart';
import 'package:weather_app/core/extensions/build_context_ext.dart';
import 'package:weather_app/features/search/bloc/get_lat_lng/get_lat_lng_bloc.dart';
import 'package:weather_app/features/search/bloc/search_address/search_address_bloc.dart';

import '../bloc/get_address/get_address_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late GoogleMapController mapController;
  late TextEditingController _searchController;
  late final Set<Marker> markers = {};
  LatLng? currentLatlng;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
    _searchController.addListener(() {
      _onChange();
    });
    context.read<GetLatLngBloc>().add(GetLatLngEvent.getLatLng());
  }

  _onChange() {
    context.read<SearchAddressBloc>().add(
          SearchAddressEvent.searchAddress(_searchController.text),
        );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void defineMarker(LatLng latlng) {
    final marker = Marker(
      markerId: MarkerId('source'),
      position: latlng,
    );

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget search() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: context.deviceWidth,
        height: _searchController.text.isEmpty
            ? context.deviceHeight * 1 / 6
            : context.deviceHeight * 1 / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: AppColors.backgroundColorLast,
        ),
        child: Column(
          children: [
            DefaultField(
              prefixIcon: IconButton(
                onPressed: () {
                  Navigation.pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.blackColor,
                ),
              ),
              controller: _searchController,
              onChanged: (value) {
                context
                    .read<SearchAddressBloc>()
                    .add(SearchAddressEvent.searchAddress(value));
              },
            ),
            Visibility(
              visible: _searchController.text.isEmpty ? false : true,
              child: BlocBuilder<SearchAddressBloc, SearchAddressState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => Expanded(child: SizedBox()),
                    loading: () => Expanded(
                        child: Center(child: CircularProgressIndicator())),
                    error: (error) =>
                        Expanded(child: Center(child: Text(error))),
                    loaded: (data) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigation.pushName(
                                  RoutesName.detail,
                                  arguments: data[index].properties!.name,
                                );
                              },
                              leading: Icon(Icons.place),
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                data[index].properties?.name ?? '',
                                style: AppText.text16.copyWith(
                                  color: AppColors.blackColor,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget mapsView() {
      return BlocBuilder<GetLatLngBloc, GetLatLngState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => SizedBox(),
            loading: () => BackgroundPage(
                child: Center(child: CircularProgressIndicator())),
            error: (error) => Center(
              child: Text(error, style: AppText.text18),
            ),
            success: (data) {
              currentLatlng = LatLng(data.latitude!, data.longitude!);
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(data.latitude!, data.longitude!),
                  zoom: 18,
                ),
                zoomControlsEnabled: true,
                mapToolbarEnabled: false,
                markers: markers,
                onMapCreated: _onMapCreated,
                onTap: (LatLng newLatlng) async {
                  defineMarker(newLatlng);

                  context.read<GetAddressBloc>().add(GetAddressEvent.getAddress(
                      newLatlng.latitude, newLatlng.longitude));

                  mapController
                      .animateCamera(CameraUpdate.newLatLng(newLatlng));
                },
                myLocationEnabled: true,
              );
            },
          );
        },
      );
    }

    Widget addressWidget() {
      return BlocBuilder<GetAddressBloc, GetAddressState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => SizedBox(),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error) => Text(
              error,
              style: AppText.text18.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            loaded: (address) {
              return GestureDetector(
                onTap: () {
                  Navigation.pushName(RoutesName.detail, arguments: address);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.backgroundColorLast,
                  ),
                  child: Text(
                    address,
                    style: AppText.text18.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GetLatLngBloc>().add(GetLatLngEvent.getLatLng());
          defineMarker(currentLatlng!);
          context.read<GetAddressBloc>().add(GetAddressEvent.getAddress(
              currentLatlng!.latitude, currentLatlng!.longitude));

          mapController.animateCamera(CameraUpdate.newLatLng(currentLatlng!));
        },
        child: Icon(Icons.my_location),
      ),
      body: Stack(
        children: [
          mapsView(),
          search(),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: addressWidget(),
          ),
        ],
      ),
    );
  }
}
