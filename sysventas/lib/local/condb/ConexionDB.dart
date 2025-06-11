import 'package:sysventas/local/db/database.dart';
mixin ConexionDBL{
  Future<AppDatabase> conetion() async{
    return await $FloorAppDatabase.databaseBuilder('ventas.db').build();
  }
}
