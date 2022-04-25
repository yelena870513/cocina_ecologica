import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/model/tema.dart';

class Elemento {
  Contenido ? contenido;
  Tema ? tema;

  Elemento({this.contenido, this.tema});
  bool get isTema => tema != null;
}
