// ignore_for_file: prefer_void_to_null, prefer_collection_literals

class EachGame {
  String? nome;
  String? descricao;
  int? minimoJogadores;
  int? maximoJogadores;
  int? duracaoMedia;
  int? ano;
  int? idadeMinima;
  Null anoLancamentoNacional;
  Null mesLancamentoNacional;
  Null notaMedia;
  String? urlCapa;
  bool? expansao;
  bool? prototipo;
  bool? importado;
  String? tipoFonteImportacao;
  List<Null>? idsJogosBase;
  List<Designers>? designers;
  List<Caracteristicas>? caracteristicas;
  int? id;
  String? dataCadastro;
  bool? rpg;

  EachGame(
      {this.nome,
      this.descricao,
      this.minimoJogadores,
      this.maximoJogadores,
      this.duracaoMedia,
      this.ano,
      this.idadeMinima,
      this.anoLancamentoNacional,
      this.mesLancamentoNacional,
      this.notaMedia,
      this.urlCapa,
      this.expansao,
      this.prototipo,
      this.importado,
      this.tipoFonteImportacao,
      this.idsJogosBase,
      this.designers,
      this.caracteristicas,
      this.id,
      this.dataCadastro,
      this.rpg});

  EachGame.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    minimoJogadores = json['minimoJogadores'];
    maximoJogadores = json['maximoJogadores'];
    duracaoMedia = json['duracaoMedia'];
    ano = json['ano'];
    idadeMinima = json['idadeMinima'];
    anoLancamentoNacional = json['anoLancamentoNacional'];
    mesLancamentoNacional = json['mesLancamentoNacional'];
    notaMedia = json['notaMedia'];
    urlCapa = json['urlCapa'];
    expansao = json['expansao'];
    prototipo = json['prototipo'];
    importado = json['importado'];
    tipoFonteImportacao = json['tipoFonteImportacao'];
    if (json['idsJogosBase'] != null) {
      idsJogosBase = <Null>[];
    }
    if (json['designers'] != null) {
      designers = <Designers>[];
      json['designers'].forEach((v) {
        designers!.add(Designers.fromJson(v));
      });
    }

    if (json['caracteristicas'] != null) {
      caracteristicas = <Caracteristicas>[];
      json['caracteristicas'].forEach((v) {
        caracteristicas!.add(Caracteristicas.fromJson(v));
      });
    }
    id = json['id'];
    dataCadastro = json['dataCadastro'];
    rpg = json['rpg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['minimoJogadores'] = minimoJogadores;
    data['maximoJogadores'] = maximoJogadores;
    data['duracaoMedia'] = duracaoMedia;
    data['ano'] = ano;
    data['idadeMinima'] = idadeMinima;
    data['anoLancamentoNacional'] = anoLancamentoNacional;
    data['mesLancamentoNacional'] = mesLancamentoNacional;
    data['notaMedia'] = notaMedia;
    data['urlCapa'] = urlCapa;
    data['expansao'] = expansao;
    data['prototipo'] = prototipo;
    data['importado'] = importado;
    data['tipoFonteImportacao'] = tipoFonteImportacao;

    if (designers != null) {
      data['designers'] = designers!.map((v) => v.toJson()).toList();
    }

    if (caracteristicas != null) {
      data['caracteristicas'] =
          caracteristicas!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['dataCadastro'] = dataCadastro;
    data['rpg'] = rpg;
    return data;
  }
}

class Designers {
  String? nome;
  bool? nacional;
  bool? importado;
  String? tipoFonteImportacao;
  int? id;
  String? dataCadastro;

  Designers(
      {this.nome,
      this.nacional,
      this.importado,
      this.tipoFonteImportacao,
      this.id,
      this.dataCadastro});

  Designers.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    nacional = json['nacional'];
    importado = json['importado'];
    tipoFonteImportacao = json['tipoFonteImportacao'];
    id = json['id'];
    dataCadastro = json['dataCadastro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = nome;
    data['nacional'] = nacional;
    data['importado'] = importado;
    data['tipoFonteImportacao'] = tipoFonteImportacao;
    data['id'] = id;
    data['dataCadastro'] = dataCadastro;
    return data;
  }
}

class Caracteristicas {
  String? tipo;
  String? descricao;
  bool? importado;
  String? tipoFonteImportacao;
  int? id;
  String? dataCadastro;

  Caracteristicas(
      {this.tipo,
      this.descricao,
      this.importado,
      this.tipoFonteImportacao,
      this.id,
      this.dataCadastro});

  Caracteristicas.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    descricao = json['descricao'];
    importado = json['importado'];
    tipoFonteImportacao = json['tipoFonteImportacao'];
    id = json['id'];
    dataCadastro = json['dataCadastro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['tipo'] = tipo;
    data['descricao'] = descricao;
    data['importado'] = importado;
    data['tipoFonteImportacao'] = tipoFonteImportacao;
    data['id'] = id;
    data['dataCadastro'] = dataCadastro;
    return data;
  }
}
