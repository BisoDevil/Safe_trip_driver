import 'package:safe_trip_driver_app/core/widgets/loading.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/custom_trip_card.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/driver_card.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/welcome_title.dart';
import 'package:safe_trip_driver_app/index.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home_screen_appBart_title'.tr),
          leading: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Image.asset('assets/images/app_logo.png'),
          ),
          leadingWidth: 12.w,
          actions: [
            GetBuilder<HomeController>(builder: (homeController) {
              {
                if (!homeController.loading) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.profileRoute);
                    },
                    child: CircleAvatar(
                      radius: 10.w,
                      backgroundColor: AppColors.whiteTextColor,
                      backgroundImage:
                          NetworkImage(homeController.currentDriver.image),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }
            }),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.mainScreenVerticalPadding,
            horizontal: AppPaddings.mainScreenHorizontalPadding,
          ),
          child: GetBuilder<HomeController>(
              builder: (homeController) {
            if (homeController.loading == false) {
              return Column(
                children: [
                  WelcomeTitle(driverName: controller.currentDriver.name.split(' ')[0]),
                  DriverCard(driver: controller.currentDriver,),

                  controller.tripWorkingNow.isEmpty
                      ? Text(
                          'no_trips_working_now'.tr,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      : Column(
                          children: [
                            Text(
                              'trips_working_now'.tr,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                                width: 100.w,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        homeController.tripWorkingNow.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomOnewayTripCard(
                                          trip: homeController
                                              .tripWorkingNow[index],
                                          onTap: () {
                                            homeController.onTripCardClicked(
                                                homeController
                                                    .tripWorkingNow[index]);
                                          });
                                    })),
                          ],
                        ),


                  controller.todayNotStartedTrip.isNotEmpty
                      ? Padding(
                        padding: const EdgeInsets.only(top: AppPaddings.verticalPaddingBetween),
                        child: Column(
                            children: [
                              Text(
                                'trips_start_soon'.tr,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                  width: 100.w,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: homeController
                                          .todayNotStartedTrip.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CustomOnewayTripCard(
                                            trip: homeController
                                                .todayNotStartedTrip[index],
                                            onTap: () {
                                              homeController.onTripCardClicked(
                                                  homeController
                                                          .todayNotStartedTrip[
                                                      index]);
                                            });
                                      })),
                            ],
                          ),
                      )
                      : const SizedBox(),

                  controller.tripFinishedToday.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.only(top: AppPaddings.verticalPaddingBetween),
                    child: Column(
                      children: [
                        Text(
                          'trips_finished_now'.tr,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                            width: 100.w,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics:
                                const NeverScrollableScrollPhysics(),
                                itemCount: homeController
                                    .tripFinishedToday.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return CustomOnewayTripCard(
                                      trip: homeController
                                          .tripFinishedToday[index],
                                      onTap: () {
                                        homeController.onTripCardClicked(
                                            homeController
                                                .tripFinishedToday[
                                            index]);
                                      });
                                })),
                      ],
                    ),
                  )
                      : const SizedBox(),

                  ],
              );
            } else {
              return const Center(
                child: Loading(),
              );
            }
          }),
        ));
  }
}
