import 'package:cocina_ecologica/data/datasources/content_datasource.dart';
import 'package:cocina_ecologica/model/contenido.dart';

import 'package:cocina_ecologica/model/tema.dart';
import 'package:cocina_ecologica/proxies/tab_tema.dart';
import 'package:flutter/material.dart';
import 'package:cocina_ecologica/proxies/elemento.dart';

const kContenidoAltura = 55.0;
const kTemaAltura = 50.5;

class HomeModel with ChangeNotifier {
  List<TabTema> tabs = [];
  final List<Tema> _temas = ContentDataSource.temas;
  List<Elemento> elementos = [];
  List<Tema> get temas => _temas;
  late ScrollController scrollController;
  bool _listen = true;
  late TabController tabController;

  HomeModel() {
    scrollController = ScrollController();
    init();
  }

  void init() {
    double offsetFrom = 0.0;
    double offsetTo = 0.0;
    List<Tema> temasMostrar =
        _temas.where((element) => element.visible == true).toList();
    for (int i = 0; i < temasMostrar.length; i++) {
      Tema tema = temasMostrar[i];

      if (i > 0) {
        offsetFrom += temasMostrar[i - 1]
                .contenidos
                .where((element) => element.visible == true)
                .toList()
                .length *
            kContenidoAltura;
      }

      if (i < temasMostrar.length - 1) {
        offsetTo = (offsetFrom +
                temasMostrar[i + 1]
                        .contenidos
                        .where((element) => element.visible == true)
                        .toList()
                        .length *
                    kContenidoAltura) +
            1000;
      } else {
        offsetTo = double.infinity;
      }

      tabs.add(TabTema(
          tema: tema,
          seleccionado: (i == 0),
          offsetFrom: (kTemaAltura * i) + offsetFrom,
          offsetTo: offsetTo));
      elementos.add(Elemento(tema: tema));
      List<Contenido> contenidoMostrar =
          tema.contenidos.where((element) => element.visible == true).toList();
      for (int j = 0; j < contenidoMostrar.length; j++) {
        elementos.add(Elemento(contenido: contenidoMostrar[j]));
      }
    }
    tabs[0] = tabs[0].copyWith(true);

    //scrollController.addListener(_onScrollListener);
  }

  void onTemaSelected(int index, {bool animar = true}) async {
    final selected = tabs[index];
    for (int i = 0; i < tabs.length; i++) {
      tabs[i] = tabs[i].copyWith(selected.tema.titulo == tabs[i].tema.titulo);
    }
    notifyListeners();
    if (animar) {
      _listen = false;
      await scrollController.animateTo(selected.offsetFrom,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
      _listen = true;
    }
  }

  void _onScrollListener() {
    if (_listen) {
      for (int i = 0; i < tabs.length; i++) {
        final tab = tabs[i];
        if (scrollController.offset >= tab.offsetFrom &&
            scrollController.offset <= tab.offsetTo &&
            !tab.seleccionado) {
          onTemaSelected(i, animar: false);
          if (tabController != null) {
            tabController.animateTo(i);
          }
          break;
        }
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(_onScrollListener);
    if (tabController != null) {
      tabController.dispose();
    }
    super.dispose();
  }
}
