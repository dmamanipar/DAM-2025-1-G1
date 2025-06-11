import 'package:dio/dio.dart';
import 'package:sysventas/apis/unidadmedida_api.dart';
import 'package:sysventas/local/condb/ConexionDB.dart';
import 'package:sysventas/modelo/UnidadMedidaModelo.dart';
import 'package:sysventas/util/NetworConnection.dart';
import 'package:sysventas/util/TokenUtil.dart';

class UnidadMedidaRepository with ConexionDBL {
  UnidadmedidaApi? unidadmedidaApi;

  UnidadMedidaRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    unidadmedidaApi = UnidadmedidaApi(_dio);
  }

  Future<List<UnidadMedida>> getEntidad() async {
    final db = await conetion();
    if (await isConected()) {
    return await unidadmedidaApi!.getUnidadMedida(TokenUtil.TOKEN).then((
        value) => value);
    }else{
      return db.unidadMedidaDao.findAllEntidad();
    }
  }
}