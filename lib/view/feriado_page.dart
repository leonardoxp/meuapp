import 'package:flutter/material.dart';

import 'package:meuapp/service/api_feriado.dart';



class FeriadoPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<FeriadoPage> {
  final HolidayService holidayService = HolidayService('https://brasilapi.com.br/api/feriados/v1');
  List<FeriadoModel> holidays = [];

  @override
  void initState() {
    super.initState();
    _loadHolidays();
  }

  Future<void> _loadHolidays() async {
    try {
      final currentYear = DateTime.now().year;
      final fetchedHolidays = await holidayService.fetchHolidays(currentYear);
      setState(() {
        holidays = fetchedHolidays;
      });
    } catch (error) {
      // Trate erros conforme necessário
      print('Erro ao carregar feriados: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feriados do Ano Atual'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    if (holidays.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: holidays.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${holidays[index].name!} - ${holidays[index].date!}'), //aqui pode chamar a formatação de data
            // criando uma function em outro arquivo ou nesse.. passando a data como parametro tipo
            // getFormatDate(holidays[index].date)
          );
        },
      );
    }
  }
}
