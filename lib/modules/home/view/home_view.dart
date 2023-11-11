import 'package:safe_trip_driver_app/core/widgets/loading.dart';
import 'package:safe_trip_driver_app/data/models/school_model.dart';
import 'package:safe_trip_driver_app/data/models/student_model.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/custom_trip_card.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/driver_card.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/welcome_title.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/trip/view/widgets/second_student_card.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTranslationKeys.homeScreenAppBarTitle.tr),
          leading: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Image.asset('assets/images/app_logo.png'),
          ),
          leadingWidth: 12.w,
          actions: [
            GetBuilder<HomeController>(
              builder: (homeController) {
                {
                  if (!homeController.loading)
                  {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.profileRoute);
                      },
                      child: CircleAvatar(
                        radius: 10.w,
                        backgroundColor: AppColors.whiteTextColor,
                        backgroundImage:NetworkImage(homeController.currentDriver.image),
                      ),
                    );
                  }else {
                    return const SizedBox();
                  }

                }
              }
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.mainScreenVerticalPadding,
            horizontal: AppPaddings.mainScreenHorizontalPadding,
          ),
          child: GetBuilder<HomeController>(
            builder: (homeController) {
              if (homeController.loading == false)
                {
                  return Column(
                    children: [
                      WelcomeTitle(driverName: homeController.currentDriver.name.split(' ')[0]),
                      DriverCard(
                        driver: homeController.currentDriver,
                      ),

                      GetBuilder<HomeController>(
                          builder: (homeController) {
                            if (homeController.tripWorkingNow.isEmpty){
                              return Center(child: Text(AppTranslationKeys.noTripsWorkingNow.tr),);
                            } else {
                              return Column(
                                children: [
                                  Text(AppTranslationKeys.tripsWorkingNow.tr, style: Theme.of(context).textTheme.titleMedium,),
                                  SizedBox(
                                      width: 100.w,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: homeController.tripWorkingNow.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return CustomOnewayTripCard(
                                                trip: homeController.tripWorkingNow[index],
                                                onTap: () {
                                                  homeController.onTripCardClicked(homeController.tripWorkingNow[index]);
                                                }
                                             );
                                          }
                                      )
                                  ),
                                ],
                              );
                            }
                          }
                      ),

                      GetBuilder<HomeController>(
                            builder: (homeController) {
                              if (homeController.todayNotStartedTrip.isEmpty){
                                return Center(child: Text(AppTranslationKeys.noTripsStartSoon.tr),);
                              } else {
                                return Column(
                                  children: [
                                    Text(AppTranslationKeys.tripsStartSoon.tr, style: Theme.of(context).textTheme.titleMedium,),

                                    SizedBox(
                                        width: 100.w,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: homeController.todayNotStartedTrip.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return CustomOnewayTripCard(
                                                  trip: homeController.todayNotStartedTrip[index],
                                                  onTap: () {
                                                    homeController.onTripCardClicked(homeController.todayNotStartedTrip[index]);
                                                  }
                                              );
                                            }
                                        )
                                    ),
                                  ],
                                );
                              }
                            }
                        ),

                      GetBuilder<HomeController>(
                          builder: (homeController) {
                            if (homeController.tripFinishedToday.isEmpty){
                              return Center(child: Text(AppTranslationKeys.noTripsFinishedToday.tr),);
                            } else {
                              return Column(
                                children: [
                                  Text('الرحلات التي انتهت اليوم', style: Theme.of(context).textTheme.titleMedium,),

                                  SizedBox(
                                      width: 100.w,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: homeController.tripFinishedToday.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return CustomOnewayTripCard(
                                                trip: homeController.tripFinishedToday[index],
                                                onTap: () {
                                                  homeController.onTripCardClicked(homeController.tripFinishedToday[index]);
                                                }
                                            );
                                          }
                                      )
                                  ),
                                ],
                              );
                            }
                          }
                      ),


                      SecondStudentCard(studentModel: StudentModel(id: 1, studentId: 1, status: 'waiting', student: Student(id: 1, logo: 'https://safetrip.inhouse.sa/storage/app/uploads/1697606979.webp', name: "Wynter Donaldson", gender: 'female', address: 'Velit est reprehend', schoolModel: SchoolModel(id: 1, name: 'school', phone: '8263478236', email: 'email', address: 'address', logo: 'logo', location: 'location'))))
                    ],
                  );
                } else{
                return const Center(child: Loading(),);
              }

            }
          ),
        )
    );
  }
}
