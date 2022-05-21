import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/contenido_model.dart';
import 'package:cocina_ecologica/consumer/home_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/screens/receta_screen.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/contenido_list_widget.dart';
import 'package:cocina_ecologica/widgets/list_tab_widget.dart';
import 'package:cocina_ecologica/widgets/tema_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ValueNotifier<bool> _hideAppBarNotifier;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 14, vsync: this);
    _hideAppBarNotifier = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer2<HomeModel, ContenidoModel>(
      builder: (context, model, modelContenido, child) {
        model.tabController = _tabController;
        return Scaffold(
          body: SafeArea(
            child: AnimatedBuilder(
                animation: model,
                builder: (_, __) => Container(
                      width: size.width,
                      height: size.height,
                      decoration: UIKit.texturaPrincipal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 160,
                            child: Column(
                              children: [
                                AutoSizeText(
                                  Strings.welcome,
                                  style: TextStyle(
                                      fontSize: 55,
                                      fontFamily: FontFamily
                                          .helveticaNeue97BlackCondensed,
                                      color: AppColors.verdeClaroOscuro),
                                ),
                                AutoSizeText(Strings.welcomeText,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily:
                                            FontFamily.helveticaNeueLTStdCn,
                                        color: AppColors.verdeOscuro)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: AppColors.grisBase),
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  width: size.width * 0.90,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        child: Icon(
                                          Icons.search,
                                          size: 30,
                                        ),
                                      ),
                                      VerticalDivider(
                                        thickness: 2,
                                        indent: 10.0,
                                        endIndent: 10.0,
                                      ),
                                      Expanded(
                                          child: TextField(
                                              decoration: InputDecoration(
                                                  hintText: 'Buscar',
                                                  border: InputBorder.none)))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
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
