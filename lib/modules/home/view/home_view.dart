import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_trip_driver_app/core/constants/app_strings.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/driver_card.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/student_card.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/welcome_title.dart';
import 'package:safe_trip_driver_app/utils/extensions.dart';
import '../../../core/theme/app_values.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.homeScreenAppBarTitle),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPaddings.mainScreenVerticalPadding,
              horizontal: AppPaddings.mainScreenHorizontalPadding ,
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
                SizedBox(
                  width: 100.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 90.w,
                          // height: 30.w,
                          child: StudentCard(
                            studentName: 'Student ${index+1}',
                            studentPhoneNumber: 'Student ${index+1} number',
                            studentAddress: 'Student ${index+1} address',
                            studentImage: 'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/327956224_635777864984630_6104602601865062634_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHznGeR9b13dHy6baUVRMpmBEI_p6ErRXMEQj-noStFc5bnf3E2aRnXaXigfexVMqFW6SdzOixzGTeFFhUivsao&_nc_ohc=2i4Bsg4M8EkAX_O5bXM&_nc_ht=scontent.faly1-2.fna&oh=00_AfDW5X-a8ufGmrndvlG8SHOCMq-XKwrDLZnHvpuT_643Sg&oe=65373279',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
