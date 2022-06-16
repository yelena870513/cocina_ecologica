import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/contenido_model.dart';
import 'package:cocina_ecologica/consumer/controlador_ui_model.dart';
import 'package:cocina_ecologica/consumer/font_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/proxies/side_menu_element.dart';
import 'package:cocina_ecologica/ui/culture.dart';
import 'package:cocina_ecologica/ui/home.dart';
import 'package:cocina_ecologica/widgets/line_horizontal_gruesa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  List<Widget> _getMenuItems(List items, context) {
    return [
      Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/imagenes/iconos/icono_CERRAR.png',
              width: ResponsiveValue(
                    context,
                    defaultValue: 38.0,
                    valueWhen: [
                      const Condition.largerThan(
                        name: MOBILE,
                        value: 60.0,
                      )
                    ],
                  ).value ??
                  0.0,
              height: ResponsiveValue(
                    context,
                    defaultValue: 38.0,
                    valueWhen: [
                      const Condition.largerThan(
                        name: MOBILE,
                        value: 60.0,
                      )
                    ],
                  ).value ??
                  0.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      _getSingleWidget(SideMenuElement(img: '', titulo: 'Inicio'), context),
      ...items.map((e) => _getSingleWidget(
          SideMenuElement(img: e.icono, titulo: e.titulo), context))
    ];
  }

  Widget _getSingleWidget(SideMenuElement sideMenuElement, context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            sideMenuElement.img != ""
                ? Image.asset(
                    'assets/imagenes/iconos/' + sideMenuElement.img,
                    width: ResponsiveValue(
                          context,
                          defaultValue: 38.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 50.0,
                            )
                          ],
                        ).value ??
                        0.0,
                    height: ResponsiveValue(
                          context,
                          defaultValue: 38.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 50.0,
                            )
                          ],
                        ).value ??
                        0.0,
                  )
                : Image.asset(
                    'assets/imagenes/iconos/icono_INFO.png',
                    width: ResponsiveValue(
                          context,
                          defaultValue: 38.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 50.0,
                            )
                          ],
                        ).value ??
                        0.0,
                    height: ResponsiveValue(
                          context,
                          defaultValue: 38.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 50.0,
                            )
                          ],
                        ).value ??
                        0.0,
                  ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: AutoSizeText(
                  sideMenuElement.titulo,
                  minFontSize: 18,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontFamily.helveticaNeueLTStdCn,
                    fontSize: ResponsiveValue(
                          context,
                          defaultValue: 18.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 20.5,
                            )
                          ],
                        ).value ??
                        0.0,
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer3<ControladorUIModel, ContenidoModel, FontModel>(
      builder: (context, model, modelContenido, modelFont, child) {
        List<Contenido> listContenido = modelContenido.contenidos
            .where((element) => element.visible == false)
            .toList();
        return SideMenuAnimation.builder(
            key: key,
            builder: (showMenu) {
              return Scaffold(
                appBar: obtenerAppBar(model.indexBounceTabBar, model.indexMenu,
                    showMenu, modelFont, context),
                body: IndexedStack(
                  children: [
                    const HomeScreen(),
                    ...listContenido.map((e) => CultureScreen(
                          contenido: e,
                        ))
                  ],
                  index: model.indexMenu - 1,
                ),
              );
            },
            selectedColor: AppColors.verdeClaroOscuro,
            unselectedColor: AppColors.verdeOscuro,
            tapOutsideToDismiss: true,
            scrimColor: Colors.black45,
            menuWidth: size.width * 0.75,
            items: _getMenuItems(listContenido, context),
            onItemSelected: (value) {
              if (value > 0 && value != model.indexMenu) {
                model.setIndexMenu(value);
              }
            });
      },
    );
  }

  AppBar obtenerAppBar(int indexBottomBar, int indexMenu, showMenu,
      FontModel modelFont, BuildContext context) {
    if (indexBottomBar == 0 || indexBottomBar == 2) {
      return AppBar(
        toolbarHeight: 0,
      );
    }
    if (indexBottomBar == 1 && indexMenu == 1) {
      return AppBar(
          toolbarHeight: kToolbarHeight *
              ResponsiveValue(
                context,
                defaultValue: 1,
                valueWhen: [
                  const Condition.largerThan(
                    name: MOBILE,
                    value: 1.8,
                  )
                ],
              ).value!.toDouble(),
          backgroundColor: Colors.transparent,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
                top: ResponsiveValue(
                      context,
                      defaultValue: 30.0,
                      valueWhen: [
                        const Condition.largerThan(
                          name: MOBILE,
                          value: 35.0,
                        )
                      ],
                    ).value ??
                    0.0,
                left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    child: Image.asset(
                      'assets/imagenes/iconos/icono_MENU.png',
                      width: ResponsiveValue(
                            context,
                            defaultValue: 47.0,
                            valueWhen: [
                              const Condition.largerThan(
                                name: MOBILE,
                                value: 60.0,
                              )
                            ],
                          ).value ??
                          0.0,
                      height: ResponsiveValue(
                            context,
                            defaultValue: 47.0,
                            valueWhen: [
                              const Condition.largerThan(
                                name: MOBILE,
                                value: 60.0,
                              )
                            ],
                          ).value ??
                          0.0,
                      fit: BoxFit.contain,
                    ),
                    onTap: showMenu),
                SizedBox(
                  width: ResponsiveValue(
                        context,
                        defaultValue: 0.0,
                        valueWhen: [
                          const Condition.largerThan(
                            name: MOBILE,
                            value: 5.0,
                          )
                        ],
                      ).value ??
                      0.0,
                ),
                InkWell(
                  child: Image.asset(
                    'assets/imagenes/iconos/icono_cocina.png',
                    width: ResponsiveValue(
                          context,
                          defaultValue: 47.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 60.0,
                            )
                          ],
                        ).value ??
                        0.0,
                    height: ResponsiveValue(
                          context,
                          defaultValue: 47.0,
                          valueWhen: [
                            const Condition.largerThan(
                              name: MOBILE,
                              value: 60.0,
                            )
                          ],
                        ).value ??
                        0.0,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: ResponsiveValue(
                        context,
                        defaultValue: 2.0,
                        valueWhen: [
                          const Condition.largerThan(
                            name: MOBILE,
                            value: 5.0,
                          )
                        ],
                      ).value ??
                      0.0,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(Strings.welcomeText,
                      style: TextStyle(
                          fontSize: ResponsiveValue(
                                context,
                                defaultValue: 19.0,
                                valueWhen: [
                                  const Condition.largerThan(
                                    name: MOBILE,
                                    value: 28.0,
                                  )
                                ],
                              ).value ??
                              0.0,
                          fontFamily: FontFamily.helveticaNeueLTStdCn,
                          color: AppColors.verdeOscuro)),
                ),
              ],
            ),
          ),
          elevation: 0);
    }
    if (indexBottomBar == 1 && indexMenu > 1) {
      return AppBar(
          toolbarHeight: kToolbarHeight *
              ResponsiveValue(
                context,
                defaultValue: 1,
                valueWhen: [
                  const Condition.largerThan(
                    name: MOBILE,
                    value: 1.8,
                  )
                ],
              ).value!.toDouble(),
          backgroundColor: Colors.transparent,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
                top: ResponsiveValue(
                      context,
                      defaultValue: 30.0,
                      valueWhen: [
                        const Condition.largerThan(
                          name: MOBILE,
                          value: 35.0,
                        )
                      ],
                    ).value ??
                    0.0,
                left: 30),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      child: Image.asset(
                        'assets/imagenes/iconos/icono_MENU.png',
                        width: ResponsiveValue(
                              context,
                              defaultValue: 47.0,
                              valueWhen: [
                                const Condition.largerThan(
                                  name: MOBILE,
                                  value: 65.0,
                                )
                              ],
                            ).value ??
                            0.0,
                        height: ResponsiveValue(
                              context,
                              defaultValue: 47.0,
                              valueWhen: [
                                const Condition.largerThan(
                                  name: MOBILE,
                                  value: 65.0,
                                )
                              ],
                            ).value ??
                            0.0,
                        fit: BoxFit.contain,
                      ),
                      onTap: showMenu),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ResponsiveValue(
                            context,
                            defaultValue: 0.0,
                            valueWhen: [
                              const Condition.largerThan(
                                name: MOBILE,
                                value: 7.0,
                              )
                            ],
                          ).value ??
                          0.0,
                    ),
                    child: InkWell(
                      child: Image.asset(
                        'assets/imagenes/iconos/boton_MAS.png',
                        width: ResponsiveValue(
                              context,
                              defaultValue: 38.0,
                              valueWhen: [
                                const Condition.largerThan(
                                  name: MOBILE,
                                  value: 53.0,
                                )
                              ],
                            ).value ??
                            0.0,
                        height: ResponsiveValue(
                              context,
                              defaultValue: 38.0,
                              valueWhen: [
                                const Condition.largerThan(
                                  name: MOBILE,
                                  value: 53.0,
                                )
                              ],
                            ).value ??
                            0.0,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        modelFont.incrementFontSizeContenido();
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ResponsiveValue(
                            context,
                            defaultValue: 0.0,
                            valueWhen: [
                              const Condition.largerThan(
                                name: MOBILE,
                                value: 7.0,
                              )
                            ],
                          ).value ??
                          0.0,
                    ),
                    child: InkWell(
                      child: Image.asset(
                        'assets/imagenes/iconos/boton_MENOS.png',
                        width: ResponsiveValue(
                              context,
                              defaultValue: 38.0,
                              valueWhen: [
                                const Condition.largerThan(
                                  name: MOBILE,
                                  value: 53.0,
                                )
                              ],
                            ).value ??
                            0.0,
                        height: ResponsiveValue(
                              context,
                              defaultValue: 38.0,
                              valueWhen: [
                                const Condition.largerThan(
                                  name: MOBILE,
                                  value: 53.0,
                                )
                              ],
                            ).value ??
                            0.0,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        modelFont.decrementFontSizeContenido();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                      height: ResponsiveValue(
                            context,
                            defaultValue: 5.0,
                            valueWhen: [
                              const Condition.largerThan(
                                name: MOBILE,
                                value: 20.0,
                              )
                            ],
                          ).value ??
                          0.0),
                  CustomPaint(
                      painter: LineaHorizontalGruesa(2,
                          const Offset(250.0, 0.0), const Offset(-250.0, 0.0))),
                ],
              )
            ]),
          ),
          elevation: 0);
    }
    return AppBar(
      toolbarHeight: 0,
    );
  }
}
