

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:projeto_barbeiro/app/banco/conexao.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  setUpAll(() async {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
    var path = join(await getDatabasesPath(), 'banco.db');
    await databaseFactory.deleteDatabase(path);
    db = await Conexao.iniciar();
  });

  test('teste script create database ',() async{
    var listCliente = await db.rawQuery('SELECT * FROM cliente');
    expect(listCliente.length, 3);
  });

  
}