import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddAlunoForm extends StatefulWidget {
  @override
  _AddAlunoFormState createState() => _AddAlunoFormState();
}

class _AddAlunoFormState extends State<AddAlunoForm> {

  TextEditingController ctrlMatricula = TextEditingController();
  TextEditingController ctrlNome = TextEditingController();
  TextEditingController ctrlTurma = TextEditingController();

  void addData(){
    var url = 'https://flutterteste.000webhostapp.com/addData.php'; 

    http.post(url, body: {
      "matricula" : ctrlMatricula.text,
      "nome" : ctrlNome.text,
      "turma" : ctrlTurma.text
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Novo Aluno'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: ctrlMatricula,
              decoration: InputDecoration(
                  hintText: 'Número de maticúla do aluno',
                  labelText: 'Matricúla'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: ctrlNome,
              decoration: InputDecoration(
                  hintText: 'Nome do aluno',
                  labelText: 'Nome'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: ctrlTurma,
              decoration: InputDecoration(
                  hintText: 'Turma do aluno',
                  labelText: 'Turma'),
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
                child: Text(
                  'Cadastrar Aluno',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  addData();
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}