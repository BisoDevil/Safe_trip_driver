
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomSelectableListTile extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  final Color color;
  final bool active;
  const CustomSelectableListTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.active
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        tileColor: color,
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: color.withAlpha(10),
          child: Icon(
            active ? Icons.circle : Icons.circle_outlined,
            color: AppColors.primaryColor ,
          ),
        ),
        title: Text(
          title,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onTap: onTap,
      ),
    );
  }
}
