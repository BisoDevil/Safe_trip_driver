import 'package:safe_trip_driver_app/index.dart';


class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: 6.h,
      child: const CircularProgressIndicator(strokeWidth: 1.5),
    );
  }
}
