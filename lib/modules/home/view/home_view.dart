import 'package:safe_trip_driver_app/modules/home/view/widgets/driver_card.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/small_student_card.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/student_card.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/welcome_title.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/login/view/widgets/custom_login_button.dart';


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
            IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.notifications),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.mainScreenVerticalPadding,
            horizontal: AppPaddings.mainScreenHorizontalPadding,
          ),
          child: Column(
            children: [
              const WelcomeTitle(driverName: 'Hassan'),
              const DriverCard(
                driverFullName: 'Hassan Thabet',
                schoolName: 'MET – Metropolitan School',
                busNumber: 'س ع ص - 123',
                tripEndTime: '08:45 AM',
                tripStartTime: '07:00 AM',
              ),


              GetBuilder<HomeController>(
                builder: (homeController) {
                  if (homeController.loading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (homeController.loading == false && homeController.placeholderList.isNotEmpty){
                    return SizedBox(
                      width: 100.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeController.placeholderList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                            const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              width: 90.w,
                              // height: 30.w,
                              child: StudentCard(
                                  placeholderModel: homeController.placeholderList[index],
                                  onPickedUpClicked: (){
                                    homeController.onPickedUpClicked(homeController.placeholderList[index].id);
                                  },
                                  onFailureClicked: (){
                                    homeController.onFailureClicked(homeController.placeholderList[index].id);
                                  },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (homeController.loading == false && homeController.placeholderList.isEmpty){
                    return CustomLoginButton(
                        buttonTextLabel: 'انهاء الرحله',
                        buttonBackgroundColor: AppColors.primaryColor,
                        labelColor: AppColors.whiteTextColor,
                        onClick: (){

                        }
                    );
                  }
                  return const Center(
                    child: Text('No Data Found'),
                  );
                }
              ),


              // pickedUpStudents
              GetBuilder<HomeController>(
                  builder: (homeController) {
                    if (homeController.pickedUpList.isEmpty){
                      return const SizedBox();
                    } else {
                      return SizedBox(
                        width: 100.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: homeController.pickedUpList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: SizedBox(
                                width: 90.w,
                                // height: 30.w,
                                child: SmallStudentCard(
                                  placeholderModel: homeController.pickedUpList[index],
                                  pickedUp: true,
                                ),
                              ),
                            );
                          }
                        )
                      );
                    }
                  }
              ),


              // failure Students
              GetBuilder<HomeController>(
                  builder: (homeController) {
                    if (homeController.failureList.isEmpty){
                      return const SizedBox();
                    } else {
                      return SizedBox(
                          width: 100.w,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: homeController.failureList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                                  child: SizedBox(
                                    width: 90.w,
                                    // height: 30.w,
                                    child: SmallStudentCard(
                                      placeholderModel: homeController.failureList[index],
                                      pickedUp: false,
                                    ),
                                  ),
                                );
                              }
                          )
                      );
                    }
                  }
              ),

            ],
          ),
        )
    );
  }
}
