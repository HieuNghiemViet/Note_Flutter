import 'package:floor/floor.dart';

@entity
class Notes {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? title;
  String? description;

  Notes({this.id, this.title, this.description});
}