import 'package:safe_trip_driver_app/index.dart';


class SmallStudentCard extends StatelessWidget {
  final bool pickedUp;
  // final PlaceholderModel placeholderModel;
  const SmallStudentCard({super.key,required this.pickedUp});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: AppPaddings.cardVerticalContentPadding,
          horizontal: AppPaddings.cardHorizontalContentPadding,
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
                  child: Image.network(
                    'https://placehold.co/600x400/png',
                    width: 16.w,
                    height: 16.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPaddings.cardHorizontalContentPadding),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "student name",
                          // placeholderModel.name,
                          style: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                          overflow: TextOverflow.ellipsis,

                        ),
                        Text(
                          '07:53 AM', // TODO: time changed on " time "
                          style: regularStyle(AppFontSize.small, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: pickedUp ? AppColors.successColor : AppColors.errorColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Text(
                      'Picked Up',
                      style: regularStyle(AppFontSize.xSmall, AppColors.whiteTextColor, getFontFamilyFromLanguageCode())
                    ),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
