import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/proxies/tab_tema.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
            style: TextStyle(
                color: Colors.black,
                fontSize: ResponsiveValue(
                      context,
                      defaultValue: 18.0,
                      valueWhen: [
                        Condition.largerThan(
                          name: MOBILE,
                          value: 20.0,
                        )
                      ],
                    ).value ??
                    0.0,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.helveticaNeueLTStdCn),
          ),
        ),
      ),
    );
  }
}
