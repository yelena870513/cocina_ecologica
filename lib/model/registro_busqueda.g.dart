// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_busqueda.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistroBusquedaAdapter extends TypeAdapter<RegistroBusqueda> {
  @override
  final int typeId = 0;

  @override
  RegistroBusqueda read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistroBusqueda(
      id: fields[0] as int,
      titulo: fields[1] as String,
      texto: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RegistroBusqueda obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titulo)
      ..writeByte(2)
      ..write(obj.texto);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistroBusquedaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
