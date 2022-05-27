import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/contenido_model.dart';
import 'package:cocina_ecologica/consumer/home_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/screens/busqueda_screen.dart';
import 'package:cocina_ecologica/screens/receta_screen.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/contenido_list_widget.dart';
import 'package:cocina_ecologica/widgets/list_tab_widget.dart';
import 'package:cocina_ecologica/widgets/tema_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({Key? key, required this.cantidadTemasMenu})
      : super(key: key);
  final int cantidadTemasMenu;

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ValueNotifier<bool> _hideAppBarNotifier;
  final TextEditingController _userSearchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.cantidadTemasMenu, vsync: this);
    _hideAppBarNotifier = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer2<HomeModel, ContenidoModel>(
      builder: (context, model, modelContenido, child) {
        model.tabController = _tabController;
        return Scaffold(
          bottomNavigationBar: Container(
            height: kBottomNavigationBarHeight,
            color: AppColors.verdeOscuro,
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SizedBox(
              height: size.height,
              child: AnimatedBuilder(
                  animation: model,
                  builder: (_, __) => Container(
                        decoration: UIKit.texturaPrincipal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 160,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      Strings.welcome,
                                      style: TextStyle(
                                          fontSize: ResponsiveValue(
                                                context,
                                                defaultValue: 35.0,
                                                valueWhen: [
                                                  const Condition.largerThan(
                                                    name: MOBILE,
                                                    value: 45.0,
                                                  )
                                                ],
                                              ).value ??
                                              0.0,
                                          fontFamily: FontFamily.helvetica97,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.verdeClaroOscuro),
                                    ),
                                    AutoSizeText(Strings.welcomeText,
                                        style: TextStyle(
                                            fontSize: ResponsiveValue(
                                                  context,
                                                  defaultValue: 25.0,
                                                  valueWhen: [
                                                    const Condition.largerThan(
                                                      name: MOBILE,
                                                      value: 35.0,
                                                    )
                                                  ],
                                                ).value ??
                                                0.0,
                                            fontFamily:
                                                FontFamily.helveticaNeueLTStdCn,
                                            color: AppColors.verdeOscuro)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: AppColors.grisBase),
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      width: size.width * 0.87,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            child: Icon(
                                              Icons.search,
                                              size: ResponsiveValue(
                                                    context,
                                                    defaultValue: 30.0,
                                                    valueWhen: [
                                                      const Condition
                                                          .largerThan(
                                                        name: MOBILE,
                                                        value: 35.0,
                                                      )
                                                    ],
                                                  ).value ??
                                                  0.0,
                                            ),
                                            onTap: () {
                                              if (modelContenido
                                                      .busqueda.length >
                                                  2) {
                                                modelContenido
                                                    .llenarRegistroBusqueda();
                                                _userSearchController.clear();
                                                Navigator.of(context).push(
                                                    PageRouteBuilder(
                                                        pageBuilder: (context,
                                                            animation1,
                                                            animation2) {
                                                          return FadeTransition(
                                                            opacity: animation1,
                                                            child:
                                                                BusquedaScreen(),
                                                          );
                                                        },
                                                        transitionDuration:
                                                            const Duration(
                                                                seconds: 1)));
                                                modelContenido
                                                    .limpiarBusqueda();
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        backgroundColor:
                                                            AppColors
                                                                .verdeOscuro,
                                                        content: Text(
                                                            "Al menos tres caracteres.")));
                                              }
                                            },
                                          ),
                                          const VerticalDivider(
                                            thickness: 2,
                                            indent: 10.0,
                                            endIndent: 10.0,
                                          ),
                                          Expanded(
                                              child: TextField(
                                                  controller:
                                                      _userSearchController,
                                                  onChanged: (value) {
                                                    if (value.length > 2) {
                                                      modelContenido
                                                          .setTerminoBusqueda(
                                                              value);
                                                    }
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText: 'Buscar',
                                                          border: InputBorder
                                                              .none)))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: TabBar(
                                onTap: model.onTemaSelected,
                                tabs: model.tabs
                                    .map((e) => ListTabWidget(tabTema: e))
                                    .toList(),
                                controller: model.tabController,
                                isScrollable: true,
                                indicatorWeight: 0.1,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  controller: model.scrollController,
                                  itemCount: model.elementos.length,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  itemBuilder: (context, index) {
                                    if (model.elementos[index].isTema) {
                                      return TemaListWidget(
                                          tema: model.elementos[index].tema!);
                                    } else {
                                      return InkWell(
                                        child: ContenidoListWidget(
                                            contenido: model
                                                .elementos[index].contenido!),
                                        onTap: () => _abrirPaginaReceta(context,
                                            model.elementos[index].contenido!),
                                      );
                                    }
                                  }),
                            ),
                          ],
                        ),
                      )),
            ),
          ),
        );
      },
    );
  }

  void _abrirPaginaReceta(BuildContext context, Contenido contenido) async {
    _hideAppBarNotifier.value = true;
    await Navigator.push(
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
    _hideAppBarNotifier.value = false;
  }
}
