import 'package:safe_trip_driver_app/core/widgets/custom_button.dart';
import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/trip/controller/trip_controller.dart';
import 'package:safe_trip_driver_app/modules/trip/view/widgets/student_card.dart';
import 'package:safe_trip_driver_app/modules/trip/view/widgets/supervisor_card.dart';
import 'package:safe_trip_driver_app/modules/trip/view/widgets/trip_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';


class TripView extends GetView<TripController> {
  final TripModel trip = Get.arguments as TripModel;
  TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('trip_details'.tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: AppPaddings.mainScreenVerticalPadding,
          horizontal: AppPaddings.mainScreenHorizontalPadding,
        ),
        child: Column(children: [
          SupervisorCard(supervisorModel: trip.supervisor),

          /// if the trip status is finished this button will not appear
          /// if the trip status is not yet this button title will be start_trip
          /// if the trip status is working this button title will be end_trip
          trip.status != 'finished'
              ? Padding(
                padding: const EdgeInsets.only(bottom: AppPaddings.verticalPaddingBetween),
                child: GetBuilder<TripController>(
                  builder: (tripController) {
                    return CustomButton(
                                buttonTextLabel: trip.status == 'not_yet' ? 'start_trip'.tr: 'end_trip'.tr,
                                onClick: (){
                                  Get.defaultDialog(
                                    title: trip.status == 'not_yet' ? 'start_trip'.tr: 'end_trip'.tr,
                                    confirm: CustomButton(
                                      buttonTextLabel: 'confirm'.tr,
                                      onClick: () {
                                        tripController.changeTripStatus(
                                          trip.status == 'not_yet' ? 'working' : 'finished',
                                          trip.id.toString(),
                                        );
                                        // Get.offAllNamed('/home_view');
                                      },
                                    ),
                                    cancel: CustomButton(
                                      buttonTextLabel: 'cancel'.tr,
                                      onClick: () {
                                        Get.back();
                                      }
                                    )
                                  );

                                },
                              );
                  }
                ),
              )
              : const SizedBox(),



          Container(
            width: 100.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPaddings.mainScreenHorizontalPadding,
                vertical: AppPaddings.mainScreenVerticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            trip.timeStart,
                            style: regularStyle(AppFontSize.medium, AppColors.lightTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Transform.flip(
                              flipX: (Get.deviceLocale == const Locale('en', 'US')) ? false : true,
                              child: const Icon(Icons.start_outlined , color: AppColors.primaryColor,),
                            ),
                          ),
                        ]
                      ),
                      Text(
                      trip.route.addressFrom,
                        style: regularStyle(AppFontSize.small, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          children: [
                            Text(
                              trip.timeEnd,
                              style: regularStyle(AppFontSize.medium, AppColors.lightTextColor, getFontFamilyFromLanguageCode()),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.close , color: AppColors.primaryColor,),
                            ),
                          ]
                      ),
                      Text(
                        trip.route.addressTo,
                        style: regularStyle(AppFontSize.small, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),

                ]
              ),
            ),
          ),
          TripListTile(iconData: Icons.directions_bus, title: '${"bus_number".tr} : ${trip.busId}',),
          TripListTile(iconData: Icons.group, title: '${'passenger_count'.tr} : ${trip.passengerAvailable}' ,),
          TripListTile(
            iconData: Icons.start_outlined,
            title: '${'starting_point'.tr} : ${trip.route.addressFrom}',
            onPressed: () async{
              String location = trip.route.locationFrom;
              var lat = location.substring(location.indexOf('' , 0), location.lastIndexOf(','));
              var lon = location.substring(location.lastIndexOf(',')+1, location.length);
              await launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lon'), mode: LaunchMode.externalApplication);
            },
          ),
          TripListTile(
            iconData: Icons.location_on_outlined,
            title: '${'destination'.tr} : ${trip.route.addressTo}',
            onPressed: () async {
              String location = trip.route.locationTo;
              var lat = location.substring(location.indexOf('' , 0), location.lastIndexOf(','));
              var lon = location.substring(location.lastIndexOf(',')+1, location.length);
              await launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lon'), mode: LaunchMode.externalApplication);
            },
          ),



          GetBuilder<TripController>(builder: (tripController) {
            if (tripController.loading) {
              return const CircularProgressIndicator();
            } else if (tripController.loading == false &&
                tripController.studentsInTrip.isNotEmpty) {
              return SizedBox(
                  width: 100.w,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tripController.studentsInTrip.length,
                      itemBuilder: (BuildContext context, int index) {
                        return StudentCard(
                            studentModel: tripController.studentsInTrip[index],
                            onPickedUpClicked: (){
                              tripController.onPickedUpClicked(
                                  tripController.studentsInTrip[index].studentId,
                                  3, // trip.id TODO: TODO: change trip_id value from 3 to tripId variable
                              );
                            },
                            onFailureClicked: (){
                              tripController.onFailureClicked(
                                tripController.studentsInTrip[index].studentId,
                                  3, // trip.id TODO: TODO: change trip_id value from 3 to tripId variable
                              );
                            },
                          enabled: trip.status == 'working' ? true : false,
                        );
                      }
                  )
              );
            }else {
              return const Text('');
            }
          },
         ),
        ]),
      ),
    );
  }
}
