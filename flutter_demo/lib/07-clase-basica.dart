void main() {
  final wolverine = new Heroe(nombre: 'Logan', poder: 'Regeneración');
  final wolverineC = Heroe(nombre: 'Logan', poder: 'Regeneración');
//wolverine.nombre = 'LoganX';
//wolverine.poder = 'RegeneraciónX';
  print(wolverine);
  print(wolverineC);
}

class Heroe {
  String nombre;
  String poder;

  //Heroe();
  Heroe({required this.nombre, required this.poder});

  String toString() {
    return 'Heroe: nombre: ${this.nombre}, poder: ${this.poder}';
  }
}
