class Cliente{
  dynamic id;
  String? nome;
  String? cpf;

  //gerar getter e setter para os atributos
  Cliente(){
    id = id;
    nome = nome ?? '';
    cpf = cpf;
  }
  eNomeNaoVazio(){
    if(nome!.isEmpty) throw Exception('Nome não pode ser vazio');
  }
}