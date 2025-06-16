import 'package:sysventas/modelo/CategoriaModelo.dart';
import 'package:floor/floor.dart';

@dao
abstract class CategoriaDao {
  @Query('SELECT * FROM categoria')
  Future<List<Categoria>> findAllEntidad();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllEntidad(List<Categoria> todo);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEntidad(Categoria entidad);

  @Query('SELECT * FROM categoria WHERE id_categoria = :id')
  Stream<Categoria?> findEntidadById(int id);
}