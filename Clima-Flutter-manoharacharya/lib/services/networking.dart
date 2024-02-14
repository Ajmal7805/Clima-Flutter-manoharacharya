import 'package:http/http.dart' as http;
import 'dart:convert';

class networkhelper {
  networkhelper(this.url);
  final String url;

 Future<double> getdata() async {
    http.Response response = await http.get(Uri.parse(url));
    print(response);
    

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
     return   jsonDecode(data);
    } else {
      print(response.body);
    }
    return 0.0;
  }
}
