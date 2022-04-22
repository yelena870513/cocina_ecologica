import 'package:cocina_ecologica/consumer/home_model.dart';
import 'package:cocina_ecologica/model/tema.dart';
import 'package:flutter/material.dart';

class TemaTabWidget extends StatelessWidget {
  const TemaTabWidget({Key? key, required this.tema}) : super(key: key);
  final Tema tema;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      color: Colors.white,
      child: Text(
        tema.titulo,
        style: const TextStyle(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
