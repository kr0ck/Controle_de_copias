import 'package:flutter/material.dart';

class SitAlunoScreen extends StatefulWidget {
  final List list;
  final int index;

  SitAlunoScreen({this.list, this.index});

  @override
  _SitAlunoScreenState createState() => _SitAlunoScreenState();
}

class _SitAlunoScreenState extends State<SitAlunoScreen> {
  List list;
  int index;

  // SitAlunoScreen({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situação do aluno'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text('${widget.list[widget.index]['NOME_ALUNO']}')
          ],
        ),
      ),
    );
  }
}
