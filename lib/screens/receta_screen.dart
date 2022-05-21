import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/contenido_list_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter_share/flutter_share.dart';

class RecetaScreen extends StatefulWidget {
  RecetaScreen({Key? key, required this.contenido}) : super(key: key);

  final Contenido contenido;

  @override
  State<RecetaScreen> createState() => _RecetaScreenState();
}

class _RecetaScreenState extends State<RecetaScreen> {
  final _angleRotateBoat = (pi * -.5);

  final _dxTranslate = 80.0;

  final _dyTranslate = -100.0;

  int _index = 0;
  String currentHtml = '';

  @override
  void initState() {
    super.initState();
    currentHtml = widget.contenido.texto;
  }

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
        contenido: widget.contenido,
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
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        decoration: UIKit.texturaPrincipal,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: widget.contenido.id.toString(),
              flightShuttleBuilder: (_, animation, flightDirection, ___, ____) {
                return _flightShuttleBuilder(animation, flightDirection);
              },
              child: Column(
                children: [
                  Text(widget.contenido.titulo,
                      style: AppTheme.tituloContenido),
                  InkWell(
                    child: Image.asset(
                        'assets/imagenes/iconos/icono_FAVORITO_OFF.png',
                        height: 15,
                        width: 15),
                  )
                ],
              ),
            ),
            Column(
              children: [
                FlutterToggleTab(
                  selectedTextStyle: AppTheme.tabSeleccionadoReceta,
                  unSelectedTextStyle: AppTheme.tabDesSeleccionadoReceta,
                  selectedBackgroundColors: const [AppColors.verdeBase],
                  unSelectedBackgroundColors: [
                    AppColors.verdeClaroOscuro.withOpacity(0.9)
                  ],
                  width: 90,
                  height: 50,
                  borderRadius: 15,
                  selectedIndex: _index,
                  labels: const [
                    Strings.tabIngredientes,
                    Strings.tabProcedimientos
                  ],
                  selectedLabelIndex: (index) {
                    setState(() {
                      _index = index;
                      currentHtml = index == 0
                          ? widget.contenido.texto
                          : widget.contenido.description;
                    });
                  },
                ),
                SizedBox(
                  height: 300,
                  child: Html(data: currentHtml),
                )
              ],
            ),
            Text('8 Raciones', style: AppTheme.estiloContenido),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Nota: ',
                      style: AppTheme.estiloContenido
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 120,
                    child: AutoSizeText(faker.lorem.sentence(),
                        maxLines: 2,
                        style: AppTheme.estiloContenido.copyWith(
                            color: AppColors.verdeOscuro.withOpacity(0.7))),
                  )
                ],
              ),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FlutterShare.share(
              title: widget.contenido.texto, text: widget.contenido.titulo);
        },
        child: Image.asset('assets/imagenes/iconos/icono_COMPARTIR.png'),
        elevation: 5,
        enableFeedback: true,
      ),
    );
  }
}
