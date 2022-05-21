// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contenido_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContenidoStore on _ContenidoStore, Store {
  Computed<bool>? _$hidePlaceholderComputed;

  @override
  bool get hidePlaceholder =>
      (_$hidePlaceholderComputed ??= Computed<bool>(() => super.hidePlaceholder,
              name: '_ContenidoStore.hidePlaceholder'))
          .value;
  Computed<bool>? _$loadingContenidoComputed;

  @override
  bool get loadingContenido => (_$loadingContenidoComputed ??= Computed<bool>(
          () => super.loadingContenido,
          name: '_ContenidoStore.loadingContenido'))
      .value;
  Computed<bool>? _$loadingTemaComputed;

  @override
  bool get loadingTema =>
      (_$loadingTemaComputed ??= Computed<bool>(() => super.loadingTema,
              name: '_ContenidoStore.loadingTema'))
          .value;
  Computed<List<Contenido>>? _$contenidosComputed;

  @override
  List<Contenido> get contenidos => (_$contenidosComputed ??=
          Computed<List<Contenido>>(() => super.contenidos,
              name: '_ContenidoStore.contenidos'))
      .value;
  Computed<List<Tema>>? _$temasComputed;

  @override
  List<Tema> get temas =>
      (_$temasComputed ??= Computed<List<Tema>>(() => super.temas,
              name: '_ContenidoStore.temas'))
          .value;
  Computed<Tema>? _$selectedTemaComputed;

  @override
  Tema get selectedTema =>
      (_$selectedTemaComputed ??= Computed<Tema>(() => super.selectedTema,
              name: '_ContenidoStore.selectedTema'))
          .value;
  Computed<List<Contenido>>? _$selectedContenidosComputed;

  @override
  List<Contenido> get selectedContenidos => (_$selectedContenidosComputed ??=
          Computed<List<Contenido>>(() => super.selectedContenidos,
              name: '_ContenidoStore.selectedContenidos'))
      .value;
  Computed<int>? _$selectedContenidosCountComputed;

  @override
  int get selectedContenidosCount => (_$selectedContenidosCountComputed ??=
          Computed<int>(() => super.selectedContenidosCount,
              name: '_ContenidoStore.selectedContenidosCount'))
      .value;
  Computed<int>? _$contenidosCountComputed;

  @override
  int get contenidosCount =>
      (_$contenidosCountComputed ??= Computed<int>(() => super.contenidosCount,
              name: '_ContenidoStore.contenidosCount'))
          .value;
  Computed<String>? _$searchTermComputed;

  @override
  String get searchTerm =>
      (_$searchTermComputed ??= Computed<String>(() => super.searchTerm,
              name: '_ContenidoStore.searchTerm'))
          .value;
  Computed<int>? _$idContenidoSeleccionadoComputed;

  @override
  int get idContenidoSeleccionado => (_$idContenidoSeleccionadoComputed ??=
          Computed<int>(() => super.idContenidoSeleccionado,
              name: '_ContenidoStore.idContenidoSeleccionado'))
      .value;

  final _$successAtom = Atom(name: '_ContenidoStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$_selectedTemaAtom = Atom(name: '_ContenidoStore._selectedTema');

  @override
  Tema get _selectedTema {
    _$_selectedTemaAtom.reportRead();
    return super._selectedTema;
  }

  @override
  set _selectedTema(Tema value) {
    _$_selectedTemaAtom.reportWrite(value, super._selectedTema, () {
      super._selectedTema = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_ContenidoStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$_contenidosAtom = Atom(name: '_ContenidoStore._contenidos');

  @override
  List<Contenido> get _contenidos {
    _$_contenidosAtom.reportRead();
    return super._contenidos;
  }

  @override
  set _contenidos(List<Contenido> value) {
    _$_contenidosAtom.reportWrite(value, super._contenidos, () {
      super._contenidos = value;
    });
  }

  final _$_temasAtom = Atom(name: '_ContenidoStore._temas');

  @override
  List<Tema> get _temas {
    _$_temasAtom.reportRead();
    return super._temas;
  }

  @override
  set _temas(List<Tema> value) {
    _$_temasAtom.reportWrite(value, super._temas, () {
      super._temas = value;
    });
  }

  final _$_searchTermAtom = Atom(name: '_ContenidoStore._searchTerm');

  @override
  String get _searchTerm {
    _$_searchTermAtom.reportRead();
    return super._searchTerm;
  }

  @override
  set _searchTerm(String value) {
    _$_searchTermAtom.reportWrite(value, super._searchTerm, () {
      super._searchTerm = value;
    });
  }

  final _$_hidePlaceholderAtom = Atom(name: '_ContenidoStore._hidePlaceholder');

  @override
  bool get _hidePlaceholder {
    _$_hidePlaceholderAtom.reportRead();
    return super._hidePlaceholder;
  }

  @override
  set _hidePlaceholder(bool value) {
    _$_hidePlaceholderAtom.reportWrite(value, super._hidePlaceholder, () {
      super._hidePlaceholder = value;
    });
  }

  final _$_idContenidoSeleccionadoAtom =
      Atom(name: '_ContenidoStore._idContenidoSeleccionado');

  @override
  int get _idContenidoSeleccionado {
    _$_idContenidoSeleccionadoAtom.reportRead();
    return super._idContenidoSeleccionado;
  }

  @override
  set _idContenidoSeleccionado(int value) {
    _$_idContenidoSeleccionadoAtom
        .reportWrite(value, super._idContenidoSeleccionado, () {
      super._idContenidoSeleccionado = value;
    });
  }

  final _$_ContenidoStoreActionController =
      ActionController(name: '_ContenidoStore');

  @override
  Future<List<Contenido>> getContenidos() {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction(
        name: '_ContenidoStore.getContenidos');
    try {
      return super.getContenidos();
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hidenPlaceholder(bool value) {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction(
        name: '_ContenidoStore.hidenPlaceholder');
    try {
      return super.hidenPlaceholder(value);
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Tema>> getTemas() {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction(
        name: '_ContenidoStore.getTemas');
    try {
      return super.getTemas();
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTema(Tema tema) {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction(
        name: '_ContenidoStore.setSelectedTema');
    try {
      return super.setSelectedTema(tema);
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchTerm(String term) {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction(
        name: '_ContenidoStore.setSearchTerm');
    try {
      return super.setSearchTerm(term);
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdContenidoSeleccionado(int term) {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction(
        name: '_ContenidoStore.setIdContenidoSeleccionado');
    try {
      return super.setIdContenidoSeleccionado(term);
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
success: ${success},
errorMessage: ${errorMessage},
hidePlaceholder: ${hidePlaceholder},
loadingContenido: ${loadingContenido},
loadingTema: ${loadingTema},
contenidos: ${contenidos},
temas: ${temas},
selectedTema: ${selectedTema},
selectedContenidos: ${selectedContenidos},
selectedContenidosCount: ${selectedContenidosCount},
contenidosCount: ${contenidosCount},
searchTerm: ${searchTerm},
idContenidoSeleccionado: ${idContenidoSeleccionado}
    ''';
  }
}
