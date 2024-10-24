import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_cliente.dart';

class Cliente {
  dynamic _id;
  String? _nome;
  String? _email;
  int? _idade;
  String? _numeroTelefone;
  String? _cpf;
  String? _senha;
  IDAOCliente dao;

  Cliente({required this.dao});

  validar({required DTOCliente dto}) {
    nome = dto.nome;
    email = dto.email;
    idade = dto.idade;
    cpf = dto.cpf;
    senha = dto.senha;
    numeroTelefone = dto.numeroTelefone!;
  }

  Future<DTOCliente> salvar(DTOCliente dto) {
    validar(dto: dto);
    return dao.salvar(dto);
  }

  Future<DTOCliente> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(_id);
  }

  Future<bool> excluir(dynamic id) async {
    this.id = id;
    return true;
  }

  Future<List<DTOCliente>> consutlar() async {
    return await dao.consultar();
  }

  String? get nome => _nome;
  String? get email => _email;
  int? get idade => _idade;
  String? get cpf => _cpf;
  String? get numeroTelefone => _numeroTelefone;
  String? get senha => _senha;

  set id(int? id) {
    if (id == null) throw Exception('ID não pode ser nulo');
    if (id < 0) throw Exception('ID não pode ser negativo');
    _id = id;
  }

  set nome(String? nome) {
    if (nome == null) throw Exception('Nome não pode ser nulo.');
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio.');
    _nome = nome;
  }

  set idade(int? idade) {
    if (idade == null) throw Exception('Idade não pode ser nulo.');
    _idade = idade;
  }

  set email(String? email) {
    if (email == null) throw Exception('Email não pode ser nulo.');
    _email = email;
  }

  set cpf(String? cpf) {
    if (cpf == null) throw Exception('CPF não pode ser nulo.');
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio.');
    _cpf = cpf;
  }

  set numeroTelefone(String? numeroTelefone) {
    if (numeroTelefone == null)
      throw Exception('Numero de telefone não pode ser nulo.');
    _numeroTelefone = numeroTelefone;
  }

  set senha(String? senha) {
    if (senha == null) throw Exception('Senha não pode ser nulo.');
    _senha = senha;
  }

  static bool ValidarSenha(String senha) {
    if (senha.isEmpty) {
      return false;
    }

    bool temLetraMaiuscula = senha.contains(RegExp(r'[A-Z]'));
    bool temLetraMinuscula = senha.contains(RegExp(r'[a-z]'));
    bool temNumeros = senha.contains(RegExp(r'[0-9]'));
    bool temCaractereEspecial =
        senha.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>-_]'));
    bool temTamanhoMinimo = senha.length >= 8;

    return temLetraMaiuscula &&
        temLetraMinuscula &&
        temNumeros &&
        temCaractereEspecial &&
        temTamanhoMinimo;
  }
}
