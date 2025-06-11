import 'package:dio/dio.dart';
import 'package:sysventas/apis/marca_api.dart';
import 'package:sysventas/local/condb/ConexionDB.dart';
import 'package:sysventas/modelo/MarcaModelo.dart';
import 'package:sysventas/util/NetworConnection.dart';
import 'package:sysventas/util/TokenUtil.dart';

class MarcaRepository with ConexionDBL {
  MarcaApi? marcaApi;

  MarcaRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    marcaApi = MarcaApi(_dio);
  }

  Future<List<Marca>> getEntidad() async {
    final db = await conetion();
    if (await isConected()) {
    return await marcaApi!.getMarca(TokenUtil.TOKEN).then((
        value) => value);
    }else{
      return db.marcaDao.findAllEntidad();
    }
  }
}