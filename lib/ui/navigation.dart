import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/consumer/contenido_model.dart';
import 'package:cocina_ecologica/consumer/controlador_ui_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/ui/culture.dart';
import 'package:cocina_ecologica/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({Key? key}) : super(key: key);
  final _index = ValueNotifier<int>(1);

  List<Widget> _getMenuItems(List items, context) {
    return [
      Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/imagenes/iconos/icono_CERRAR.png',
              width: 32,
              height: 32,
            ),
          ),
        ),
      ),
      _getSingleWidget('Recetas', context),
      ...items.map((e) => _getSingleWidget(e.titulo, context))
    ];
  }

  Widget _getSingleWidget(String name, context) {
    return InkWell(
      child: Row(
        children: [
          Image.asset(
            'assets/imagenes/iconos/icono_INFO.png',
            width: 32,
            height: 32,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AutoSizeText(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.helveticaNeueLTStdCn,
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
                ),
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer2<ControladorUIModel, ContenidoModel>(
      builder: (context, model, modelContenido, child) {
        List<Contenido> listContenido = modelContenido.contenidos
            .where((element) => element.visible == false)
            .toList();
        return Scaffold(
          body: SideMenuAnimation(
            indexSelected: model.indexMenu,
            duration: const Duration(milliseconds: 1000),
            appBarBuilder: (showMenu) =>
                obtenerBounceTabBar(model.indexBounceTabBar, showMenu),
            views: [
              HomeScreen(),
              ...listContenido.map((e) => CultureScreen(
                    contenido: e,
                  ))
            ],
            items: _getMenuItems(listContenido, context),
            selectedColor: AppColors.verdeClaroOscuro,
            unselectedColor: AppColors.verdeOscuro,
            tapOutsideToDismiss: true,
            scrimColor: Colors.black45,
            onItemSelected: (value) {
              if (value > 0 && value != model.indexMenu) {
                model.setIndexMenu(value);
              }
            },
            menuWidth: size.width * 0.75,
          ),
        );
      },
    );
  }

  AppBar obtenerBounceTabBar(int index, showMenu) {
    switch (index) {
      case 0:
        return AppBar(
          toolbarHeight: 0,
        );
      case 1:
        return AppBar(
            backgroundColor: Colors.transparent,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      child: Image.asset(
                          'assets/imagenes/iconos/icono_MENU.png',
                          width: 32,
                          height: 32),
                      onTap: showMenu),
                ],
              ),
            ),
            elevation: 0);
      case 2:
        return AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
      default:
        return AppBar(
            backgroundColor: Colors.transparent,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      child: Image.asset('assets/imagenes/iconos/boton_MAS.png',
                          width: 32, height: 32)),
                  const SizedBox(width: 15),
                  InkWell(
                      child: Image.asset(
                          'assets/imagenes/iconos/boton_MENOS.png',
                          width: 32,
                          height: 32)),
                ],
              ),
            ),
            elevation: 0);
    }
  }
}
