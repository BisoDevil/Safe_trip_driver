
import 'package:safe_trip_driver_app/data/models/contact_us_model.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/profile/view/widgets/custom_list_tile.dart';

class ContactUsBottomSheet extends StatelessWidget {
  final ContactUsModel contactUsModel;
  const ContactUsBottomSheet({super.key, required this.contactUsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 40.h,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPaddings.mainScreenVerticalPadding , horizontal: AppPaddings.mainScreenHorizontalPadding),
        child: ListView(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('contact_us'.tr , style: regularStyle(AppFontSize.large, AppColors.inactiveTextColor, getFontFamilyFromLanguageCode()),),
            SizedBox(height: 3.h,),
            CustomListTile(
                leadingIcon: Icons.phone,
                title: contactUsModel.phone,
                onTap: (){},
                color: Colors.white,
                trailing: false,
                logout: true,
            ),
            CustomListTile(
                leadingIcon: Icons.phone_android,
                title: contactUsModel.mobile,
                onTap: (){},
                color: Colors.white,
                trailing: false,
                logout: true
            ),
            CustomListTile(
                leadingIcon: Icons.facebook_outlined,
                title: contactUsModel.facebook,
                onTap: (){},
                color: Colors.white,
                trailing: false,
                logout: true
            ),
            CustomListTile(
                leadingIcon: Icons.facebook_outlined,
                title: contactUsModel.twitter,
                onTap: (){},
                color: Colors.white,
                trailing: false,
                logout: true
            ),
            CustomListTile(
                leadingIcon: Icons.facebook_outlined,
                title: contactUsModel.instagram,
                onTap: (){},
                color: Colors.white,
                trailing: false,
                logout: true
            ),
            CustomListTile(
                leadingIcon: Icons.facebook_outlined,
                title: contactUsModel.linkedin,
                onTap: (){},
                color: Colors.white,
                trailing: false,
                logout: true
            ),



          ],
        ),
      ),
    );
  }
}
