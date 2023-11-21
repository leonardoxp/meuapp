

import 'package:meuapp/model/feriado_model.dart';
import 'package:meuapp/model/feriado_repository.dart';

class FeriadoController {
  FeriadosRepository repository = FeriadosRepository();


  Future<List<FeriadoEntity>> getFeriadosList() async {
    List<FeriadoEntity> feriadosList = [];
    feriadosList = await repository.getAll();
    return feriadosList;
  }


}
