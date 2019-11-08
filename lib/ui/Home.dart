//import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:menino_da_ti/helpers/Sqflite.dart';
import 'package:menino_da_ti/ui/childs/Formatacao.dart';
import 'package:menino_da_ti/ui/childs/SuporteTecnico.dart';
import 'package:menino_da_ti/ui/childs/childs/PrestadoresDeServico.dart';
import "package:image_picker/image_picker.dart";

class Home extends StatefulWidget {
  final Cliente cliente;

  const Home({Key key, this.cliente}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Cliente cliente;

  Future getImage() async {
    ImagePicker.pickImage(source: ImageSource.camera).then((file) {
      if (file == null) {
        return;
      } else {
        setState(() {
          cliente.img = file.path;
        });
      }
    });
  }

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    if (widget.cliente == null) {
      cliente = Cliente();
    } else {
      cliente = Cliente.fromMap(widget.cliente.toMap());
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Menino da TI",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: tab,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: adicionar(context).map((Widget tab) {
            return Center(child: tab);
          }).toList(),
        ),
      ),
    );
  }

  List<Widget> adicionar(BuildContext context) {
    List<Widget> myTabs = <Widget>[
      homeTab(context),
      acompanhar(context),
      fotos(context)
    ];
    return myTabs;
  }

  String status = "em andamento";

  List<Tab> tab = [
    Tab(text: 'Home'),
    Tab(text: 'Acompanhar'),
    Tab(text: 'Fotos'),
  ];

  TabController _tabController;

  Widget tecla(
      String text, IconData icons, BuildContext context, Widget widget) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Padding(
            child: Icon(
              icons,
              size: 40,
              color: Colors.lightBlueAccent,
            ),
            padding: EdgeInsets.all(15.0),
          ),
          Padding(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
            padding: EdgeInsets.all(15.0),
          )
        ],
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
    );
  }

  Widget homeTab(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                tecla("Formatação", Icons.computer, context,
                    PrestadoresDeServico()),
                tecla("Suporte técnico", Icons.person, context, SuporteTecnico()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                tecla("Reparos genéricos", Icons.build, context, Formatacao()),
                tecla("Wi-fi", Icons.wifi, context, Formatacao()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                tecla("SmartTV", Icons.tv, context, Formatacao()),
                tecla("Peças e acessórios", Icons.shopping_cart, context,
                    Formatacao()),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget acompanhar(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
          GestureDetector(
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/json.png"))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Formatação"),
                      Text(
                        "Valor: R\$ 63",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text("Status: $status"),
                    ],
                  ),
                ],
              ),
            )),
            onTap: () {
              return showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text("Confirma conclusão do técnico"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Sim"),
                        onPressed: () {
                          setState(() {
                            status = "Concluído";
                          });
                          showDialog(
                              context: context,
                              child: AlertDialog(
                                title: Text("Deixe sua avaliação"),
                                actions: [
                                  GestureDetector(
                                    child: Icon(Icons.star),
                                  ),
                                  GestureDetector(
                                    child: Icon(Icons.star),
                                  ),
                                  GestureDetector(
                                    child: Icon(Icons.star),
                                  ),
                                  GestureDetector(
                                    child: Icon(Icons.star),
                                  ),
                                  GestureDetector(
                                    child: Icon(Icons.star),
                                  ),
                                ],
                              ));
//                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text("Cancelar"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
            },
            onDoubleTap: () {
              setState(() {
                status = "em andamento";
              });
            },
          )
        ])));
  }

  Widget fotos(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        onPressed: getImage,
      ),
      body: Center(
        child: cliente.img == null
            ? Text('No image selected.')
            : Image.asset("assets/json.png"),
      ),
    );
  }
}
