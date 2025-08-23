import 'package:get/get.dart';
import 'package:waslny_rider/controllers/add_trip_controller.dart';
import 'package:waslny_rider/controllers/login_screen_controller.dart';
import 'package:waslny_rider/controllers/otp_page_controller.dart';
import 'package:waslny_rider/screens/login_screen.dart';

class Baindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddTripController(), permanent: true);
    Get.put(LoginScreenController(), permanent: true);
    Get.put(OtpPageController(), permanent: true);
  }
}
