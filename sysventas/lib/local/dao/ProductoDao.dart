import 'package:sysventas/modelo/ProductoModelo.dart';
import 'package:floor/floor.dart';
@dao
abstract class ProductoDao {
  @Query('SELECT * FROM producto')
  Future<List<ProductoDto>> findAllEntidad();

  @Query('SELECT nombre FROM producto')
  Stream<List<String>> findAllEntidadName();

  @Query('SELECT * FROM producto WHERE id_producto = :id')
  Stream<ProductoDto?> findEntidadById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEntidad(ProductoDto entidad);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllEntidad(List<ProductoDto> todo);

  @update
  Future<void> updateEntidad(ProductoDto entidad);

  @Query("delete from producto where id_producto = :id")
  Future<void> deleteEntidad(int id);

  @delete
  Future<void> deleteAll(List<ProductoDto> list);

  @Query("SELECT MAX(id_producto) FROM producto")
  Future<int?> getMaxId();

}