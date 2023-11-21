import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meuapp/controller/feriado_controller.dart';
import 'package:meuapp/model/feriado_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meuapp/view/drawer.dart';
import 'package:meuapp/view/form_new_course_page.dart';

class FeriadoPage extends StatefulWidget {
  FeriadoPage({super.key});

  @override
  State<FeriadoPage> createState() => _FeriadoPageState();
}

class _FeriadoPageState extends State<FeriadoPage> {
  late Future<List<FeriadoEntity>> feriadosFuture;
  FeriadoController controller = FeriadoController();

  Future<List<FeriadoEntity>> getFeriados() async {
    return await controller.getFeriadosList();
  }

  @override
  void initState() {
    super.initState();
    feriadosFuture = getFeriados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu app"),
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder(
        future: feriadosFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String formattedDate = DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(snapshot.data![index].date ?? ''));

                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(snapshot.data![index].name ?? ''),
                    subtitle:
                        Text(formattedDate),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
