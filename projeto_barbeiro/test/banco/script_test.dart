import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_barbeiro/app/banco/conexao.dart';
import 'package:projeto_barbeiro/app/banco/script.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main(){
  setUpAll((){ 
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
    }
  );

  test('teste script create table',() async{
    var db2 = await openDatabase(inMemoryDatabasePath);
    deleteDatabase(db2.path);
    var db = await openDatabase(inMemoryDatabasePath, version: 1, onCreate: (db, version) {
      criarTabelas.forEach(db.execute);
      inserirRegistros.forEach(db.execute);
    });
    var listCliente = await db.rawQuery('SELECT * FROM cliente');
    expect(listCliente.length, 3);

  });

}