
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:flutter_ecogrow_customer/location/view/google_map_page.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_container_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  static const String routePath = '/location';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationCubit(),
      child: const LocationView(),
    );
  }
}

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Location'),
            actions: [
              IconButton(
                onPressed: () async {},
                icon: const Icon(Icons.location_on),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement('/main');
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppTitleWidget(text: 'Choose your delivery location'),
                    const SizedBox(height: 14),
                    Text(
                      'les’t find your unforgettable event. Choose your location below ti get started.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyColor,
                          ),
                    ),
                    const SizedBox(height: 16),
                    const AppTitleWidget(text: 'Note your Address'),
                    const SizedBox(height: 16),
                    GlobalTextField(
                      textInputType: TextInputType.text,
                      controller: TextEditingController(),
                      hintText: 'Enter your address',
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 250,
                      decoration: CustomConstantWidget.shadowBoxDecorationWidget(
                        radius: 20,
                      ),
                      width: double.infinity,
                      child: GoogleMap(
                        onCameraMoveStarted: () {
                          print('Camera move started');
                        },
                        onCameraMove: (CameraPosition cameraPosition) {},
                        onTap: (LatLng latLng) async {
                          Navigator.of(context).push(
                            MaterialPageRoute<GoogleMapPage>(
                              builder: (context) => const GoogleMapPage(),
                            ),
                          );
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            state.location!.latitude,
                            state.location!.longitude,
                          ),
                          zoom: 13,
                        ),

                        onMapCreated: context.read<LocationCubit>().controller.complete,
                        markers: {
                          state.myMarker!,
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const AppTitleWidget(
                      text: 'Your Location',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomContainerWidget(
                      title: 'Home',
                      subTitle: 'Terk laor3 Toul Kork, Phnom Penh',
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.greyColor,
                        child: Icon(Icons.home),
                      ),
                      trialing: Radio(
                        value: 'home',
                        groupValue: 'home',
                        onChanged: (value) {},
                      ),
                    ),
                    CustomContainerWidget(
                      title: 'Office',
                      subTitle: 'Sensok, Phnom Penh',
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.greyColor,
                        child: Icon(Icons.work),
                      ),
                      trialing: Radio(
                        value: 'home',
                        groupValue: 'home',
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: AppButton.roundedFilledButton(
              context,
              text: 'Save Location',
              onTap: () {
                GoRouter.of(context).pushReplacement('/main');
              },
            ),
          ),
        );
      },
    );
  }
}
