import 'package:dio/dio.dart';
import 'package:sysventas/apis/categoria_api.dart';
import 'package:sysventas/apis/marca_api.dart';
import 'package:sysventas/apis/producto_api.dart';
import 'package:sysventas/apis/unidadmedida_api.dart';
import 'package:sysventas/local/condb/ConexionDB.dart';
import 'package:sysventas/local/db/database.dart';
import 'package:sysventas/mappers/ProductoMapper.dart';
import 'package:sysventas/modelo/CategoriaModelo.dart';
import 'package:sysventas/modelo/MessageModelo.dart';
import 'package:sysventas/modelo/ProductoModelo.dart';
import 'package:sysventas/util/NetworConnection.dart';
import 'package:sysventas/util/TokenUtil.dart';

class ProductoRepository with ConexionDBL{
  ProductoApi? productoApi;
  CategoriaApi? categoriaApi;
  MarcaApi? marcaApi;
  UnidadmedidaApi? unidadmedidaApi;

  ProductoRepository()   {
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    productoApi=ProductoApi(_dio);
    categoriaApi=CategoriaApi(_dio);
    marcaApi=MarcaApi(_dio);
    unidadmedidaApi=UnidadmedidaApi(_dio);
  }

  Future<List<ProductoResp>> getEntidad() async {
    final db = await conetion();
    final productoDao = db.productoDao;
    final marcaDao = db.marcaDao;
    final categoriaDao = db.categoriaDao;
    final unidadMedidaDao = db.unidadMedidaDao;

    if (await isConected()) {
      var datoC = await categoriaApi!.getCategoria(TokenUtil.TOKEN);
      for (Categoria da in datoC) {
        await categoriaDao!.insertEntidad(da);
      }
      var datoM = await marcaApi!.getMarca(TokenUtil.TOKEN);
      await marcaDao!.insertAllEntidad(datoM);
      var datoU = await unidadmedidaApi!.getUnidadMedida(TokenUtil.TOKEN);
      await unidadMedidaDao!.insertAllEntidad(datoU);

      var datoP = await productoApi!.getProducto(TokenUtil.TOKEN);
      for (ProductoResp da in datoP) {
        await productoDao.insertEntidad(ProductoMapper.toDto(da));
      }
      return datoP;
    } else {
      List<ProductoResp> lista = [];
      var dataP = await productoDao.findAllEntidad();
      for (ProductoDto x in dataP) {
        final categoria = await categoriaDao.findEntidadById(x.categoria).first;
        final marca = await marcaDao.findEntidadById(x.marca).first;
        final unidadMedida = await unidadMedidaDao.findEntidadById(x.unidadMedida).first;
        lista.add(ProductoMapper.toResp(
          x,
          categoria: categoria!,
          marca: marca!,
          unidadMedida: unidadMedida!,
        ));
      }
      return lista;
    }
  }

  Future<Message> deleteEntidad(int id) async{
    final db = await conetion();
    if(await isConected()){
      return await productoApi!.deleteProducto(TokenUtil.TOKEN, id);
    }else{
      await db.productoDao.deleteEntidad(id);
      Map<String, dynamic> result={};
      return Future.value(Message.fromJson(result));
    }
  }

  Future<ProductoDto> updateEntidad(int id, ProductoDto producto) async{
    final db = await conetion();
    if(await isConected()){
    return await productoApi!.updateProducto(TokenUtil.TOKEN, id, producto);
    }else{
      await db.productoDao.updateEntidad(producto);
      return producto;
    }
  }

  Future<Message> createEntidad(ProductoDto producto) async{
    final db = await conetion();
    if(await isConected()){
    return await productoApi!.crearProducto(TokenUtil.TOKEN, producto);
    }else {
      print(producto.nombre);
      int? maxId = await db.productoDao.getMaxId();
      int idx = (maxId ?? 0)+1;
      producto.idProducto=idx;
      //print("ID:${idx}");
      await db.productoDao.insertEntidad(producto);
      Map<String, dynamic> result={};
      return Future.value(Message.fromJson(result));
    }

  }

}