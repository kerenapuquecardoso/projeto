import 'package:projeto_barbeiro/app/dominio/cpf.dart';

class DTOFuncionario {
  late String nome;
  late int idade;
  late String email;
  late String cpf;
  late String senha;
  late String numeroTelefone;
  late String cargo;

  DTOFuncionario(
      {required this.idade,
      required this.nome,
      required this.email,
      required this.cpf,
      required this.senha,
      required this.numeroTelefone,
      required this.cargo});

  set id(int id) {}
}
