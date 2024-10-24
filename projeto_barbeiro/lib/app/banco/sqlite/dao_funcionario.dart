import 'package:projeto_barbeiro/app/banco/conexao.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_funcionario.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_funcionario.dart';
import 'package:sqflite/sqflite.dart';

class DaoFuncionario implements IDAOFuncionario {
  late Database _db;
  final sqlInserir = '''
    INSERT INTO funcionario (nome, idade , numeroTelefone, email, cpf, senha, cargo)
    VALUES (?,?,?,?,?,?,?)
  ''';
  final sqlAlterar = '''
    UPDATE funcionario SET nome=?, idade=?, numeroTelefone=?, email=?, cpf=?, cargo=?, senha=?
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM funcionario WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM funcionario;
  ''';

  @override
  Future<DTOFuncionario> salvar(DTOFuncionario dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir,
        [dto.nome, dto.idade, dto.numeroTelefone, dto.email, dto.cpf]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOFuncionario> alterar(DTOFuncionario dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.nome, dto.idade, dto.numeroTelefone, dto.email, dto.cpf]);
    return dto;
  }

  @override
  Future<DTOFuncionario> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOFuncionario professor = DTOFuncionario(
        nome: resultado['nome'].toString(),
        idade: resultado['idade'].hashCode,
        numeroTelefone: resultado['numeroTelefone'].toString(),
        email: resultado['email'].toString(),
        cpf: resultado['cpf'].toString(),
        senha: resultado['senha'].toString(),
        cargo: resultado['cargo'].toString());
    return professor;
  }

  @override
  Future<List<DTOFuncionario>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOFuncionario> Clientes = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOFuncionario(
          nome: linha['nome'].toString(),
          idade: linha['idade'].hashCode,
          numeroTelefone: linha['numeroTelefone'].toString(),
          email: linha['email'].toString(),
          cpf: linha['cpf'].toString(),
          senha: linha['senha'].toString(),
          cargo: linha['cargo'].toString());
    });
    return Clientes;
  }
}
