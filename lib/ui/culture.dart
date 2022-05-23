import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/controlador_ui_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/bounce_tab_bar.dart';
import 'package:cocina_ecologica/widgets/campo_busqueda.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'navigation.dart';

class CultureScreen extends StatelessWidget {
  const CultureScreen({Key? key, required this.contenido}) : super(key: key);
  final Contenido contenido;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ControladorUIModel>(
      builder: (context, model, child) {
        return Scaffold(
          bottomNavigationBar: BounceTabBar(
            initialIndex: 1,
            onTabChanged: (index) {
              print(index);
            },
            items: [
              InkWell(
                child: Image.asset(
                    'assets/imagenes/iconos/ICONO_MENU_PRINCIPAL_OFF.png',
                    width: 40,
                    height: 40),
              ),
              InkWell(
                child: Image.asset('assets/imagenes/iconos/icono_MENU.png',
                    width: 40, height: 40),
              ),
              InkWell(
                child: Image.asset(
                    'assets/imagenes/iconos/ICONO_MENU_FAVORITOS_OFF.png',
                    width: 40,
                    height: 40),
              ),
              InkWell(
                child: Image.asset(
                    'assets/imagenes/iconos/ICONO_MENU_CREDITOS_OFF.png',
                    width: 40,
                    height: 40),
              )
            ],
          ),
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: InteractiveViewer(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              width: size.width,
              height: size.height,
              decoration: UIKit.texturaPrincipal,
              child: Column(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        contenido.titulo.toUpperCase(),
                        style: TextStyle(
                            height: 1,
                            fontSize: ResponsiveValue(
                                  context,
                                  defaultValue: 35.0,
                                  valueWhen: [
                                    Condition.largerThan(
                                      name: MOBILE,
                                      value: 45.0,
                                    )
                                  ],
                                ).value ??
                                0.0,
                            fontFamily:
                                FontFamily.helveticaNeue97BlackCondensed,
                            color: AppColors.verdeClaroOscuro.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveValue(
                          context,
                          defaultValue: size.height * 0.75,
                          valueWhen: [
                            Condition.largerThan(
                              name: MOBILE,
                              value: size.height * 0.75,
                            )
                          ],
                        ).value ??
                        0.0,
                    child: SingleChildScrollView(
                      physics: const PageScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Html(
                        data: contenido.texto,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
