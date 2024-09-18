import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:up_todo/src/features/todo/models/category/category_model.dart';

const iconFamily = 'IconsaxPlusLinear';

/// Custom Adapter for the [Category] model used by Hive
class CategoryAdapter extends TypeAdapter<Category> {
  @override
  int get typeId => 2;

  @override
  Category read(BinaryReader reader) {
    final name = reader.readString(); // Explicitly reading a String
    final isCreatedNewButton = reader.readBool(); // Explicitly reading a bool
    final iconCode = reader.readInt(); // Reading int for IconData's codePoint
    final iconColorValue = reader.readInt(); // Reading int for Color value
    final id = reader.readString();

    return Category(
      name: name,
      icon: IconData(iconCode, fontFamily: iconFamily),
      iconColor: Color(iconColorValue),
      isCreateNewButton: isCreatedNewButton,
      id: id,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeString(obj.name) // Write name as a String
      ..writeBool(obj.isCreateNewButton) // Write isCreateNewButton as a bool
      ..writeInt(obj.icon.codePoint) // Write icon codePoint as an int
      ..writeInt(obj.iconColor.value)
      ..writeString(obj.id); // Write iconColor as an int
  }
}
