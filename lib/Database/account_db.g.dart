// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountDBAdapter extends TypeAdapter<AccountDB> {
  @override
  final int typeId = 1;

  @override
  AccountDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountDB(
      username: fields[0] as String,
      password: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
