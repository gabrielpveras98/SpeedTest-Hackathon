import 'package:flutter/material.dart';

import 'childs/PrestadoresDeServico.dart';

class Formatacao extends StatefulWidget {
  @override
  _FormatacaoState createState() => _FormatacaoState();
}

class _FormatacaoState extends State<Formatacao> {
  List _sistemas = [
    "Vazio",
    "Windows 7",
    "Windows 8",
    "Windows 10",
    "Linux",
    "Mac OS"
  ];

  String backup = "Sem resposta";
  String licensa = "Sem resposta";
  String atendimento = "Sem resposta";
  String _currentCity;

  TextEditingController _observacao = TextEditingController();

  double custo = 40;

  List<DropdownMenuItem<String>> _dropDownMenuItems;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Formulário de formatação",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_currentCity == "Vazio") {
            showDialog(
                context: context,
                child: AlertDialog(
                  title:
                      Text("ERRO! O campo sistema operacional é obrigatório"),
                ));
          } else if (backup == "Sem resposta" ||
              atendimento == "Sem resposta" ||
              licensa == "Sem resposta") {
            showDialog(
                context: context,
                child: AlertDialog(
                  title: Text("ERRO! Há campos obrigatórios não preenchidos"),
                ));
          } else {
            showDialog(
                context: context,
                child: AlertDialog(
                  title: Text("Confirma enviar os dados?"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Sim"),
                      onPressed: () {

                      },
                    ),
                    FlatButton(
                      child: Text("Não"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ));
          }
        },
        child: Icon(Icons.send),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Text(
            "Sistema Operacional a ser instalado",
            style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
          ),
          DropdownButton(
            value: _currentCity,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            iconSize: 50.0,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
            ),
          ),
          FlatButton(
            child: Text(
              "Já possui a licensa?",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue[300],
            onPressed: () {
              showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text("Já possui a licensa do Sistema Operacionas?"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Sim"),
                        onPressed: () {
                          setState(() {
                            licensa = "sim";
                            Navigator.pop(context);
                          });
                        },
                      ),
                      FlatButton(
                        child: Text("Não"),
                        onPressed: () {
                          setState(() {
                            licensa = "Não";
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
            },
          ),
          Text("Resposta: $licensa"),
          FlatButton(
            child: Text(
              "Fazer backup?",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red[300],
            onPressed: () {
              showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text("Deseja fazer backup?"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Sim"),
                        onPressed: () {
                          setState(() {
                            backup = "sim";
                            Navigator.pop(context);
                          });
                        },
                      ),
                      FlatButton(
                        child: Text("Não"),
                        onPressed: () {
                          setState(() {
                            backup = "Não";
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
            },
          ),
          Text("Resposta: $backup"),
          FlatButton(
            child: Text(
              "Opções de atendimento",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.amber[300],
            onPressed: () {
              showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text("Escolha como deseja o atendimento"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Residencial"),
                        onPressed: () {
                          setState(() {
                            atendimento = "Residencial";
                            Navigator.pop(context);
                          });
                        },
                      ),
                      FlatButton(
                        child: Text("No estabelecimento"),
                        onPressed: () {
                          setState(() {
                            atendimento = "No estabelecimento";
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
            },
          ),
          Text("Resposta: $atendimento"),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: Form(
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Observação(não obrigatório)",
                  hintText: "Descreva a observação",
                ),
                controller: _observacao,
              ),
            ),
          ),
        ],
      )),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _sistemas) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }
}
