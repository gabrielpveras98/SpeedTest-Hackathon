import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Pagamento extends StatefulWidget {
  @override
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Tela de pagamento",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Padding(child: Text("Opções de pagamento:", style: TextStyle(color: Colors.blueGrey),), padding: EdgeInsets.all(10.0),)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
              child: 
              FlatButton(
                child: Text(
                  "Boleto",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                color: Colors.red,
              ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child:
                FlatButton(
                  child: Text(
                    "Débito",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  color: Colors.amber,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "Crédito",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  color: Colors.blue,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
