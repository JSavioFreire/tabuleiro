// ignore_for_file: prefer_typing_uninitialized_variables

class GameModel {
  List<Content>? content;
  Pageable? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  int? size;
  int? number;
  bool? empty;

  GameModel(
      {this.content,
      this.pageable,
      this.totalPages,
      this.totalElements,
      this.last,
      this.sort,
      this.numberOfElements,
      this.first,
      this.size,
      this.number,
      this.empty});

  GameModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    pageable =
        json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    size = json['size'];
    number = json['number'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    data['last'] = last;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['numberOfElements'] = numberOfElements;
    data['first'] = first;
    data['size'] = size;
    data['number'] = number;
    data['empty'] = empty;
    return data;
  }
}

class Content {
  String? nome;
  String? descricao;
  int? minimoJogadores;
  int? maximoJogadores;
  int? duracaoMedia;
  int? ano;
  int? idadeMinima;
  var anoLancamentoNacional;
  var mesLancamentoNacional;
  var notaMedia;
  String? urlCapa;
  bool? expansao;
  bool? prototipo;
  bool? importado;
  String? tipoFonteImportacao;
  List? idsJogosBase;
  List<Designers>? designers;
  List? artistas;
  List? editoras;
  List<Caracteristicas>? caracteristicas;
  int? id;
  String? dataCadastro;
  bool? rpg;

  Content(
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
      this.artistas,
      this.editoras,
      this.caracteristicas,
      this.id,
      this.dataCadastro,
      this.rpg});

  Content.fromJson(Map<String, dynamic> json) {
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
      json['idsJogosBase'].forEach((v) {});
    }
    if (json['designers'] != null) {
      designers = <Designers>[];
      json['designers'].forEach((v) {
        designers!.add(Designers.fromJson(v));
      });
    }
    if (json['artistas'] != null) {
      artistas = [];
      json['artistas'].forEach((v) {});
    }
    if (json['editoras'] != null) {
      editoras = [];
      json['editoras'].forEach((v) {});
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
    if (artistas != null) {
      data['artistas'] = artistas!.map((v) => v.toJson()).toList();
    }
    if (editoras != null) {
      data['editoras'] = editoras!.map((v) => v.toJson()).toList();
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
  var pais;
  int? id;
  String? dataCadastro;

  Designers(
      {this.nome,
      this.nacional,
      this.importado,
      this.tipoFonteImportacao,
      this.pais,
      this.id,
      this.dataCadastro});

  Designers.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    nacional = json['nacional'];
    importado = json['importado'];
    tipoFonteImportacao = json['tipoFonteImportacao'];
    pais = json['pais'];
    id = json['id'];
    dataCadastro = json['dataCadastro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['nacional'] = nacional;
    data['importado'] = importado;
    data['tipoFonteImportacao'] = tipoFonteImportacao;
    data['pais'] = pais;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tipo'] = tipo;
    data['descricao'] = descricao;
    data['importado'] = importado;
    data['tipoFonteImportacao'] = tipoFonteImportacao;
    data['id'] = id;
    data['dataCadastro'] = dataCadastro;
    return data;
  }
}

class Pageable {
  Sort? sort;
  int? pageSize;
  int? pageNumber;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.sort,
      this.pageSize,
      this.pageNumber,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['pageSize'] = pageSize;
    data['pageNumber'] = pageNumber;
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? unsorted;
  bool? empty;

  Sort({this.sorted, this.unsorted, this.empty});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    unsorted = json['unsorted'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sorted'] = sorted;
    data['unsorted'] = unsorted;
    data['empty'] = empty;
    return data;
  }
}
