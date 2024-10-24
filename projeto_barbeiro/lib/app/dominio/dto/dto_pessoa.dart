import 'package:projeto_barbeiro/app/dominio/cpf.dart';

class DTOCliente {
  late String nome;
  late int idade;
  late String email;
  late String cpf;
  late String senha;
  late String numeroTelefone;

  DTOCliente(
      {required this.idade,
      required this.nome,
      required this.email,
      required this.cpf,
      required this.senha,
      required this.numeroTelefone});

  set id(int id) {}
}
