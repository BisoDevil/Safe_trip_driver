
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomListTile extends StatelessWidget {

  final IconData leadingIcon;
  final String title;
  final VoidCallback onTap;
  final Color color;
  final bool logout;
  final bool? trailing;
  const CustomListTile({super.key, required this.leadingIcon, required this.title,required this.onTap, required this.color, required this.logout, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        tileColor: Colors.white,
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: color.withAlpha(10),
          child: Icon(
            leadingIcon,
            color: logout ? AppColors.lightIconColor : AppColors.errorColor,
          ),
        ),
        title: Text(
          title,
        ),
        trailing:
        (trailing == true) ?
        (logout)
            ? const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: AppColors.primaryColor,
            )
            : null
        : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onTap: onTap,
      ),
    );
  }
}
