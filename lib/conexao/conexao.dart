import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:appaviao/DTOS/usuarioDTO/usuario_dto.dart';

class conexao {
  static const _dbname = "appaviao.db";

  static const _sqlScriptaeroporto = '''
  CREATE TABLE IF NOT EXISTS aeroporto (
    idaeroporto INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo_aero TEXT NOT NULL,
    nome_aero TEXT NOT NULL,
    twr_aero TEXT NOT NULL,
    solo_aero TEXT NOT NULL,
    cabeceira_aero TEXT NOT NULL,
    fir_aero TEXT NOT NULL,
    metragem_pista TEXT NOT NULL,
    patio_aero TEXT NOT NULL
  )''';

  static const _sqlScriptControle = '''
  CREATE TABLE IF NOT EXISTS controleVoo (
    idcontroleVoo INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeViagem TEXT NOT NULL,
    dataViagem TEXT NOT NULL,
    controle TEXT NOT NULL,
    lat TEXT NOT NULL,
    lag TEXT NOT NULL,
    long TEXT NOT NULL,
    qmh_local TEXT NOT NULL,
    qmh_destino TEXT NOT NULL,
    radio TEXT NOT NULL,
    transponder_1 TEXT NOT NULL,
    transponder_emergencia TEXT NOT NULL,
    elevacao_local TEXT NOT NULL,
    elevacao_destino TEXT NOT NULL,
    altitude_obrigatorio TEXT NOT NULL,
    tempo_voo_estimado TEXT NOT NULL,
    alternativo_1 TEXT NOT NULL,
    alternativo_2 TEXT NOT NULL
  )''';

  static const _sqlScriptTrecho = '''
  CREATE TABLE IF NOT EXISTS trecho (
    idtrecho INTEGER PRIMARY KEY AUTOINCREMENT,
    de_trecho TEXT NOT NULL,
    para_trecho TEXT NOT NULL,
    trecho_trecho TEXT NOT NULL,
    proa_trecho TEXT NOT NULL,
    dist_trecho TEXT NOT NULL,
    corredor_trecho TEXT NOT NULL,
    altCorredor_trecho TEXT NOT NULL,
    frequencia_trecho TEXT NOT NULL,
    frequenciaAlter_trecho TEXT NOT NULL
  )''';

  static const _sqlScriptUsuarios = '''
  CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT NOT NULL,
    email TEXT NOT NULL,
    senha TEXT NOT NULL,
    modeloAeronave TEXT NOT NULL,
    codigoAeronave TEXT NOT NULL
  )''';

  // Singleton
  conexao._privateConstructor();
  static final conexao instance = conexao._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initDB();
  }

  Future<Database> initDB() async {
    sqfliteFfiInit(); // Inicializa o ffi
    databaseFactory = databaseFactoryFfi; // Define a fábrica para o FFI
    final path = join(await getDatabasesPath(), _dbname);
    //await deleteDatabase(path);
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(_sqlScriptaeroporto);
        await db.execute(_sqlScriptControle);
        await db.execute(_sqlScriptUsuarios);
        await db.execute(_sqlScriptTrecho);
        print('Tabelas criadas com sucesso!');
      },
      version: 1, // Atualize a versão do banco de dados
    );
  }

  Future<UsuarioDTO?> getUsuario() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('usuarios');
    if (maps.isNotEmpty) {
      return UsuarioDTO.fromMap(maps.first);
    } else {
      return null;
    }
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Testando Banco de Dados"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              var db = await conexao.instance.database;
              print("Banco de dados inicializado: $db");

              // Teste para verificar se a tabela 'trecho' foi criada
              try {
                List<Map<String, dynamic>> result = await db.query('trecho');
                print(
                    "Tabela 'trecho' existe e contém ${result.length} registros.");
              } catch (e) {
                print("Erro ao acessar a tabela 'trecho': $e");
              }
              try {
                List<Map<String, dynamic>> result = await db.query('aeroporto');
                print(
                    "Tabela 'aeroporto' existe e contém ${result.length} registros.");
              } catch (e) {
                print("Erro ao acessar a tabela 'aeroporto': $e");
              }
              try {
                List<Map<String, dynamic>> result =
                    await db.query('controleVoo');
                print(
                    "Tabela 'controleVoo' existe e contém ${result.length} registros.");
              } catch (e) {
                print("Erro ao acessar a tabela 'controleVoo': $e");
              }
              try {
                List<Map<String, dynamic>> result = await db.query('Usuarios');
                print(
                    "Tabela 'Usuarios' existe e contém ${result.length} registros.");
              } catch (e) {
                print("Erro ao acessar a tabela 'Usuarios': $e");
              }
            },
            child: const Text("Iniciar Banco de Dados"),
          ),
        ),
      ),
    );
  }
}
