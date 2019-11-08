import 'package:flutter/material.dart';
import 'package:menino_da_ti/helpers/Sqflite.dart';
import 'package:menino_da_ti/ui/Home.dart';

class Controle extends StatefulWidget {
  final Cliente cliente;

  Controle({this.cliente});

  @override
  State<StatefulWidget> createState() {
    return _ControleState();
  }
}

class _ControleState extends State<Controle> {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  String status;

  Cliente _editedContact;

  IconData icone;

  void send() async {
    if (widget.cliente == null) {
      _editedContact = Cliente();
    } else {
      _editedContact = Cliente.fromMap(widget.cliente.toMap());

      _editedContact.email = email.text;
      _editedContact.senha = senha.text;
    }
    ContactHelper.internal().saveContact(_editedContact);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Formulário de cadastro",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: send,
          child: Icon(Icons.send),
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
                child: Form(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "E-mail: ",
                      hintText: "Digite seu E-mail",
                    ),
                    controller: email,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
                child: Form(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Senha: ",
                      hintText: "Digite sua senha",
                    ),
                    obscureText: true,
                    maxLength: 32,
                    controller: senha,
                  ),
                ),
              ),
            ])));
  }
}
