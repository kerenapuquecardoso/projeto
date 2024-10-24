import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/dominio/cliente.dart';
import 'package:projeto_barbeiro/app/dominio/interface/i_dao_cliente.dart';

// Classe de DAO fictícia para armazenar os dados temporariamente (sem usar mocks)
class DAOClienteSimples implements IDAOCliente {
  final List<DTOCliente> _clientes = [];

  @override
  Future<DTOCliente> salvar(DTOCliente dto) async {
    _clientes.add(dto);
    return dto;
  }

  @override
  Future<DTOCliente> alterar(dynamic id) async {
    return _clientes.firstWhere((cliente) => cliente.nome == id);
  }



  @override
  Future<List<DTOCliente>> consultar() async {
    return _clientes;
  }
  
  @override
  Future<DTOCliente> consultarPorId(int id) {
    // TODO: implement consultarPorId
    throw UnimplementedError();
  }
}

void main() {
  late Cliente cliente;
  late DAOClienteSimples daoClienteSimples;

  setUp(() {
    daoClienteSimples = DAOClienteSimples();
    cliente = Cliente(dao: daoClienteSimples);
  });

  group('Testes de validação de dados', () {
    test('Nome não pode ser nulo ou vazio', () {
      expect(() => cliente.nome = null, throwsException);
      expect(() => cliente.nome = '', throwsException);
    });

    test('Deve aceitar nome válido', () {
      cliente.nome = 'Keren';
      expect(cliente.nome, 'Keren');
    });

    test('Idade não pode ser nula', () {
      expect(() => cliente.idade = null, throwsException);
    });

    test('Deve aceitar idade válida', () {
      cliente.idade = 25;
      expect(cliente.idade, 25);
    });

    test('CPF não pode ser nulo ou vazio', () {
      expect(() => cliente.cpf = null, throwsException);
      expect(() => cliente.cpf = '', throwsException);
    });

    test('Deve aceitar CPF válido', () {
      cliente.cpf = '12345678901';
      expect(cliente.cpf, '12345678901');
    });

    test('Telefone não pode ser nulo', () {
      expect(() => cliente.numeroTelefone = null, throwsException);
    });

    test('Deve aceitar telefone válido', () {
      cliente.numeroTelefone = '123456789';
      expect(cliente.numeroTelefone, '123456789');
    });

    test('Senha não pode ser nula', () {
      expect(() => cliente.senha = null, throwsException);
    });

    test('Deve aceitar senha válida', () {
      cliente.senha = 'Senha@123';
      expect(cliente.senha, 'Senha@123');
    });

    test('Validação de senha com requisitos corretos', () {
      var senhaValida = Cliente.ValidarSenha('Senha@123');
      expect(senhaValida, true);

      var senhaInvalida = Cliente.ValidarSenha('senha');
      expect(senhaInvalida, false);
    });
  });

  group('Testes de operações de banco de dados (DAO simples)', () {
    test('Deve salvar um cliente com sucesso', () async {
      final dto = DTOCliente(
        nome: 'Keren',
        idade: 25,
        email: 'keren@email.com',
        cpf: '12345678901',
        numeroTelefone: '123456789',
        senha: 'Senha@123',
      );

      var clienteSalvo = await cliente.salvar(dto);

      expect(clienteSalvo.nome, 'Keren');
      expect(clienteSalvo.idade, 25);
      expect(clienteSalvo.email, 'keren@email.com');
      expect(clienteSalvo.cpf, '12345678901');

      var clientesConsultados = await cliente.consutlar();
      expect(clientesConsultados.length, 1);
      expect(clientesConsultados.first.nome, 'Keren');
    });

  });
}
