import 'package:appaviao/listagem_controlevoo/tela_lista_controlevoo.dart';
import 'package:appaviao/pages/barra_navegacao.dart';
import 'package:appaviao/pages/login.dart';
import 'package:appaviao/pages/perfil.dart';
import 'package:appaviao/pages/sla.dart';
import 'package:appaviao/pages/tela_cadastro_aeroporto.dart';
import 'package:appaviao/pages/tela_cadastro_trecho.dart';
import 'package:appaviao/pages/tela_criar_conta.dart';
import 'package:appaviao/pages/tela_inicial.dart';
import 'package:appaviao/listagem_geral/tela_listagem_geral.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/pages/primeira_tela.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Main Page',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginTela());
  }
}
