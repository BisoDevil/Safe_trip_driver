import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/trip/controller/trip_controller.dart';
import 'package:safe_trip_driver_app/modules/trip/view/widgets/student_card.dart';
import 'package:safe_trip_driver_app/modules/trip/view/widgets/supervisor_card.dart';
import 'package:safe_trip_driver_app/modules/trip/view/widgets/trip_list_tile.dart';


class TripView extends StatelessWidget {
  final TripModel trip = Get.arguments as TripModel;
  TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('trip details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: AppPaddings.mainScreenVerticalPadding,
          horizontal: AppPaddings.mainScreenHorizontalPadding,
        ),
        child: Column(children: [
          SupervisorCard(supervisorModel: trip.supervisor),
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
          TripListTile(iconData: Icons.directions_bus, title: 'رقم الباص : ${trip.busId}',),
          TripListTile(iconData: Icons.group, title: 'عدد الركاب : ${trip.passengerAvailable}' ,),
          TripListTile(
            iconData: Icons.start_outlined,
            title: 'مكان الانطلاق : ${trip.route.addressFrom}',
            onPressed: (){},
          ),
          TripListTile(
            iconData: Icons.location_on_outlined,
            title: 'الوجهه : ${trip.route.addressTo}',
            onPressed: (){},
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
                            onPickedUpClicked: (){},
                            onFailureClicked: (){},
                        );
                      }
                  )
              );
            }else {
              return const Text('');
            }
          })
        ]),
      ),
    );
  }
}
