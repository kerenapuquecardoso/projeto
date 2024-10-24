import 'package:projeto_barbeiro/app/dominio/dto/dto_funcionario.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';

abstract class IDAOFuncionario {
  Future<DTOFuncionario> salvar(DTOFuncionario dto);
  Future<DTOFuncionario> alterar(DTOFuncionario dto);
  Future<DTOFuncionario> consultarPorId(int id);
  Future<List<DTOFuncionario>> consultar();
}
