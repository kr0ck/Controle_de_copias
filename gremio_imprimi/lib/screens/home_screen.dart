import 'package:flutter/material.dart';
import 'package:gremio_imprimi/form/add_aluno_form.dart';
import 'package:gremio_imprimi/model/crud.dart';

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
                  //getData();
                  print('oioioioioioioi');

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home(ctrlMatricula.text)));
                })
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final String matricula;
  Home(this.matricula);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          int j = 0;
          for (int i = 0; i < snapshot.data.length; i++) {
            if (matricula == snapshot.data[i]['MATRICULA_ALUNO']) {
              print(i);
              j = i;
            }
          }

          return snapshot.hasData
              ? ListView.builder(
                  itemCount:
                      snapshot.data == null ? 0 : 1, //snapshot.data.length,
                  itemBuilder: (context, i) {
                    if (matricula == snapshot.data[j]['MATRICULA_ALUNO']) {
                      return Text(
                        'O aluno ${snapshot.data[j]['NOME_ALUNO']} tem ${snapshot.data[j]['COPIAS_ALUNO']} copias esta semana',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Text('nao encontrado');
                    }
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
