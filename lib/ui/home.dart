import 'package:cocina_ecologica/screens/credito_screen.dart';
import 'package:cocina_ecologica/screens/favorito_screen.dart';
import 'package:cocina_ecologica/screens/inicio_screen.dart';
import 'package:cocina_ecologica/widgets/bounce_tab_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    Size size = MediaQuery.of(context).size;
    return MediaQuery(
        data: query.copyWith(
          textScaleFactor: query.textScaleFactor.clamp(1.0, 1.4),
        ),
        child: Theme(
            data: ThemeData.light(),
            child: Scaffold(
              extendBody: true,
              resizeToAvoidBottomInset: true,
              body: IndexedStack(
                index: _currentIndex,
                children: [
                  FavoritoScreen(),
                  const InicioScreen(),
                  CreditoScreen()
                ],
              ),
              bottomNavigationBar: BounceTabBar(
                initialIndex: _currentIndex,
                onTabChanged: (index) {
                  setState(() {
                     _currentIndex = index;
                  });
                },
                items: [
                  InkWell(
                    child: _currentIndex == 0
                        ? Image.asset('assets/imagenes/iconos/ICONO_MENU_FAVORITOS_ON.png',
                            width: 40, height: 40)
                        : Image.asset('assets/imagenes/iconos/ICONO_MENU_FAVORITOS_OFF.png',
                            width: 40, height: 40),
                  ),
                  InkWell(
                    child: _currentIndex == 1
                        ? Image.asset('assets/imagenes/iconos/ICONO_MENU_PRINCIPAL_ON.png',
                            width: 40, height: 40)
                        : Image.asset('assets/imagenes/iconos/ICONO_MENU_PRINCIPAL_OFF.png',
                            width: 40, height: 40),
                  ),
                  InkWell(
                    child: _currentIndex == 2
                        ? Image.asset('assets/imagenes/iconos/ICONO_MENU_CREDITOS_ON.png',
                            width: 40, height: 40)
                        : Image.asset('assets/imagenes/iconos/ICONO_MENU_CREDITOS_OFF.png',
                            width: 40, height: 40),
                  )
                ],
              ),
            )));
  }
}
