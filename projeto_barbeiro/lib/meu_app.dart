import 'package:flutter/material.dart';
import 'package:projeto_barbeiro/app/rotas.dart';
import 'package:projeto_barbeiro/app/widget/detalhes_pessoa.dart';
import 'package:projeto_barbeiro/app/widget/form_pessoa.dart';
import 'package:projeto_barbeiro/app/widget/lista_pessoa.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gestão de horas de barbeiro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          Rotas.home: (context) => ListaCliente(),
          Rotas.formClientes: (context) => FormCliente(),
          Rotas.detalhesClientes: (context) => DetalhesClientes()
        });
  }
}
