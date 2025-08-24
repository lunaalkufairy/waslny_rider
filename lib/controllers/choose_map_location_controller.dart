import 'dart:convert';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class ChooseMapLocationController extends GetxController {
  GoogleMapController? mapController;

  final RxSet<Marker> selectedMarkers = <Marker>{}.obs;
  final RxString selectedAddress = "".obs;

  // ضع هنا مفتاحك الخاص من Google Cloud
  final String apiKey = "YOUR_GOOGLE_API_KEY";

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> onMapTapped(LatLng tappedPoint, {String? assetPath}) async {
    // إنشاء أو تحديث ماركر المستخدم
    selectedMarkers.value = {
      Marker(
        markerId: const MarkerId("selectedLocation"),
        position: tappedPoint,
        icon: assetPath != null
            ? await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(size: Size(100, 100)), assetPath)
            : BitmapDescriptor.defaultMarker,
      ),
    };

    try {
      // جرب العنوان بالعربي
      final urlAr =
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=${tappedPoint.latitude},${tappedPoint.longitude}&key=$apiKey&language=ar";
      final responseAr = await http.get(Uri.parse(urlAr));
      final dataAr = json.decode(responseAr.body);

      if (dataAr['status'] == "OK" && dataAr['results'].isNotEmpty) {
        selectedAddress.value = dataAr['results'][0]['formatted_address'];
      } else {
        // fallback للإنجليزية
        final urlEn =
            "https://maps.googleapis.com/maps/api/geocode/json?latlng=${tappedPoint.latitude},${tappedPoint.longitude}&key=$apiKey&language=en";
        final responseEn = await http.get(Uri.parse(urlEn));
        final dataEn = json.decode(responseEn.body);

        if (dataEn['status'] == "OK" && dataEn['results'].isNotEmpty) {
          selectedAddress.value = dataEn['results'][0]['formatted_address'];
        } else {
          // fallback للإحداثيات
          selectedAddress.value =
              "خط العرض: ${tappedPoint.latitude}, خط الطول: ${tappedPoint.longitude}";
        }
      }
    } catch (e) {
      // fallback للإحداثيات عند أي خطأ
      selectedAddress.value =
          "خط العرض: ${tappedPoint.latitude}, خط الطول: ${tappedPoint.longitude}";
    }
  }
}
