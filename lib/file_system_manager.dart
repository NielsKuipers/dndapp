import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileSystemManager {
  static final FileSystemManager _instance = FileSystemManager._internal();
  late String path;

  factory FileSystemManager() {
    return _instance;
  }

  FileSystemManager._internal() {
    _initializefileSystem();
  }

  void _initializefileSystem() async {
    final dir = await getApplicationDocumentsDirectory();
    path = dir.path;
  }

  Future<File> _getFile(String fileName) async {
    return File('$path/$fileName.json');
  }

  readFile(String fileName) async {
    try {
      File file = await _getFile(fileName);
      final data = await file.readAsString();

      return jsonDecode(data);
    } catch (e) {
      return e;
    }
  }

  // void writeFile(String fileName) async {
  //   File file = await getFile(fileName);
  //   final data = await file.readAsString();
  //   final json = jsonDecode(data);


  // }
}
