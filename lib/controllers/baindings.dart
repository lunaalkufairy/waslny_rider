import 'package:get/get.dart';
import 'package:waslny_rider/controllers/add_trip_controller.dart';

class Baindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddTripController(), permanent: true);
  }
}
