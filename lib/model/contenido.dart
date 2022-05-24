import 'package:cocina_ecologica/model/tema.dart';

class Contenido {
  int id;
  int orden;
  String titulo;
  String texto;
  String description;
  Tema tema;
  bool visible;
  List<String> imgs;

  Contenido(
      {required this.id,
      required this.orden,
      required this.titulo,
      required this.texto,
      required this.description,
      required this.tema,
      required this.visible,
      required this.imgs});

  factory Contenido.fromJson(Map<String, dynamic> contenido) {
    return Contenido(
      id: contenido['id'],
      orden: contenido['orden'],
      titulo: contenido['titulo'],
      texto: contenido['texto'],
      description: '<span>' + contenido['description'] + '</span>',
      tema: Tema.fromJson(contenido['tema']),
      visible: contenido['visible'],
      imgs: contenido["img"] == null
          ? []
          : List<String>.from(contenido["img"].map((x) => x)),
    );
  }
}
