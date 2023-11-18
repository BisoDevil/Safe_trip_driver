import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_values.dart';

class TripListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback? onPressed;

  const TripListTile({super.key, required this.iconData, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        tileColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.cardBorderRadius)),
        ),
        leading: Icon(iconData , color: AppColors.primaryColor,),
        title: Text(title),
        onTap: onPressed,
      ),
    );
  }
}
