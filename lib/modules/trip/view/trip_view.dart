import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/trip/controller/trip_controller.dart';
import 'package:safe_trip_driver_app/modules/trip/view/widgets/student_card.dart';

class TripView extends StatelessWidget {
  final TripModel trip = Get.arguments as TripModel;
  TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('trip details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: AppPaddings.mainScreenVerticalPadding,
          horizontal: AppPaddings.mainScreenHorizontalPadding,
        ),
        child: Column(children: [
          Text('trip data' , style: Theme.of(context).textTheme.titleMedium,),

          Text(trip.status),
          Text(trip.timeStart),
          Text(trip.timeEnd),
          Text(trip.passengerAvailable.toString()),
          Text(trip.route.addressFrom),
          Text(trip.route.addressTo),
          Text(trip.busId.toString()),
          Text(trip.day.toString()),

          Divider(),
          Text('students data' , style: Theme.of(context).textTheme.titleMedium,),

          GetBuilder<TripController>(builder: (tripController) {
            if (tripController.loading) {
              return const CircularProgressIndicator();
            } else if (tripController.loading == false &&
                tripController.studentsInTrip.isNotEmpty) {
              return SizedBox(
                  width: 100.w,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tripController.studentsInTrip.length,
                      itemBuilder: (BuildContext context, int index) {
                        return StudentCard(
                            studentModel: tripController.studentsInTrip[index],
                            onPickedUpClicked: (){},
                            onFailureClicked: (){},
                        );
                      }
                  )
              );
            }else {
              return const Text('');
            }
          })
        ]),
      ),
    );
  }
}
