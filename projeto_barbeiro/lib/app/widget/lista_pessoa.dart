import 'package:flutter/material.dart';
import 'package:projeto_barbeiro/app/aplicacao/ap_cliente.dart';
import 'package:projeto_barbeiro/app/dominio/dto/dto_pessoa.dart';
import 'package:projeto_barbeiro/app/rotas.dart';

class ListaCliente extends StatefulWidget {
  @override
  _ListaClienteState createState() => _ListaClienteState();
}

class _ListaClienteState extends State<ListaCliente> {
  late Future<List<DTOCliente>> _futureClientes;

  @override
  void initState() {
    super.initState();
    _futureClientes = consultar();
  }

  Future<List<DTOCliente>> consultar() async {
    APCliente aplicacao = APCliente();
    print("Aqui instanciou o APCliente e irá fazer a requisição");
    return await aplicacao.consultar();
  }

  Widget CriarBotao(String rotulo, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(rotulo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Clientes'),
      ),
      body: FutureBuilder(
          future: _futureClientes,
          builder:
              (BuildContext context, AsyncSnapshot<List<DTOCliente>> consulta) {
            if (consulta.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (consulta.hasError) {
              return Text('Erro: ${consulta.error}');
            } else if (!consulta.hasData || consulta.data!.isEmpty) {
              return Text('Dados não encontrados');
            } else {
              List<DTOCliente> lista = consulta.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: lista.length,
                        itemBuilder: (context, index) {
                          var cliente = lista[index];
                          return ListTile(
                            leading: Icon(Icons.person),
                            title: Text(cliente.nome),
                            subtitle: Text(cliente.cpf),
                          );
                        }),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CriarBotao("Cadastrar Novo Cliente", () {
                      Navigator.pushNamed(context, Rotas.formClientes);
                    }),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CriarBotao("Atualizar", () {
                      setState(() {
                        _futureClientes = consultar();
                      });
                    }),
                  ),
                ],
              );
            }
          }),
    );
  }
}
