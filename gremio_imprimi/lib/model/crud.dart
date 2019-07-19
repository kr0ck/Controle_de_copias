import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getData() async {
  var url = 'https://flutterteste.000webhostapp.com/get.php';
  http.Response response = await http.get(url);

  var data = jsonDecode(response.body);
  return data;
  // print(data.toString());
}

void addData(ctrlMat, ctrlNome, ctrlTurma) {
  var url = 'https://flutterteste.000webhostapp.com/addData.php';

  http.post(url, body: {
    "matricula": ctrlMat.text,
    "nome": ctrlNome.text,
    "turma": ctrlTurma.text
  });
}
