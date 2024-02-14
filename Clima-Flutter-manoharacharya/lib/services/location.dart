import 'package:geolocator/geolocator.dart';

class location {
  double? latitude;
  double? lonitude;

 Future<void>  getlocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location Permission are permanently denied,we cannot Request permission');
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      lonitude =position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
