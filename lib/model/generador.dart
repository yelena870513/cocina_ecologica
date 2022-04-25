import 'contenido.dart';
import 'tema.dart';
import 'package:faker/faker.dart';

class Generador {
  Generador._();
  static List<Tema> data() {
    Faker faker = Faker();
    List<Tema> temas = [];
    for (int index = 0; index < 10; index++) {
      List<Contenido> contenidos = [];
      for (int i = 0; i < 10; i++) {
        contenidos.add(Contenido(
            orden: i + 1,
            titulo: faker.food.dish(),
            texto: faker.lorem.sentence()));
      }
      temas.add(Tema(
          titulo: faker.food.restaurant(),
          subtitulo: faker.food.cuisine(),
          contenidos: contenidos));
    }
    return temas;
  }
}
