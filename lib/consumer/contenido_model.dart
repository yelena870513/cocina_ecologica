import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/data/datasources/content_datasource.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/model/registro_busqueda.dart';
import 'package:cocina_ecologica/model/tema.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContenidoModel with ChangeNotifier {
  final List<Contenido> _contenidos = ContentDataSource.contenidos;
  List<Contenido> get contenidos => _contenidos;
  final List<Tema> _temas = ContentDataSource.temas;
  List<Tema> get temas => _temas;
  late Contenido _contenidoSeleccionado;
  Contenido get contenidoSeleccionado => _contenidoSeleccionado;
  late Tema _temaSeleccionado;
  Tema get temaSeleccionado => _temaSeleccionado;

  List<RegistroBusqueda> _registroBusqueda = [];
  List<RegistroBusqueda> get registroBusqueda => _registroBusqueda;

  String _busqueda = "";
  String get busqueda => _busqueda;

  setContenidoSeleccionado(Contenido contenido) {
    _contenidoSeleccionado = _contenidoSeleccionado;
    notifyListeners();
  }

  setTemaSeleccionado(Tema tema) {
    _temaSeleccionado = tema;
    notifyListeners();
  }

  setTerminoBusqueda(String termino) {
    _busqueda = termino;
    notifyListeners();
  }

  llenarRegistroBusqueda() {
    Box listaBusqueda = Hive.box<RegistroBusqueda>(Strings.dbBusqueda);
    int registroLen = listaBusqueda.values.toList().length;
    String sensitive = _busqueda
        .replaceAll("á", "a")
        .replaceAll("é", "e")
        .replaceAll("í", "i")
        .replaceAll("ó", "o")
        .replaceAll("ú", "u")
        .replaceAll("ñ", "n");
    if (registroLen > 0) {
      List<RegistroBusqueda>? aux =
          listaBusqueda.values.toList() as List<RegistroBusqueda>;

      _registroBusqueda = aux.where((RegistroBusqueda element) {
        String titulo = element.titulo
            .replaceAll("á", "a")
            .replaceAll("é", "e")
            .replaceAll("í", "i")
            .replaceAll("ó", "o")
            .replaceAll("ú", "u")
            .replaceAll("ñ", "n");
        String texto = element.texto
            .replaceAll("á", "a")
            .replaceAll("é", "e")
            .replaceAll("í", "i")
            .replaceAll("ó", "o")
            .replaceAll("ú", "u")
            .replaceAll("ñ", "n");
        return titulo.contains(sensitive) || texto.contains(sensitive);
      }).toList();
    }

    notifyListeners();
  }

  limpiarBusqueda() {
    _busqueda = "";
    _registroBusqueda = [];

    notifyListeners();
  }
}
