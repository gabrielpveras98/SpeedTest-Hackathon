import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menino_da_ti/ui/childs/Formatacao.dart';
import 'package:menino_da_ti/ui/childs/childs/PrestadoresDeServico.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text("Menino da TI", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white, ),textAlign: TextAlign.center,), centerTitle: true,),
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                tecla("Formatação", Icons.computer, context, PrestadoresDeServico()),
                tecla("Suporte técnico", Icons.person, context, Formatacao()),
              ],),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                tecla("Reparos genéricos", Icons.build, context, Formatacao()),
                tecla("Wi-fi", Icons.wifi, context, Formatacao()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                tecla("SmartTV", Icons.tv, context, Formatacao()),
                tecla("Peças e acessórios", Icons.shopping_cart, context, Formatacao()),
              ],
            ),
          ),
        ],
      ),)
    );
  }
}

Widget tecla(String text, IconData icons, BuildContext context, Widget widget) {
  return GestureDetector(
    child: Column(
      children: <Widget>[
        Padding(child: Icon(icons, size: 40, color: Colors.lightBlueAccent,), padding: EdgeInsets.all(15.0),),
        Padding(child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.blueGrey),), padding: EdgeInsets.all(15.0),)
      ],
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
    },
  );
}
