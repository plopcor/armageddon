// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 1;

  @override
  User read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    //print(fields[7].toString());
    return User(
      id: fields[0] as int,
      nombre: fields[1] as String,
      usuario: fields[2] as String,
      email: fields[3] as String,
      createdAt: fields[4] as dynamic,
      updatedAt: fields[5] as dynamic,
      avatar: fields[6] as String,
      esTienda: fields[7] == 0 ? false : true,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.usuario)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.avatar)
      ..writeByte(7)
      ..write(obj.esTienda);
  }
}
