import 'dart:convert';
import 'package:http/http.dart' as http;

class HolidayService {
  final String apiUrl;

  HolidayService(this.apiUrl);

  Future<List<FeriadoModel>> fetchHolidays(int year) async {
    final response = await http.get(Uri.parse('$apiUrl/$year'));
    final List<FeriadoModel> feriadoList = [];

    if (response.statusCode == 200) {

       final json = jsonDecode(response.body) as List;
      for (var feriado in json) {
        feriadoList.add(FeriadoModel.fromJson(feriado));
      }
      return feriadoList;
    } else {
      throw Exception('Falha ao carregar os feriados da API');
    }
  }
}

class FeriadoModel {

  String? name;
  String? date;

  FeriadoModel({this.name, this.date});

  static FeriadoModel fromJson(Map<String, dynamic> map) {
    return FeriadoModel(
        name: map['name'],
        date: map['date']
    );
  }
}
