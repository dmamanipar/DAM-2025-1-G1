import 'package:floor/floor.dart';

@Entity(tableName: 'categoria')
class Categoria {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'id_categoria')
  late final int idCategoria;
  late final String nombre;

  Categoria({
    required this.idCategoria,
    required this.nombre,
  });



  Categoria.crear():idCategoria=0, nombre="";

  factory Categoria.fromJson(Map<String, dynamic> json){
    return Categoria(
      idCategoria: json["idCategoria"],
      nombre: json["nombre"],
    );
  }

  Map<String, dynamic> toJson() => {
    "idCategoria": idCategoria,
    "nombre": nombre,
  };

}