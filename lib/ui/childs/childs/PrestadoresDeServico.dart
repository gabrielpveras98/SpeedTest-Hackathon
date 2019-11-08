import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menino_da_ti/ui/childs/Formatacao.dart';

class PrestadoresDeServico extends StatefulWidget {
  @override
  _PrestadoresDeServicoState createState() => _PrestadoresDeServicoState();
}

class _PrestadoresDeServicoState extends State<PrestadoresDeServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Empresas de formatação",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: _getCards(),
      ),
    );
  }

  List<Widget> _getCards() {
    List<Widget> cards = [
    Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Formatacao()));
          },
          child: Container(
            width: 300,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/json.png", ),
                Column(
                  children: <Widget>[
                    Text("Jason info", style: TextStyle(fontSize: 30.0),),
                    Text("R\$ 40-80", style: TextStyle(fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
      Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: Container(
              width: 300,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset("assets/json.png", ),
                  Column(
                    children: <Widget>[
                      Text("Jason info", style: TextStyle(fontSize: 30.0),),
                      Text("R\$ 40-80", style: TextStyle(fontSize: 20.0),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ];
    return cards;
  }
}
