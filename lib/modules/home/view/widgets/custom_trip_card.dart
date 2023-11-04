
import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/index.dart';


class CustomOnewayTripCard extends StatelessWidget {
  final TripModel trip;
  const CustomOnewayTripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          AppColors.cardBackgroundColor.withOpacity(0.20),
                          BlendMode.dstATop),
                      image: const AssetImage('assets/images/trip_card_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
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
                                  'From :',
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
                                  'To :',
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
                                  'Starting point',
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
                                  'Destination',
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
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                  color: trip.status == 'not_yet' ? Colors.green : Colors.red,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppRadius.cardBorderRadius),
                  ) // green shaped
              ),
              child: Text(trip.status == 'not_yet' ? 'Immediately' : 'Finished', style: const TextStyle(color: AppColors.whiteTextColor)),
            ),
          )
        ],
      ),
    );
  }
}
