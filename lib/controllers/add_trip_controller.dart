import 'package:get/get.dart';
import 'package:waslny_rider/components/select_location_buttom_sheet.dart';
import 'package:waslny_rider/components/select_trip_multi_location_buttom_sheet.dart';
import 'package:waslny_rider/components/trip_date_buttom_sheet.dart';
import 'package:waslny_rider/components/trip_type_buttom_sheet.dart';

class AddTripController extends GetxController {
  int? selectedIndex;
  int? selectedtripTypeIndex;
  bool isEnabled = false;
  List<String> locations = ['', ''];

  void tripDateCheker() {
    if (selectedIndex == 0) {
      Get.back();
      Get.bottomSheet(TripTypeButtomSheet());
    } else if (selectedIndex == 1) {
      Get.back();
      Get.bottomSheet(TripDateButtomSheet());
    }
    print(selectedIndex);
  }

  void tripTypeCheker() {
    print(selectedtripTypeIndex);
    if (selectedtripTypeIndex == 0 || selectedtripTypeIndex == 2) {
      Get.back();
      Get.bottomSheet(SelectLocationButtomSheet());
    } else if (selectedtripTypeIndex == 1) {
      Get.back();
      Get.bottomSheet(SelectTripMultiLocationButtomSheet());
    }
  }

  void addNewLocations() {
    locations.add('');
    update();
  }
}
