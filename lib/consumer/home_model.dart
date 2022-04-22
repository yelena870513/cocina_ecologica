import 'package:cocina_ecologica/model/generador.dart';
import 'package:cocina_ecologica/model/tema.dart';
import 'package:cocina_ecologica/proxies/tab_tema.dart';
import 'package:flutter/material.dart';
import 'package:cocina_ecologica/proxies/elemento.dart';

const kContenidoAltura = 55.0;
const kTemaAltura = 27.5;

class HomeModel with ChangeNotifier {
  List<TabTema> tabs = [];
  final List<Tema> _temas = Generador.data();
  List<Elemento> elementos = [];
  List<Tema> get temas => _temas;
  ScrollController scrollController = ScrollController();
  bool _listen = true;
  late TabController tabController;

  HomeModel() {
    init();
  }

  void init() {
    double offsetFrom = 0.0;
    double offsetTo = 0.0;
    for (int i = 0; i < _temas.length; i++) {
      Tema tema = _temas[i];

      if (i > 0) {
        offsetFrom += _temas[i - 1].contenidos.length * kContenidoAltura;
      }

      if (i < _temas.length - 1) {
        offsetTo =
            offsetFrom + _temas[i + 1].contenidos.length * kContenidoAltura;
      } else {
        offsetTo = double.infinity;
      }

      tabs.add(TabTema(
          tema: tema,
          seleccionado: (i == 0),
          offsetFrom: kTemaAltura * i + offsetFrom,
          offsetTo: offsetTo));
      elementos.add(Elemento(tema: tema));
      for (int j = 0; j < tema.contenidos.length; j++) {
        elementos.add(Elemento(contenido: tema.contenidos[j]));
      }
    }

    scrollController.addListener(_onScrollListener);
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
          if(tabController != null) {
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
    super.dispose();
  }
}
