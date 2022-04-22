import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/home_model.dart';
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
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<HomeModel>(
      builder: (context, model, child) {
        model.tabController = _tabController;
        return Scaffold(
          body: SafeArea(
            child: AnimatedBuilder(
                animation: model,
                builder: (_, __) => Container(
                      width: size.width,
                      height: size.height,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/imagenes/texturas/textura_fondo.png'),
                              fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 100,
                            child: Column(
                              children: [
                                Text(Strings.welcome),
                                Text(Strings.welcomeText),
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
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                itemBuilder: (context, index) {
                                  if (model.elementos[index].isTema) {
                                    return TemaListWidget(
                                        tema: model.elementos[index].tema!);
                                  } else {
                                    return ContenidoListWidget(
                                        contenido: model
                                            .elementos[index].contenido!);
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
}
