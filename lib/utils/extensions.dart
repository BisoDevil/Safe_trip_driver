
import 'package:get/get.dart';

extension ResponsiveSizer on num {

  double get h => this * Get.height / 100;

  double get w => this * Get.width / 100;
}
