import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/location/cubit/location_cubit.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  void initState() {
    context.read<LocationCubit>().getCurrentLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state.status == LocationStatus.loaded) {
          context.loaderOverlay.hide();
        }
      },
      builder: (context, state) {
        if (state.status == LocationStatus.loading) {
           context.loaderOverlay.show();
        }
       return  Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                onCameraMoveStarted: () {
                  context.read<LocationCubit>().onCameraStarted(state.location!);
                },
                onCameraMove: (CameraPosition cameraPosition) async {
                  await context.read<LocationCubit>().getDataWhenCameraMove(cameraPosition);

                },
                onCameraIdle: () {
                  context.read<LocationCubit>().onCameraStoppedMoving();
                },
                // onTap: (LatLng latLng) async {
                //   await bloc.getOnTapData(latLng);
                // },
                initialCameraPosition: CameraPosition(
                  target: state.location!,
                  zoom: 13,
                ),
                onMapCreated: (GoogleMapController controller) {
                  context.read<LocationCubit>().controller.complete(controller);
                },
                markers: {
                    state.myMarker!,
                },
              ),
              Positioned(
                top: 50,
                left: 30,
                child: AppButton.circleButton(
                  context,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.close,
                ),
              ),
            ],
          ),
          bottomSheet: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Your delivery will be delivery to your pinned location ,\n you can edit your written address for more accuracy',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const AppTitleWidget(
                  text: 'Add new address',
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 10,
                    ),
                    state.status == LocationStatus.loaded
                        ? Text(
                      context.read<LocationCubit>().getLocationAddress(),
                      maxLines: 2,
                      softWrap: false,
                      textWidthBasis: TextWidthBasis.longestLine,
                      style: Theme.of(context).textTheme.titleLarge,
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      ),
                    )
                        : const Text('Loading...'),
                    const Spacer(),
                    const Icon(Icons.edit),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const AppTitleWidget(
                  text: "We're missing your address",
                ),
                const SizedBox(
                  height: 16,
                ),
                GlobalTextField(
                  textInputType: TextInputType.text,
                  controller: TextEditingController(),
                  hintText: 'House numbers',
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
              top: 16,
            ),
            child: AppButton.roundedFilledButton(
              context,
              onTap: () {
                Navigator.pop(context);
              },
              text: 'Save Address',
            ),
          ),
        );
      },
    );
  }
}
