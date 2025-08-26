import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:waslny_rider/constants.dart';
import 'package:waslny_rider/controllers/otp_page_controller.dart';
import 'package:waslny_rider/models/saved_adress.dart';

class SavedLocationController extends GetxController {
  OtpPageController get controller => Get.find<OtpPageController>();
  double? lat;
  double? long;
  List<SavedAddress> savedAddresses = [];
  bool isLoading = false;

  Future<void> saveRiderLocation() async {
    if (lat == 0.0 || long == 0.0) {
      Get.showSnackbar(GetSnackBar(
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 2),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: red,
        snackPosition: SnackPosition.TOP,
        title: 'خطأ',
        message: 'الرجاء اختيار العنوان',
      ));
    } else {
      Get.dialog(
        const Center(
            child: CircularProgressIndicator(
          color: blue,
        )),
        barrierDismissible: false,
      );
      final url = Uri.parse("$baseUrl/api/rider-saved-locations");

      final body = {
        "location": {
          "type": "Point",
          "coordinates": [long, lat]
        }
      };

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${controller.accessToken}"
        },
        body: jsonEncode(body),
      );
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(" Location saved successfully: ${response.body}");
        Get.back();
        Get.showSnackbar(GetSnackBar(
          animationDuration: Duration(seconds: 1),
          duration: Duration(seconds: 2),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: blue,
          snackPosition: SnackPosition.TOP,
          title: 'تمت العملية بنجاح',
          message: '  تم حفظ العنوان بنجاح',
        ));
      } else {
        print(" Failed with status: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    }
  }

  Future<void> getSavedLocations() async {
    isLoading = true;
    update();

    try {
      final url = Uri.parse("$baseUrl/api/rider-saved-locations?per_page=10");

      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${controller.accessToken}",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> locations = data["data"] ?? [];
        print("Locations count: ${locations.length}");

        List<Future<SavedAddress>> futures = locations.map((item) async {
          double lat;
          double lng;
          final coords = item["location"]["coordinates"];

          // التحقق من نوع الإحداثيات
          if (coords is List) {
            if (coords.length == 2) {
              // إذا كانت قيمة طولها أكثر من 90 أو أقل من -90 => غالباً longitude أول
              if ((coords[0].abs() <= 90) && (coords[1].abs() <= 180)) {
                // [lat, lng]
                lat = coords[0].toDouble();
                lng = coords[1].toDouble();
              } else {
                // GeoJSON [lng, lat]
                lng = coords[0].toDouble();
                lat = coords[1].toDouble();
              }
            } else {
              throw Exception("Invalid coordinates list");
            }
          } else {
            lat = coords["lat"].toDouble();
            lng = coords["long"].toDouble();
          }

          print("Fetching address for: lat=$lat, lng=$lng");

          final addr = await getAddressFromLatLng(lat, lng);

          print("Address fetched: ${addr["fullAddress"]}");

          return SavedAddress(
            id: item["id"],
            lat: lat,
            lng: lng,
            fullAddress: addr["fullAddress"],
            street: addr["street"],
            suburb: addr["suburb"],
            city: addr["city"],
            state: addr["state"],
            country: addr["country"],
            created: item["dates"]["created"],
          );
        }).toList();

        savedAddresses = await Future.wait(futures);
        print("✅ تم حفظ ${savedAddresses.length} عنوان");
      } else {
        print("❌ Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("⚠️ Exception: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<Map<String, dynamic>> getAddressFromLatLng(
      double lat, double lng) async {
    try {
      final url = Uri.parse(
          "https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng&zoom=18&addressdetails=1&accept-language=ar");

      final response =
          await http.get(url, headers: {"User-Agent": "waslny_rider_app/1.0"});

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        String fullAddress = data["display_name"] ?? "موقع غير معروف";
        var address = data["address"] ?? {};

        String street = address["road"] ?? "";
        String suburb = address["suburb"] ?? "";
        String city =
            address["city"] ?? address["town"] ?? address["village"] ?? "";
        String state = address["state"] ?? "";
        String country = address["country"] ?? "";

        return {
          "fullAddress": fullAddress,
          "street": street,
          "suburb": suburb,
          "city": city,
          "state": state,
          "country": country,
        };
      } else {
        print("❌ Nominatim error: ${response.statusCode}");
        return {
          "fullAddress": "خطأ في جلب العنوان",
          "street": "",
          "suburb": "",
          "city": "",
          "state": "",
          "country": "",
        };
      }
    } catch (e) {
      print("⚠️ Nominatim exception: $e");
      return {
        "fullAddress": "خطأ: $e",
        "street": "",
        "suburb": "",
        "city": "",
        "state": "",
        "country": "",
      };
    }
  }

  Future<void> deleteLocation(int id) async {
    Get.dialog(Center(
      child: CircularProgressIndicator(
        color: blue,
      ),
    ));
    final url = Uri.parse("$baseUrl/api/rider-saved-locations/$id");

    final response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${controller.accessToken}", // التوكن هون
      },
    );
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    if (response.statusCode == 200) {
      print("Deleted successfully ");
      print("Response: ${response.body}");
      Get.back();
      Get.showSnackbar(GetSnackBar(
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 2),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: blue,
        snackPosition: SnackPosition.TOP,
        title: 'تمت العملية بنجاح',
        message: 'تم حذف العنوان بنجاح',
      ));
    } else {
      print("Failed - Status: ${response.statusCode}");
      print("Error: ${response.body}");
    }
  }
}
