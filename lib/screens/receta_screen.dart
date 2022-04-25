import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/contenido_list_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:faker/faker.dart';

import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:share_plus/share_plus.dart';

class RecetaScreen extends StatelessWidget {
  RecetaScreen({Key? key, required this.contenido}) : super(key: key);

  final _angleRotateBoat = (pi * -.5);
  final _dxTranslate = 80.0;
  final _dyTranslate = -100.0;
  final Contenido contenido;
  final _index = ValueNotifier<int>(1);

  //-------------------------------------------------
  // Custom Flight Hero
  //-------------------------------------------------
  Widget _flightShuttleBuilder(
      Animation animation, HeroFlightDirection flightDirection) {
    final isPop = flightDirection == HeroFlightDirection.pop;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final value = isPop
            ? Curves.easeInBack.transform(animation.value)
            : Curves.easeOutBack.transform(animation.value);
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(_dxTranslate * value, _dyTranslate * value, 0)
            ..rotateZ(_angleRotateBoat * value),
          child: child,
        );
      },
      child: ContenidoListWidget(
        contenido: contenido,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animateItemNotifier = ValueNotifier(false);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      animateItemNotifier.value = true;
    });
    Faker faker = Faker();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: UIKit.texturaPrincipal,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: contenido.id.toString(),
              flightShuttleBuilder: (_, animation, flightDirection, ___, ____) {
                return _flightShuttleBuilder(animation, flightDirection);
              },
              child: Column(
                children: [
                  Text(contenido.titulo, style: AppTheme.tituloContenido),
                  InkWell(
                    child: Image.asset(
                        'assets/imagenes/iconos/icono_FAVORITO_OFF.png'),
                  )
                ],
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _index,
                builder: (_, value, child) {
                  return Column(
                    children: [
                      FlutterToggleTab(
                        selectedTextStyle: AppTheme.tabSeleccionadoReceta,
                        unSelectedTextStyle: AppTheme.tabDesSeleccionadoReceta,
                        selectedBackgroundColors: [AppColors.verdeBase],
                        unSelectedBackgroundColors: [
                          AppColors.verdeClaroOscuro.withOpacity(0.9)
                        ],
                        width: 200,
                        borderRadius: 15,
                        selectedIndex: _index.value,
                        labels: ['Ingredientes', 'Procedimientos'],
                        selectedLabelIndex: (index) {
                          _index.value = index + 1;
                        },
                      ),
                      _index.value == 0
                          ? ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      faker.lorem.word(),
                                      style: AppTheme.estiloContenido,
                                    ),
                                    Text(faker.lorem.word(),
                                        style: AppTheme.estiloContenido),
                                    Text(faker.lorem.word(),
                                        style: AppTheme.estiloContenido),
                                  ],
                                );
                              })
                          : ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      faker.lorem.word(),
                                      style: AppTheme.estiloContenido,
                                    ),
                                    Text(faker.lorem.word(),
                                        style: AppTheme.estiloContenido),
                                    Text(faker.lorem.word(),
                                        style: AppTheme.estiloContenido),
                                  ],
                                );
                              })
                    ],
                  );
                }),
            Text('8 Raciones', style: AppTheme.estiloContenido),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Nota: ',
                    style: AppTheme.estiloContenido
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(faker.lorem.sentence(),
                    style: AppTheme.estiloContenido.copyWith(
                        color: AppColors.verdeOscuro.withOpacity(0.7)))
              ],
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(contenido.texto, subject: contenido.titulo);
        },
        child: Image.asset('assets/imagenes/iconos/icono_COMPARTIR.png'),
        elevation: 5,
        enableFeedback: true,
      ),
    );
  }
}
