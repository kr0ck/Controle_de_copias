import 'package:flutter/material.dart';
import 'package:gremio_imprimi/form/add_aluno_form.dart';
import 'package:gremio_imprimi/model/crud.dart';
import 'package:gremio_imprimi/screens/sit_aluno_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ctrlMatricula = TextEditingController();


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

                  dynamic dat = date();
                  print(dat.floor());

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SitAluno(ctrlMatricula.text)));
                })
          ],
        ),
      ),
    );
  }
}


