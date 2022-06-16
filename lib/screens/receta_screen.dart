import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/contenido_model.dart';
import 'package:cocina_ecologica/consumer/favorito_model.dart';
import 'package:cocina_ecologica/consumer/font_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/contenido_list_widget.dart';
import 'package:cocina_ecologica/widgets/customAppBarGeneral.dart';
import 'package:cocina_ecologica/widgets/ripple_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RecetaScreen extends StatefulWidget {
  const RecetaScreen({Key? key, required this.contenido}) : super(key: key);

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
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        designSize: size,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Consumer2<FontModel, ContenidoModel>(
        builder: (context, modelFont, modelContenido, child) {
      return Scaffold(
        bottomNavigationBar: Container(
          height: kBottomNavigationBarHeight,
          color: AppColors.verdeOscuro,
        ),
        extendBody: false,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBarGeneral(
          seccion: Strings.creditos,
          currentIndex: 1,
          fuente: true,
          contenido: widget.contenido,
        ),
        body: Container(
          decoration: UIKit.texturaPrincipal,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.only(
                top: ResponsiveValue(
                      context,
                      defaultValue: 20.0,
                      valueWhen: [
                        const Condition.largerThan(
                          name: MOBILE,
                          value: 0.0,
                        )
                      ],
                    ).value ??
                    0.0,
                left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.contenido.id.toString(),
                  flightShuttleBuilder:
                      (_, animation, flightDirection, ___, ____) {
                    return _flightShuttleBuilder(animation, flightDirection);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: ResponsiveValue(
                                  context,
                                  defaultValue: 0.0,
                                  valueWhen: [
                                    const Condition.largerThan(
                                      name: MOBILE,
                                      value: 20.0,
                                    )
                                  ],
                                ).value ??
                                0.0),
                        child: Text(widget.contenido.titulo,
                            style: TextStyle(
                                fontFamily: FontFamily.helveticaNeueLTStdCn,
                                height: 1.5,
                                fontSize: ResponsiveValue(
                                      context,
                                      defaultValue: 23.0,
                                      valueWhen: [
                                        const Condition.largerThan(
                                          name: MOBILE,
                                          value: 28.0,
                                        )
                                      ],
                                    ).value ??
                                    0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: AppColors.verdeOscuro)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ResponsiveValue(
                                  context,
                                  defaultValue: 0.0,
                                  valueWhen: [
                                    const Condition.largerThan(
                                      name: MOBILE,
                                      value: 20.0,
                                    )
                                  ],
                                ).value ??
                                0.0),
                        child: InkWell(
                          child: Image.asset(imageFavIcon,
                              height: ResponsiveValue(
                                    context,
                                    defaultValue: 30.0,
                                    valueWhen: [
                                      const Condition.largerThan(
                                        name: MOBILE,
                                        value: 45.0,
                                      )
                                    ],
                                  ).value ??
                                  0.0,
                              width: ResponsiveValue(
                                    context,
                                    defaultValue: 30.0,
                                    valueWhen: [
                                      const Condition.largerThan(
                                        name: MOBILE,
                                        value: 45.0,
                                      )
                                    ],
                                  ).value ??
                                  0.0),
                          onTap: () {
                            setState(() {
                              esFavorito = !esFavorito;
                              imageFavIcon = esFavorito
                                  ? 'assets/imagenes/iconos/icono_FAVORITO_ON.png'
                                  : 'assets/imagenes/iconos/icono_FAVORITO_OFF.png';
                              _actualizarFavoritos(widget.contenido.id);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveValue(
                        context,
                        defaultValue: 20.0,
                        valueWhen: [
                          const Condition.largerThan(
                            name: MOBILE,
                            value: 8.0,
                          )
                        ],
                      ).value ??
                      0.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: ResponsiveValue(
                            context,
                            defaultValue: 30.0,
                            valueWhen: [
                              const Condition.largerThan(
                                name: MOBILE,
                                value: 70.0,
                              )
                            ],
                          ).value ??
                          0.0),
                  child: Column(
                    children: [
                      FlutterToggleTab(
                        selectedTextStyle: TextStyle(
                            fontFamily: FontFamily.helveticaNeueLTStdCn,
                            height: 1,
                            fontSize: ResponsiveValue(
                                  context,
                                  defaultValue: 18.0,
                                  valueWhen: [
                                    const Condition.largerThan(
                                      name: MOBILE,
                                      value: 22.0,
                                    )
                                  ],
                                ).value ??
                                0.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blancoSimple),
                        unSelectedTextStyle: TextStyle(
                            fontFamily: FontFamily.helveticaNeueLTStdCn,
                            height: 1,
                            fontSize: ResponsiveValue(
                                  context,
                                  defaultValue: 18.0,
                                  valueWhen: [
                                    const Condition.largerThan(
                                      name: MOBILE,
                                      value: 22.0,
                                    )
                                  ],
                                ).value ??
                                0.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.verdeOscuro),
                        selectedBackgroundColors: [
                          AppColors.verdeClaroOscuro.withOpacity(0.9)
                        ],
                        unSelectedBackgroundColors: const [AppColors.verdeBase],
                        width: 85,
                        height: ResponsiveValue(
                              context,
                              defaultValue: 50.0,
                              valueWhen: [
                                const Condition.largerThan(
                                  name: MOBILE,
                                  value: 60.0,
                                )
                              ],
                            ).value ??
                            0.0,
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
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RippleButton(
                                  child: InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: modelContenido
                                                .isFirst(widget.contenido)
                                            ? AppColors.grisBase
                                            : AppColors.verdeClaroOscuro,
                                      ),
                                    ),
                                    onTap: () {
                                      if (!modelContenido
                                          .isFirst(widget.contenido)) {
                                        Contenido cont = modelContenido
                                            .getAnterior(widget.contenido);
                                        _abrirPaginaReceta(context, cont);
                                      }
                                    },
                                  ),
                                ),
                                RippleButton(
                                  child: InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: modelContenido
                                                .isLast(widget.contenido)
                                            ? AppColors.grisBase
                                            : AppColors.verdeClaroOscuro,
                                      ),
                                    ),
                                    onTap: () {
                                      if (!modelContenido
                                          .isLast(widget.contenido)) {
                                        Contenido cont = modelContenido
                                            .getPosterior(widget.contenido);
                                        _abrirPaginaReceta(context, cont);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ResponsiveValue(
                                    context,
                                    defaultValue: 300.0,
                                    valueWhen: [
                                      const Condition.largerThan(
                                        name: MOBILE,
                                        value: 910.0,
                                      )
                                    ],
                                  ).value ??
                                  0.0,
                              child: SingleChildScrollView(
                                  physics: const PageScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  child: Html(data: currentHtml, style: {
                                    // tables will have the below background color
                                    "p": Style(
                                      fontFamily:
                                          FontFamily.helveticaNeueLTStdCn,
                                      lineHeight: LineHeight.number(1),
                                      maxLines: 3,
                                      fontSize: FontSize(
                                        ResponsiveValue(
                                              context,
                                              defaultValue: ScreenUtil().setSp(
                                                  modelFont.fontSizeContenido),
                                              valueWhen: [
                                                Condition.largerThan(
                                                  name: MOBILE,
                                                  value: ScreenUtil().setSp(
                                                      modelFont
                                                          .fontSizeContenidoTable),
                                                )
                                              ],
                                            ).value ??
                                            0.0,
                                      ),
                                    ),
                                    "span": Style(
                                      fontFamily:
                                          FontFamily.helveticaNeueLTStdCn,
                                      lineHeight: LineHeight.number(1.5),
                                      fontSize: FontSize(
                                        ResponsiveValue(
                                              context,
                                              defaultValue: ScreenUtil().setSp(
                                                  modelFont.fontSizeContenido),
                                              valueWhen: [
                                                Condition.largerThan(
                                                  name: MOBILE,
                                                  value: ScreenUtil().setSp(
                                                      modelFont
                                                          .fontSizeContenidoTable),
                                                )
                                              ],
                                            ).value ??
                                            0.0,
                                      ),
                                    ),
                                    "td": Style(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      alignment: Alignment.center,
                                      textAlign: TextAlign.center,
                                      width: ResponsiveValue(
                                            context,
                                            defaultValue: 105.0,
                                            valueWhen: [
                                              const Condition.largerThan(
                                                name: MOBILE,
                                                value: 170.0,
                                              )
                                            ],
                                          ).value ??
                                          0.0,
                                      height: ResponsiveValue(
                                            context,
                                            defaultValue: 100.0,
                                            valueWhen: [
                                              const Condition.largerThan(
                                                name: MOBILE,
                                                value: 55.0,
                                              )
                                            ],
                                          ).value ??
                                          0.0,
                                    )
                                  }, customRender: {
                                    "table": (context, child) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        child:
                                            (context.tree as TableLayoutElement)
                                                .toWidget(context),
                                      );
                                    },
                                  })),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

void _abrirPaginaReceta(BuildContext context, Contenido contenido) async {
  await Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        reverseTransitionDuration: const Duration(milliseconds: 600),
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: RecetaScreen(contenido: contenido),
          );
        },
      ));
}
