import 'package:cocina_ecologica/constants/valores_defecto.dart';
import 'package:mobx/mobx.dart';

part "font_store.g.dart";

class FontStore = _FontStore with _$FontStore;

abstract class _FontStore with Store {
  @observable
  double _fontSizeContenido = ValoresPorDefecto.fontSizeContenido;
  @observable
  double _fontSizeTitulo = ValoresPorDefecto.fontSizeTitulo;
  @observable
  double _fontSizeBuscadorResultado =
      ValoresPorDefecto.fontSizeBuscadorResultado;
  @observable
  double _fontSizeCreditoCargo = ValoresPorDefecto.fontSizeCreditoCargo;
  @observable
  double _fontSizeMainHeader = ValoresPorDefecto.fontSizeMainHeader;

  @computed
  double get fontSizeContenido => _fontSizeContenido;

  @computed
  double get fontSizeTitulo => _fontSizeTitulo;

  @computed
  double get fontSizeBuscadorResultado => _fontSizeBuscadorResultado;

  @computed
  double get fontSizeCreditoCargo => _fontSizeCreditoCargo;

  @computed
  double get fontSizeMainHeader => _fontSizeMainHeader;

  @action
  void incrementFontSizeContenido() {
    if (_fontSizeContenido < ValoresPorDefecto.fontSizeContenidoMax) {
      _fontSizeContenido++;
    }
  }

  @action
  void incrementFontSizeTitulo() {
    if (_fontSizeTitulo < ValoresPorDefecto.fontSizeTituloMax) {
      _fontSizeTitulo++;
    }
  }

  @action
  void incrementFontSizeBuscadorResultado() {
    if (_fontSizeBuscadorResultado <
        ValoresPorDefecto.fontSizeBuscadorResultadoMax) {
      _fontSizeBuscadorResultado++;
    }
  }

  @action
  void incrementFontSizeCreditoCargo() {
    if (_fontSizeCreditoCargo < ValoresPorDefecto.fontSizeCreditoCargoMax) {
      _fontSizeCreditoCargo++;
    }
  }

  @action
  void incrementFontSizeMainHeader() {
    if (_fontSizeMainHeader < ValoresPorDefecto.fontSizeMainHeaderMax) {
      _fontSizeMainHeader++;
    }
  }

  @action
  void decrementFontSizeContenido() {
    if (_fontSizeContenido > ValoresPorDefecto.fontSizeContenido) {
      _fontSizeContenido--;
    }
  }

  @action
  void decrementFontSizeTitulo() {
    if (_fontSizeTitulo > ValoresPorDefecto.fontSizeTitulo) {
      _fontSizeTitulo--;
    }
  }

  @action
  void decrementFontSizeBuscadorResultado() {
    if (_fontSizeBuscadorResultado >
        ValoresPorDefecto.fontSizeBuscadorResultado) {
      _fontSizeBuscadorResultado--;
    }
  }

  @action
  void decrementFontSizeCreditoCargo() {
    if (_fontSizeCreditoCargo > ValoresPorDefecto.fontSizeCreditoCargo) {
      _fontSizeCreditoCargo--;
    }
  }

  @action
  void decrementFontSizeMainHeader() {
    if (_fontSizeMainHeader > ValoresPorDefecto.fontSizeMainHeader) {
      _fontSizeMainHeader--;
    }
  }
}
