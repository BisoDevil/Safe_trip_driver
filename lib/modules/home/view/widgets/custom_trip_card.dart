
import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/index.dart';


class CustomOnewayTripCard extends StatelessWidget {
  final TripModel trip;
  final VoidCallback onTap;
  const CustomOnewayTripCard({super.key, required this.trip, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteTextColor,
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            splashColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      vertical: AppPaddings.cardVerticalContentPadding,
                      horizontal: AppPaddings.cardHorizontalContentPadding,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${AppTranslationKeys.from.tr} :',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  trip.timeStart,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Transform.flip(
                                  flipX: (Get.deviceLocale == const Locale('en', 'US')) ? false : true,
                                  child: Image.asset('assets/images/school-bus.png', height: 4.h , width: 8.w, ),
                                ),
                                Text(
                                  trip.day,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '${AppTranslationKeys.to.tr} :',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  trip.timeEnd,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  AppTranslationKeys.startingPoint.tr,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  trip.route.addressFrom,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Text(
                                  AppTranslationKeys.destination.tr,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  trip.route.addressTo,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            )
                          ]
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                  color: trip.status == 'not_yet' ? AppColors.primaryColor : trip.status == 'working' ? AppColors.successColor : AppColors.errorColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppRadius.cardBorderRadius),
                  ) // green shaped
              ),
              child: Text(
                  trip.status == 'not_yet' ? AppTranslationKeys.immediatelyLabel.tr : trip.status == 'working' ? AppTranslationKeys.workingLabel.tr : AppTranslationKeys.finishedLabel.tr,
                  style: const TextStyle(color: AppColors.whiteTextColor)
              ),
            ),
          )
        ],
      ),
    );
  }
}
