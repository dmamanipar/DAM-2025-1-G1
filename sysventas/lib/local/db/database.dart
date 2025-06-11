import 'dart:async';
import 'package:sysventas/local/dao/CategoriaDao.dart';
import 'package:sysventas/local/dao/MarcaDao.dart';
import 'package:sysventas/local/dao/ProductoDao.dart';
import 'package:sysventas/local/dao/UnidadMedidaDao.dart';
import 'package:sysventas/modelo/ProductoModelo.dart';
import 'package:sysventas/modelo/MarcaModelo.dart';
import 'package:sysventas/modelo/CategoriaModelo.dart';
import 'package:sysventas/modelo/UnidadMedidaModelo.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart'; // the generated code will be there
//https://github.com/pinchbv/floor
//flutter packages pub run build_runner build
//flutter packages pub run build_runner watch
@Database(version: 3, entities: [ProductoDto, Marca, Categoria, UnidadMedida])
abstract class AppDatabase extends FloorDatabase {
  ProductoDao get productoDao;
  MarcaDao get marcaDao;
  CategoriaDao get categoriaDao;
  UnidadMedidaDao get unidadMedidaDao;
}