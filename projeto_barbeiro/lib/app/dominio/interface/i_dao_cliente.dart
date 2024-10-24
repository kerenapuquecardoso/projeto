import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';

abstract class IDAOCliente {
  Future<DTOCliente> salvar(DTOCliente dto);
  Future<DTOCliente> alterar(DTOCliente dto);
  Future<DTOCliente> consultarPorId(int id);
  Future<List<DTOCliente>> consultar();
}
