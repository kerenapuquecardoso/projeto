import 'package:projeto_barbeiro/app/banco/sqlite/dao_cliente.dart';
import 'package:projeto_barbeiro/app/dominio/Cliente.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_cliente.dart';

class APCliente {
  late DaoCliente dao;
  late Cliente dominio;

  APCliente() {
    dao = DaoCliente();
    dominio = Cliente(dao: dao);
  }

   Future<DTOCliente> salvar(DTOCliente dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOCliente> alterar(dynamic id) async {
    return await dominio.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await dominio.alterar(id);
    return true;
  }

  Future<List<DTOCliente>> consultar() async {
    return await dominio.consutlar();
  }
}