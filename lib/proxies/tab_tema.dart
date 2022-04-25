import 'package:cocina_ecologica/model/tema.dart';

class TabTema {
  final Tema tema;
  final bool seleccionado;
  final double offsetFrom;
  final double offsetTo;

  TabTema({required this.tema, required this.seleccionado, required this.offsetFrom, required this.offsetTo});

  TabTema copyWith(bool seleccionado) =>
      TabTema(tema: tema, seleccionado: seleccionado, offsetFrom: offsetFrom, offsetTo: offsetTo);
}
