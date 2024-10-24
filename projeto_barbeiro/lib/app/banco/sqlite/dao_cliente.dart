import 'package:projeto_barbeiro/app/banco/conexao.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_cliente.dart';
import 'package:sqflite/sqflite.dart';

class DaoCliente implements IDAOCliente {
  late Database _db;
  final sqlInserir = '''
    INSERT INTO cliente (nome, idade , numeroTelefone, email, cpf, senha)
    VALUES (?,?,?,?,?,?)
  ''';
  final sqlAlterar = '''
    UPDATE cliente SET nome=?, idade=?, numeroTelefone=?, email=?, cpf=?, senha=?
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM cliente WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM cliente;
  ''';

  @override
  Future<DTOCliente> salvar(DTOCliente dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir,
        [dto.nome, dto.idade, dto.numeroTelefone, dto.email, dto.cpf, dto.senha]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOCliente> alterar(DTOCliente dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.nome, dto.idade, dto.numeroTelefone, dto.email, dto.cpf]);
    return dto;
  }

  @override
  Future<DTOCliente> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOCliente professor = DTOCliente(
        nome: resultado['nome'].toString(),
        idade: resultado['idade'].hashCode,
        numeroTelefone: resultado['numeroTelefone'].toString(),
        email: resultado['email'].toString(),
        cpf: resultado['cpf'].toString(),
        senha: resultado['senha'].toString());
    return professor;
  }

  @override
  Future<List<DTOCliente>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOCliente> Clientes = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOCliente(
          nome: linha['nome'].toString(),
          idade: linha['idade'].hashCode,
          numeroTelefone: linha['numeroTelefone'].toString(),
          email: linha['email'].toString(),
          cpf: linha['cpf'].toString(),
          senha: linha['senha'].toString());
    });
    return Clientes;
  }
}
