import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/ui/culture.dart';
import 'package:cocina_ecologica/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({Key? key}) : super(key: key);
  final _index = ValueNotifier<int>(1);

  List<String> items = [
    "Introducción",
    "Sobre nuestra cultura culinaria",
    "Los brotes o frijoles germinados",
    "Informaciones y Consejos Útiles",
    "Tabla de equivalencia de las materias primas básicas",
    "Tabla de algunas plantas aromáticas",
    "Glosario de términos gastronómicos",
    "Galería  de platos",
  ];

  List<Widget> _getMenuItems() {
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
      ...items.map((e) => _getSingleWidget(e))
    ];
  }

  Widget _getSingleWidget(String name) {
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
                style: TextStyle(color: Colors.white),
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
    return Scaffold(
      body: SideMenuAnimation(
        duration: const Duration(milliseconds: 1000),
        appBarBuilder: (showMenu) => AppBar(

            backgroundColor: Colors.transparent,
            flexibleSpace: ValueListenableBuilder<int>(
              builder: (_, value, child) {
                return child!;
              },
              valueListenable: _index,
              child: Padding(
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
                    SizedBox(width: 15),
                    InkWell(
                        child: Image.asset(
                            'assets/imagenes/iconos/boton_MAS.png',
                            width: 32,
                            height: 32)),
                    SizedBox(width: 15),
                    InkWell(
                        child: Image.asset(
                            'assets/imagenes/iconos/boton_MENOS.png',
                            width: 32,
                            height: 32))
                  ],
                ),
              ),
            ),
            elevation: 0),
        views: [HomeScreen(), ...items.map((e) => const CultureScreen())],
        items: _getMenuItems(),
        selectedColor: AppColors.verdeClaroOscuro,
        unselectedColor: AppColors.verdeClaroOscuro.withOpacity(0.7),
        tapOutsideToDismiss: true,
        scrimColor: Colors.black45,
        onItemSelected: (value) {
          if (value > 0 && value != _index.value) _index.value = value;
        },
        menuWidth: size.width * 0.6,
      ),
    );
  }
}
