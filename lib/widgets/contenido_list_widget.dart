import 'package:cocina_ecologica/consumer/home_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:flutter/material.dart';

class ContenidoListWidget extends StatelessWidget {
  const ContenidoListWidget({Key? key, required this.contenido})
      : super(key: key);
  final Contenido contenido;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset('assets/imagenes/iconos/ICONO_MENU_FAVORITOS_ON.png'),
          ),
          const SizedBox(height: 5,),
          Text(
          contenido.titulo,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
        ],)
      ),
      height: kContenidoAltura,
    );
  }
}
