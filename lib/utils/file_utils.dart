import 'package:flutter/services.dart';

class FileUtils {

    static Future<String> readAssetFile(String path) async {
      return await rootBundle.loadString(path);
    }

}