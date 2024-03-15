import 'package:dndapp/file_system_manager.dart';

interface class Dao {
  FileSystemManager fs = FileSystemManager();

  void get() async {}

  void all() async {}

  void save() {}

  void update() {}

  void delete() {}
}
