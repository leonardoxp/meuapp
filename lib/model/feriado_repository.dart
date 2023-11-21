import 'dart:convert';

import 'package:meuapp/core/constantes.dart';
import 'package:meuapp/model/course_model.dart';
import 'package:http/http.dart' as http;
import 'package:meuapp/model/feriado_model.dart';

class FeriadosRepository {
  final Uri url = Uri.parse(urlBrasilAPI);

  Future<List<FeriadoEntity>> getAll() async {
    List<FeriadoEntity> feriadoList = [];
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      for (var feriado in json) {
        feriadoList.add(FeriadoEntity.fromJson(feriado));
      }
    }
    return feriadoList;
  }
}
