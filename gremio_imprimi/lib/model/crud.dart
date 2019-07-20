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

void recebeDate(ctrlMat){
  var now = DateTime.now();

  int day = now.day;
  int month = now.month;
  //List date = [day, month];

  var sem;

  if (month == 1){
    sem = day/7;
    return sem;
  }else if(month == 2){
    sem = (31+day)/7;
    return sem;
  }else if(month == 3){
    sem = (31 + 28 + day)/7;
    return sem;
  }else if(month == 4){
    sem = (31 + 28 + 31 + day)/7;
    return sem;
  }else if(month == 5){
    sem = (31 + 28 + 31 + 30 + day)/7;
    return sem;
  }else if(month == 6){
    sem = (31 + 28 + 31 + 30 + 31 + day)/7;
    return sem;
  }else if(month == 7){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + day)/7;
    return sem;
  }else if(month == 8){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + day)/7;
    return sem;
  }else if(month == 9){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + day)/7;
    return sem;
  }else if(month == 10){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + day)/7;
    return sem;
  }else if(month == 11){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 +  day)/7;
    return sem;
  }else if(month == 12){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + day)/7;
    return sem;
  }
  var semana = sem.floor()+1;

  print(ctrlMat.text);
  print(semana);
  var url = 'https://flutterteste.000webhostapp.com/editData.php';

  http.post(url, body: {
    "matricula": ctrlMat.text,
    "semana": semana.text,
  });

  //return date;
}


