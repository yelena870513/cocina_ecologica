import 'package:cocina_ecologica/model/contenido.dart';

class Tema {
  final String titulo;
  final String subtitulo;
  final List<Contenido> contenidos;

  Tema(
      {required this.titulo,
      required this.subtitulo,
      required this.contenidos});
}
