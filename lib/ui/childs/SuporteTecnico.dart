import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menino_da_ti/ui/childs/childs/Pagamento.dart';

class SuporteTecnico extends StatefulWidget {
  @override
  _SuporteTecnicoState createState() => _SuporteTecnicoState();
}

class _SuporteTecnicoState extends State<SuporteTecnico> {
  List _relacionado = [
    "Computador",
    "Internet",
    "Celular",
    "Outro",
  ];

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
          "Suporte técnico",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Tipo de suporte",
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
            child: Text("Chamar suporte", style: TextStyle(color: Colors.white),),color: Colors.red,
            onPressed: () {
              print("Botão de chamada do suporte pressionado");
            },
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
    List<DropdownMenuItem<String>> items = List();
    for (String city in _relacionado) {
      items.add(DropdownMenuItem(value: city, child: Text(city)));
    }
    return items;
  }
}
