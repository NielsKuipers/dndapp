import 'package:dndapp/dao.dart';
import 'package:dndapp/file_system_manager.dart';

class CharacterDao implements Dao {
  @override
  FileSystemManager fs = FileSystemManager();

  @override
  void get() async {}

  @override
  void all() async {}

  @override
  void save() {}

  @override
  void update() {}

  @override
  void delete() {}
}
