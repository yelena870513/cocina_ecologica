import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/consumer/controlador_ui_model.dart';
import 'package:cocina_ecologica/data/datasources/content_datasource.dart';
import 'package:cocina_ecologica/screens/credito_screen.dart';
import 'package:cocina_ecologica/screens/favorito_screen.dart';
import 'package:cocina_ecologica/screens/inicio_screen.dart';
import 'package:cocina_ecologica/ui/principal.dart';
import 'package:cocina_ecologica/widgets/bounce_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Consumer<ControladorUIModel>(
      builder: (context, model, child) {
        return MediaQuery(
            data: query.copyWith(
              textScaleFactor: query.textScaleFactor.clamp(1.0, 1.4),
            ),
            child: Theme(
                data: ThemeData.light(),
                child: Scaffold(
                  extendBody: true,
                  resizeToAvoidBottomInset: true,
                  body: Container(
                    width: query.size.width,
                    child: IndexedStack(
                      index: model.indexBounceTabBar,
                      children: [
                        const PrincipalScreen(),
                        InicioScreen(
                            cantidadTemasMenu:
                                ContentDataSource.cantidadTemasMenu),
                        const FavoritoScreen(),
                        CreditoScreen()
                      ],
                    ),
                  ),
                  bottomNavigationBar: BounceTabBar(
                    key: UniqueKey(),
                    initialIndex: model.indexBounceTabBar,
                    onTabChanged: (index) {
                      model.setIndexBouceTabBar(index);
                    },
                    items: [
                      InkWell(
                        child: model.indexBounceTabBar == 0
                            ? Image.asset(
                                'assets/imagenes/iconos/ICONO_MENU_PRINCIPAL_ON.png',
                                width: 40,
                                height: 40)
                            : Image.asset(
                                'assets/imagenes/iconos/ICONO_MENU_PRINCIPAL_OFF.png',
                                width: 40,
                                height: 40),
                      ),
                      InkWell(
                        child: model.indexBounceTabBar == 1
                            ? Image.asset(
                                'assets/imagenes/iconos/ICONO_RECETAS_ON.png',
                                width: 40,
                                height: 40)
                            : Image.asset(
                                'assets/imagenes/iconos/ICONO_RECETAS_OFF.png',
                                width: 40,
                                height: 40),
                      ),
                      InkWell(
                        child: model.indexBounceTabBar == 2
                            ? Image.asset(
                                'assets/imagenes/iconos/ICONO_MENU_FAVORITOS_ON.png',
                                width: 40,
                                height: 40)
                            : Image.asset(
                                'assets/imagenes/iconos/ICONO_MENU_FAVORITOS_OFF.png',
                                width: 40,
                                height: 40),
                      ),
                      InkWell(
                        child: model.indexBounceTabBar == 3
                            ? Image.asset(
                                'assets/imagenes/iconos/ICONO_MENU_CREDITOS_ON.png',
                                width: 40,
                                height: 40)
                            : Image.asset(
                                'assets/imagenes/iconos/ICONO_MENU_CREDITOS_OFF.png',
                                width: 40,
                                height: 40),
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
