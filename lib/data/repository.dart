import 'dart:async';

import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/model/tema.dart';

import 'datasources/content_datasource.dart';

class Repository {
  // data source object
  final ContentDataSource _contentDataSource;

  // constructor
  Repository(this._contentDataSource);

  Future<bool> cargarDatos() {
    return _contentDataSource.loadData();
  }

  Future<List<Contenido>> getContenidos() {
    if (ContentDataSource.contenidos.isEmpty) {
      _contentDataSource.loadData();
    }
    return Future(() => ContentDataSource.contenidos);
  }

  Future<List<Tema>> getContenidoTemas() {
    if (ContentDataSource.temas.isEmpty) {
      _contentDataSource.loadData();
    }
    return Future(() => ContentDataSource.temas);
  }
}
