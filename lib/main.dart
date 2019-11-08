import 'package:flutter/material.dart';
import 'package:menino_da_ti/ui/Home.dart';
import 'package:menino_da_ti/TelaDeLogin.dart';
import 'package:menino_da_ti/helpers/Sqflite.dart';
import 'package:menino_da_ti/Controle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int numero = await ContactHelper.internal().getNumber();
  if(numero > 0){
    runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false,));
  }else {
    runApp(MaterialApp(home: Controle(), debugShowCheckedModeBanner: false,));
  }
}