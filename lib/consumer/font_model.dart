import 'package:cocina_ecologica/constants/valores_defecto.dart';
import 'package:flutter/material.dart';

class FontModel with ChangeNotifier {
  double _fontSizeContenido = ValoresPorDefecto.fontSizeContenido;
  double _fontSizeContenidoTable = ValoresPorDefecto.fontSizeContenidoTable;
  double _fontSizeContenidoTableMax =
      ValoresPorDefecto.fontSizeContenidoTableMax;
  double _fontSizeContenidoExtra = ValoresPorDefecto.fontSizeContenidoExtra;
  double _fontSizeBuscadorResultado =
      ValoresPorDefecto.fontSizeBuscadorResultado;
  double _fontSizeCreditoCargo = ValoresPorDefecto.fontSizeCreditoCargo;
  double _fontSizeMainHeader = ValoresPorDefecto.fontSizeMainHeader;
  double _fontSizeTitulo = ValoresPorDefecto.fontSizeTitulo;

  double get fontSizeContenido => _fontSizeContenido;
  double get fontSizeContenidoTable => _fontSizeContenidoTable;
  double get fontSizeContenidoTableMax => _fontSizeContenidoTableMax;
  double get fontSizeContenidoExtra => _fontSizeContenidoExtra;
  double get fontSizeBuscadorResultado => _fontSizeBuscadorResultado;
  double get fontSizeCreditoCargo => _fontSizeCreditoCargo;
  double get fontSizeMainHeader => _fontSizeMainHeader;
  double get fontSizeTitulo => _fontSizeTitulo;

  void incrementFontSizeContenido() {
    if (_fontSizeContenido < ValoresPorDefecto.fontSizeContenidoMax) {
      _fontSizeContenido++;
      notifyListeners();
    }
    if (_fontSizeContenidoTable < ValoresPorDefecto.fontSizeContenidoTableMax) {
      _fontSizeContenidoTable++;
      notifyListeners();
    }
  }

  void incrementFontSizeContenidoExtra() {
    if (_fontSizeContenidoExtra < ValoresPorDefecto.fontSizeContenidoExtraMax) {
      _fontSizeContenidoExtra++;
      notifyListeners();
    }
  }

  void incrementFontSizeTitulo() {
    if (_fontSizeTitulo < ValoresPorDefecto.fontSizeTituloMax) {
      _fontSizeTitulo++;
      notifyListeners();
    }
  }

  void incrementFontSizeBuscadorResultado() {
    if (_fontSizeBuscadorResultado <
        ValoresPorDefecto.fontSizeBuscadorResultadoMax) {
      _fontSizeBuscadorResultado++;
      notifyListeners();
    }
  }

  void incrementFontSizeCreditoCargo() {
    if (_fontSizeCreditoCargo < ValoresPorDefecto.fontSizeCreditoCargoMax) {
      _fontSizeCreditoCargo++;
      notifyListeners();
    }
  }

  void incrementFontSizeMainHeader() {
    if (_fontSizeMainHeader < ValoresPorDefecto.fontSizeMainHeaderMax) {
      _fontSizeMainHeader++;
      notifyListeners();
    }
  }

  void decrementFontSizeContenido() {
    if (_fontSizeContenido > ValoresPorDefecto.fontSizeContenido) {
      _fontSizeContenido--;
      notifyListeners();
    }
    if (_fontSizeContenidoTable > ValoresPorDefecto.fontSizeContenidoTable) {
      _fontSizeContenido--;
      notifyListeners();
    }
  }

  void decrementFontSizeContenidoExtra() {
    if (_fontSizeContenidoExtra > ValoresPorDefecto.fontSizeContenidoExtra) {
      _fontSizeContenidoExtra--;
      notifyListeners();
    }
  }

  void decrementFontSizeTitulo() {
    if (_fontSizeTitulo > ValoresPorDefecto.fontSizeTitulo) {
      _fontSizeTitulo--;
      notifyListeners();
    }
  }

  void decrementFontSizeBuscadorResultado() {
    if (_fontSizeBuscadorResultado >
        ValoresPorDefecto.fontSizeBuscadorResultado) {
      _fontSizeBuscadorResultado--;
      notifyListeners();
    }
  }

  void decrementFontSizeCreditoCargo() {
    if (_fontSizeCreditoCargo > ValoresPorDefecto.fontSizeCreditoCargo) {
      _fontSizeCreditoCargo--;
      notifyListeners();
    }
  }

  void decrementFontSizeMainHeader() {
    if (_fontSizeMainHeader > ValoresPorDefecto.fontSizeMainHeader) {
      _fontSizeMainHeader--;
      notifyListeners();
    }
  }
}
