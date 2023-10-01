import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/location_controller.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';
import 'package:food_delivery_green/widgets/search_location_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../themes/app_colors.dart';

class MapScreen extends StatelessWidget {
  MapScreen({
    Key? key,
  }) : super(key: key);
  static const routName = '/map';
  late LatLng draggedPosition;
  Completer<GoogleMapController> _googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    final location = Get.find<LocationController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            GoogleMap(
              onTap: (position) {
                FocusScope.of(context).unfocus();
              },
              onMapCreated: (controller) {
                if (!_googleMapController.isCompleted) {
                  _googleMapController.complete(controller);
                }
              },
              myLocationButtonEnabled: false,
              initialCameraPosition: Get.arguments[1],
              onCameraMove: (cameraPosition) {
                draggedPosition = cameraPosition.target;
              },
              onCameraIdle: () {
                location.getDraggedAddress(draggedPosition);
              },
            ),
            Center(
              child: Image.asset(
                'assets/icons/mapPin.svg.png',
                height: 35.h,
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchLocationWidget(),
                  Container(
                    height: 181.h,
                    width: double.maxFinite,
                    margin:  EdgeInsets.symmetric(horizontal:17.w ),
                    padding:  EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      bottom: 10.h,
                      top: 24.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor.withOpacity(0.09),
                            blurRadius: 30,
                            spreadRadius: 0,
                            offset: const Offset(0, 20),
                          ),
                        ],),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Location',
                          style: subHeaderText.copyWith(
                            color: Colors.grey.shade400,
                            fontSize: 14.sp
                          ),
                        ),
                         SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Ink(
                              width: 33.w,
                              height: 33.h,
                              child: Image.asset(
                                'assets/icons/pinLogo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                             SizedBox(
                              width: 15.w,
                            ),
                            Flexible(
                              child: GetBuilder<LocationController>(
                                builder: (logic) {
                                  return Text(
                                    'Near ${location.userLocation}',
                                    style: headerText.copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        InkWell(
                          onTap: (){
                            Get.find<LocationController>().getUserLocationName();
                            Get.back();

                          },
                          child: Container(
                            width: double.maxFinite,
                            height: 57.h,
                            decoration: BoxDecoration(
                              gradient: buttonGradient,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                'Set Location',
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 230.h,
              right: 17.w,
              child: GestureDetector(
                onTap: () {
                  Get.find<LocationController>()
                      .returnToUserCurrentLocation(_googleMapController);
                },
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: const BoxDecoration(
                    gradient: buttonGradient,
                    shape: BoxShape.circle,
                  ),
                  child:  Icon(
                    Icons.location_on_sharp,
                    size: 35.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
