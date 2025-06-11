import 'package:dio/dio.dart';
import 'package:sysventas/apis/categoria_api.dart';
import 'package:sysventas/local/condb/ConexionDB.dart';
import 'package:sysventas/modelo/CategoriaModelo.dart';
import 'package:sysventas/util/NetworConnection.dart';
import 'package:sysventas/util/TokenUtil.dart';

class CategoriaRepository with ConexionDBL{
  CategoriaApi? categoriaApi;

  CategoriaRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    categoriaApi = CategoriaApi(_dio);
  }

  Future<List<Categoria>> getEntidad() async {
    final db = await conetion();
    if (await isConected()) {
      return await categoriaApi!.getCategoria(TokenUtil.TOKEN).then((
          value) => value);
    }else{
      return db.categoriaDao.findAllEntidad();
    }
  }
}