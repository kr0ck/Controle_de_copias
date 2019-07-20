import 'package:flutter/material.dart';
import 'package:gremio_imprimi/form/add_aluno_form.dart';
import 'package:gremio_imprimi/model/crud.dart';
import 'package:gremio_imprimi/screens/sit_aluno_screen.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ctrlMatricula = TextEditingController();

  void recebeDate(){
  var now = DateTime.now();

  int day = now.day;
  int month = now.month;
  //List date = [day, month];

  var sem;

  if (month == 1){
    sem = day/7;
  }else if(month == 2){
    sem = (31+day)/7;
  }else if(month == 3){
    sem = (31 + 28 + day)/7;
  }else if(month == 4){
    sem = (31 + 28 + 31 + day)/7;
  }else if(month == 5){
    sem = (31 + 28 + 31 + 30 + day)/7;
  }else if(month == 6){
    sem = (31 + 28 + 31 + 30 + 31 + day)/7;
  }else if(month == 7){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + day)/7;
  }else if(month == 8){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + day)/7;
  }else if(month == 9){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + day)/7;
  }else if(month == 10){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + day)/7;
  }else if(month == 11){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 +  day)/7;
  }else if(month == 12){
    sem = (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + day)/7;
  }

  var semana = sem.floor()+1;

  print(ctrlMatricula.text);
  print(semana);
  var url = 'https://flutterteste.000webhostapp.com/editData.php';

  http.post(url, body: {
    "matricula": ctrlMatricula.text,
    "semana": semana.toString(),
  });

  //return date;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Impressão'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddAlunoForm()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: ctrlMatricula,
              decoration: InputDecoration(
                  hintText: 'Matricúla',
                  labelText: 'Numero de matricúla do aluno'),
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
                child: Text(
                  'Procurar Aluno',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                onPressed: () {

                  recebeDate();

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SitAluno(ctrlMatricula.text)));
                })
          ],
        ),
      ),
    );
  }
}


