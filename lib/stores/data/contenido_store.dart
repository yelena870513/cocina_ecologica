import 'package:cocina_ecologica/data/repository.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/model/tema.dart';
import 'package:mobx/mobx.dart';

part 'contenido_store.g.dart';

class ContenidoStore = _ContenidoStore with _$ContenidoStore;

abstract class _ContenidoStore with Store {
  final Repository _repository;

  _ContenidoStore(Repository repository) : _repository = repository;

  static ObservableFuture<List<Contenido>> contenidoResponse =
      ObservableFuture.value(List.empty());

  static ObservableFuture<List<Tema>> temaResponse =
      ObservableFuture.value(List.empty());

  @observable
  bool success = false;

  @observable
  Tema _selectedTema = Tema(
      id: 100, subtitulo: '', titulo: '', imgs: '', audio: '', visible: false);

  @observable
  String errorMessage = '';

  @observable
  List<Contenido> _contenidos = [];

  @observable
  List<Tema> _temas = [];

  @observable
  String _searchTerm = '';

  @observable
  bool _hidePlaceholder = false;

  @observable
  int _idContenidoSeleccionado = 0;

  @computed
  bool get hidePlaceholder => _hidePlaceholder;

  @computed
  bool get loadingContenido => contenidoResponse.status == FutureStatus.pending;

  @computed
  bool get loadingTema => temaResponse.status == FutureStatus.pending;

  @computed
  List<Contenido> get contenidos {
    return _contenidos.toList();
  }

  @computed
  List<Tema> get temas {
    return _temas.toList();
  }

  @computed
  Tema get selectedTema {
    return _selectedTema;
  }

  @computed
  List<Contenido> get selectedContenidos {
    return _contenidos.where((Contenido c) {
      return c.tema.id == selectedTema.id;
    }).toList();
  }

  @computed
  int get selectedContenidosCount {
    return _contenidos
        .where((Contenido c) {
          return c.tema.id == selectedTema.id;
        })
        .toList()
        .length;
  }

  @computed
  int get contenidosCount {
    return contenidos.length;
  }

  @computed
  String get searchTerm {
    return _searchTerm;
  }

  @computed
  int get idContenidoSeleccionado {
    return _idContenidoSeleccionado;
  }

  @action
  Future<List<Contenido>> getContenidos() {
    final future = _repository.getContenidos();
    contenidoResponse = ObservableFuture(future);

    return future.then((contenidos) {
      _contenidos = contenidos.toList();
      errorMessage = '';
      return _contenidos.toList();
    }).catchError((error) {
      errorMessage = error.toString();
    });
  }

  @action
  void hidenPlaceholder(bool value) {
    _hidePlaceholder = value;
  }

  @action
  Future<List<Tema>> getTemas() {
    final future = _repository.getContenidoTemas();
    temaResponse = ObservableFuture(future);

    return future.then((temas) {
      _temas = temas.toList();
      errorMessage = '';
      return temas.toList();
    }).catchError((error) {
      errorMessage = error.toString();
    });
  }

  @action
  void setSelectedTema(Tema tema) {
    _selectedTema = tema;
  }

  @action
  void setSearchTerm(String term) {
    _searchTerm = term;
  }

  @action
  void setIdContenidoSeleccionado(int term) {
    _idContenidoSeleccionado = term;
  }
}
