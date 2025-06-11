import 'package:sysventas/modelo/MarcaModelo.dart';
import 'package:floor/floor.dart';
@dao
abstract class MarcaDao {
  @Query('SELECT * FROM marca')
  Future<List<Marca>> findAllEntidad();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllEntidad(List<Marca> todo);

  @Query('SELECT * FROM marca WHERE id_marca = :id')
  Stream<Marca?> findEntidadById(int id);
}