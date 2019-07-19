import 'package:flutter/material.dart';
import 'package:gremio_imprimi/model/crud.dart';

class AddAlunoForm extends StatefulWidget {
  @override
  _AddAlunoFormState createState() => _AddAlunoFormState();
}

class _AddAlunoFormState extends State<AddAlunoForm> {
  TextEditingController ctrlMatricula = TextEditingController();
  TextEditingController ctrlNome = TextEditingController();
  TextEditingController ctrlTurma = TextEditingController();

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
              decoration:
                  InputDecoration(hintText: 'Nome do aluno', labelText: 'Nome'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: ctrlTurma,
              decoration: InputDecoration(
                  hintText: 'Turma do aluno', labelText: 'Turma'),
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
                  addData(ctrlMatricula, ctrlNome, ctrlTurma);
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
