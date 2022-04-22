import 'package:cocina_ecologica/consumer/home_model.dart';
import 'package:cocina_ecologica/model/tema.dart';
import 'package:flutter/material.dart';

class TemaListWidget extends StatelessWidget {
  const TemaListWidget({Key? key, required this.tema}) : super(key: key);
  final Tema tema;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        tema.titulo,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      height: kTemaAltura,
      alignment: Alignment.centerLeft,
    );
  }
}
