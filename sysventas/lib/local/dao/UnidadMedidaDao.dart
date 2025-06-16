import 'package:sysventas/modelo/UnidadMedidaModelo.dart';
import 'package:floor/floor.dart';
@dao
abstract class UnidadMedidaDao {
  @Query('SELECT * FROM unidadmedida')
  Future<List<UnidadMedida>> findAllEntidad();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllEntidad(List<UnidadMedida> todo);

  @Query('SELECT * FROM unidadmedida WHERE id_unidad = :id')
  Stream<UnidadMedida?> findEntidadById(int id);
}