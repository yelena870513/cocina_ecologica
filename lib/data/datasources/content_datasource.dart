import 'dart:async';
import 'dart:convert';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/model/tema.dart';
import 'package:flutter/services.dart';

class ContentDataSource {
  late Map<String, dynamic> _contenidoData;
  static List<Contenido> contenidos = List.empty(growable: true);
  static List<Tema> temas = List.empty(growable: true);

  Future<bool> loadData() async {
    String jsonString = await rootBundle.loadString('assets/data/cocina.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _contenidoData = jsonMap;
    List<dynamic> mappedContenido = _contenidoData['contenido'];
    contenidos = mappedContenido.map((f) => Contenido.fromJson(f)).toList();

    List<dynamic> mappedTema = _contenidoData['tema'];
    temas = mappedTema.map((f) => Tema.fromJson(f)).toList();

    for (int i = 0; i < temas.length; i++) {
      temas[i].contenidos = contenidos.where((Contenido contenido) {
        return contenido.tema.id == temas[i].id;
      }).toList();
    }

    return true;
  }
}
