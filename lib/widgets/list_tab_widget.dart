import 'package:cocina_ecologica/constants/colors.dart';
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
      opacity: tabTema.seleccionado ? 1 : 0.8,
      child: Card(
        color: tabTema.seleccionado
            ? AppColors.verdeClaroOscuro
            : AppColors.verdeBase,
        elevation: tabTema.seleccionado ? 6 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(children: [
            Image.asset('assets/imagenes/iconos/menutema.png'),
            Text(
              tabTema.tema.titulo.toUpperCase(),
              style: TextStyle(
                  color: tabTema.seleccionado
                      ? Colors.white
                      : AppColors.verdeOscuro,
                  fontSize: ResponsiveValue(
                        context,
                        defaultValue: 14.0,
                        valueWhen: [
                          const Condition.largerThan(
                            name: MOBILE,
                            value: 16.0,
                          )
                        ],
                      ).value ??
                      0.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.helveticaNeueLTStdCn),
            ),
          ]),
        ),
      ),
    );
  }
}
