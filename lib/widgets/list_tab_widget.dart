import 'package:cocina_ecologica/proxies/tab_tema.dart';
import 'package:flutter/material.dart';

class ListTabWidget extends StatelessWidget {
  const ListTabWidget({Key? key, required this.tabTema}) : super(key: key);
  final TabTema tabTema;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: tabTema.seleccionado ? 1 : 0.5,
      child: Card(
        elevation: tabTema.seleccionado ? 6 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            tabTema.tema.titulo,
            style: const TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
