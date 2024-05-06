import 'dart:ui';

import 'package:appaviao/pages/tela_cadastro_trecho.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class tela_inicial extends StatelessWidget {
  const tela_inicial({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(  
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("AIR TRAVEL"),
        backgroundColor: Color.fromARGB(255, 69, 159, 227),
      ),
        body: Center(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(200)),
                child: Container(
                  height: size.height * 0.4,
                  width: size.width * 1,
                  color: const Color.fromARGB(255, 0, 53, 84),
                ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.5,
              width: size.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.vertical(top: Radius.circular(1)),
              ),
            ),
          ),
          Form(
            child:
            Column(children: [
              const SizedBox(height: 30),
              const SizedBox(height: 330, width: 40000),
              Container(
                height: 100,
                width: 600,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 53, 84)), 
                  ),
                  onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: ((context) => const tela_cadastro_trecho())));
                    print('Cadastrar Trecho');
                  },
                  child: Text('Cadastrar Trecho',
                  style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            const SizedBox(height: 30),
              Container(
                height: 100,
                width: 600,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 53, 84)),
                  ),
                  onPressed: () {
                    print('Alterar Informações do Cadastro');
                  },
                  child: Text('Alterar Informações do Cadastro',
                  style: TextStyle(fontSize: 32),),
                ),
              ),
            const SizedBox(height: 30),
              Container(
                height: 100,
                width: 600,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 53, 84)),
                  ),
                  onPressed: () {
                    print('Cadastrar Aeroporto');
                  },
                  child: Text('Cadastrar Aeroporto',
                  style: TextStyle(fontSize: 32),),
                ),
              ),
            const SizedBox(height: 100),
              ElevatedButton(onPressed: () {
                print('Iniciar Viagem');
              },
                child: Text('Iniciar Viagem')
              ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}