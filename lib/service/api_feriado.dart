import 'dart:convert';
import 'package:http/http.dart' as http;

class HolidayService {
  final String apiUrl;

  HolidayService(this.apiUrl);

  Future<List<String>> fetchHolidays(int year) async {
    final response = await http.get(Uri.parse('$apiUrl/$year'));

    if (response.statusCode == 200) {
      final List<dynamic> holidays = json.decode(response.body);
      return holidays.map<String>((dynamic holiday) => holiday.toString()).toList();
    } else {
      throw Exception('Falha ao carregar os feriados da API');
    }
  }
}
