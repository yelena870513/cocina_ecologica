import 'package:cocina_ecologica/data/datasources/content_datasource.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/model/tema.dart';
import 'package:flutter/material.dart';

class ContenidoModel with ChangeNotifier {
  final List<Contenido> _contenidos = ContentDataSource.contenidos;
  List<Contenido> get contenidos => _contenidos;
  final List<Tema> _temas = ContentDataSource.temas;
  List<Tema> get temas => _temas;
  late Contenido _contenidoSeleccionado;
  Contenido get contenidoSeleccionado => _contenidoSeleccionado;
  late Tema _temaSeleccionado;
  Tema get temaSeleccionado => _temaSeleccionado;

  setContenidoSeleccionado(Contenido contenido) {
    _contenidoSeleccionado = _contenidoSeleccionado;
    notifyListeners();
  }

  setTemaSeleccionado(Tema tema) {
    _temaSeleccionado = tema;
    notifyListeners();
  }
}
