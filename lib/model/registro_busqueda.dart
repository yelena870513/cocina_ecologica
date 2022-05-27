import 'package:hive/hive.dart';

part 'registro_busqueda.g.dart';

@HiveType(typeId: 0)
class RegistroBusqueda {
  @HiveField(0)
  int id;
  @HiveField(1)
  String titulo;
  @HiveField(2)
  String texto;
  RegistroBusqueda(
      {required this.id, required this.titulo, required this.texto});
}
