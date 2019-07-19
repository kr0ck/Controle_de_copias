import 'package:flutter/material.dart';
import 'package:gremio_imprimi/model/crud.dart';


class SitAluno extends StatelessWidget {
  final String matricula;
  SitAluno(this.matricula);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situação do aluno'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
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
                          print(i);
                          j = i;
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
                              'Nº de copias esta semana:',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '    ${snapshot.data[j]['COPIAS_ALUNO']}',
                              style: TextStyle(fontSize: 18.0),
                            ),
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