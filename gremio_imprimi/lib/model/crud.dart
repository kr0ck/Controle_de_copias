import 'dart:convert';

import 'package:http/http.dart' as http;

class Crud{

  Future getData() async {
    var url = 'https://flutterteste.000webhostapp.com/get.php';
    http.Response response = await http.get(url);

    var data = jsonDecode(response.body);
    print(data.toString());
    return data.toString();
  }



}