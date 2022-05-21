import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/favorito_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/contenido_list_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

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
  bool esFavorito = false;
  String imageFavIcon = 'assets/imagenes/iconos/icono_FAVORITO_OFF.png';

  @override
  void initState() {
    super.initState();
    currentHtml = widget.contenido.texto;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Box box = Hive.box<int>(Strings.favoritos);
    List favs = box.values.toList();
    int contenidoId = widget.contenido.id;
    if (favs.contains(contenidoId)) {
      setState(() {
        esFavorito = true;
        imageFavIcon = esFavorito
            ? 'assets/imagenes/iconos/icono_FAVORITO_ON.png'
            : 'assets/imagenes/iconos/icono_FAVORITO_OFF.png';
      });
    }
  }

  _actualizarFavoritos(int contenido) {
    var favoritoBD = Provider.of<FavoritoModel>(context, listen: false);
    List favoritos = favoritoBD.favoritoList;
    if (favoritos.contains(contenido)) {
      int position = favoritos.indexOf(contenido);
      favoritoBD.deleteItem(position);
    } else {
      favoritoBD.addItem(contenido);
    }
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
                    child: Image.asset(imageFavIcon, height: 15, width: 15),
                    onTap: () {
                      setState(() {
                        esFavorito = !esFavorito;
                        imageFavIcon = esFavorito
                            ? 'assets/imagenes/iconos/icono_FAVORITO_ON.png'
                            : 'assets/imagenes/iconos/icono_FAVORITO_OFF.png';
                        _actualizarFavoritos(widget.contenido.id);
                      });
                    },
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
                  height: 500,
                  child: SingleChildScrollView(
                      physics: const PageScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Html(data: currentHtml)),
                )
              ],
            ),
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
