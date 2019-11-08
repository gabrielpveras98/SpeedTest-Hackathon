import 'package:flutter/material.dart';
import 'package:menino_da_ti/helpers/Sqflite.dart';
import 'package:menino_da_ti/ui/Home.dart';

class Login extends StatefulWidget {
  final Cliente cliente;

  Login({this.cliente});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cidade = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController cnpj = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController senha = TextEditingController();

  String status;

  Cliente _editedContact;

  IconData icone;

  void send() async {
    if(widget.cliente == null){
      _editedContact = Cliente();
    } else {
      _editedContact = Cliente.fromMap(widget.cliente.toMap());

      _editedContact.name = nome.text;
      _editedContact.email = email.text;
      _editedContact.cidade = cidade.text;
      _editedContact.endereco = endereco.text;
      _editedContact.cnpj = cnpj.text;
      _editedContact.phone = telefone.text;
      _editedContact.senha = senha.text;
    }
    ContactHelper.internal().saveContact(_editedContact);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    icone = Icons.done;
    status = "As senhas devem coincidir";
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
        floatingActionButton: FloatingActionButton(onPressed: send, child: Icon(Icons.send),),
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
                          labelText: "Nome: ",
                          hintText: "Digite seu nome",
                        ),
                        controller: nome,
                      ),
                    ),
                  ),
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
                          labelText: "Cidade: ",
                          hintText: "Nome da cidade",
                        ),
                        controller: cidade,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
                    child: Form(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: "Endereço: ",
                          hintText: "Endereço(rua, numero da cada, etc.)",
                        ),
                        controller: endereco,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
                    child: Form(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: "CNPJ(Opicional): ",
                          hintText: "CNPJ",
                        ),
                        maxLength: 20,
                        controller: cnpj,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
                    child: Form(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: "Telefone(Whatsapp): ",
                          hintText: "Número de telefone",
                        ),
                        maxLength: 15,
                        keyboardType: TextInputType.number,
                        controller: telefone,
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
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
                    child: Form(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: "Confirmar senha: ",
                          hintText: "Confirme sua senha",
                        ),
                        obscureText: true,
                        onChanged: (String nome){
                          if(nome != senha.text){
                            setState(() {
                              icone = Icons.error;
                              status = "Erro, as senhas devem ser iguais";
                            });
                          } else if(nome == senha.text){
                            setState(() {
                              icone = Icons.done;
                              status = "as senhas são iguais";
                            });
                          }
                        },
                        maxLength: 32,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(icone, color: Colors.green,),
                      Text(status),
                    ],
                  ),
                ])));
  }
}
