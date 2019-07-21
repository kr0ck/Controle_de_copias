import 'package:flutter/material.dart';
import 'package:gremio_imprimi/model/crud.dart';

import 'package:http/http.dart' as http;


class SitAluno extends StatefulWidget {
  final String matricula;
  SitAluno(this.matricula);
  @override
  _SitAlunoState createState() => _SitAlunoState(matricula);
}

class _SitAlunoState extends State<SitAluno> {
  final String matricula;
  int n;
  _SitAlunoState(this.matricula);
  final _formKey = GlobalKey<FormState>();
  final ctrlVal = TextEditingController();

  void updateCop(){
  //var sem = recebeDate();
  var url = 'https://flutterteste.000webhostapp.com/editCop.php';

  http.post(url, body: {
    "matricula": matricula,
    "copia": ctrlVal.text,
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situação do aluno'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(18.0),
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data == null ? 0 : 1,
                    itemBuilder: (context, i) {
                      int j = 0;
                      for (int i = 0; i < snapshot.data.length; i++) {
                        if (matricula == snapshot.data[i]['MATRICULA_ALUNO']) {
                          j = i;
                          // dynamic s = recebeDate();
                          // if (s != snapshot.data[j]['SEMANA_ALUNO']) {
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (context) => SitAluno(matricula)));
                          // }
                        }
                      }
                      if (matricula == snapshot.data[j]['MATRICULA_ALUNO']) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'O aluno:',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '    ${snapshot.data[j]['NOME_ALUNO']}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              'Turma do aluno:',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '    ${snapshot.data[j]['TURMA_ALUNO']}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              'Nº de copias na semana ${snapshot.data[j]['SEMANA_ALUNO']}:',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '    ${snapshot.data[j]['COPIAS_ALUNO']}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: ctrlVal,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Quantidade de copias',
                                    ),
                                    validator: (text){
                                      if (text.isEmpty) {
                                        return 'Coloque um valor valido';
                                      } else {
                                        String c = snapshot.data[j]['COPIAS_ALUNO'];
                                        int n = int.parse(text)+int.parse(c);
                                        print(n);
                                        print(matricula);
                                        if (n > 10) {
                                          return 'Valor ultrapassa a quantidade de copias';
                                        } else {
                                          return null;
                                        }
                                      }

                                    },
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                      updateCop();
                                      Navigator.of(context).pop();
                                      }
                                    },
                                    child: Text('Lançar'),
                                  )
                                ],
                              ),
                            )
                          ],
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
      ),
    );
  }
}
