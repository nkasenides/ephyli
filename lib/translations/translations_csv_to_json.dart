//Converts CSV formatted translations to JSON format

import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';

Future<void> main() async {
  var data = await File("fr.csv").readAsString();
  List<List<String>> rowsAsListOfValues = const CsvToListConverter().convert(data);
  rowsAsListOfValues.removeAt(0); //Remove header
  final Map<String, String> translations = {};
  List<String>? previousRow;
  for (final List<String> row in rowsAsListOfValues) {
    if (row[0].isNotEmpty) {
      translations[row[0]] = row[2];
      previousRow = row;
    }
    else {
      if (previousRow != null) {
        String existingValue = translations[previousRow[0]] ?? '';
        translations[previousRow[0]] = '$existingValue\n${row[2]}';
      }
    }
  }


  //OUTPUT:
  var out = File('translated-fr.json').openWrite();
  out.write(jsonEncode(translations));
  out.close();

}