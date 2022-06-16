import 'package:cocina_ecologica/constants/colors.dart';
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
          padding: const EdgeInsets.all(2),
          child: Row(children: [
            tabTema.seleccionado
                ? Image.asset(
                    'assets/imagenes/botones/ON_' + tabTema.tema.imgs,
                    width: ResponsiveValue(
                          context,
                          defaultValue: 80.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 200.0,
                            )
                          ],
                        ).value ??
                        0.0,
                    height: ResponsiveValue(
                          context,
                          defaultValue: 80.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 200.0,
                            )
                          ],
                        ).value ??
                        0.0,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/imagenes/botones/OFF_' + tabTema.tema.imgs,
                    width: ResponsiveValue(
                          context,
                          defaultValue: 80.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 200.0,
                            )
                          ],
                        ).value ??
                        0.0,
                    height: ResponsiveValue(
                          context,
                          defaultValue: 80.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 200.0,
                            )
                          ],
                        ).value ??
                        0.0,
                    fit: BoxFit.cover,
                  )
          ]),
        ),
      ),
    );
  }
}
