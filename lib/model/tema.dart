import 'package:cocina_ecologica/model/contenido.dart';

class Tema {
  int id;
  String titulo;
  String subtitulo;
  List<String> imgs;
  String audio;
  bool visible;
  List<Contenido> contenidos = <Contenido>[];
  Tema({
    required this.id,
    required this.titulo,
    required this.subtitulo,
    required this.imgs,
    required this.visible,
    required this.audio,
  });
  factory Tema.fromJson(Map<String, dynamic> tema) {
    return Tema(
      id: tema['id'],
      titulo: tema['titulo'],
      subtitulo: '',
      imgs: tema["img"] == null
          ? []
          : List<String>.from(tema["img"].map((x) => x)),
      visible: tema["visible"],
      audio: '',
    );
  }
}
