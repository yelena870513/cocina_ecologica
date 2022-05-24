import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static TextStyle estiloTitulo = TextStyle(
      fontFamily: FontFamily.helveticaNeueLTStdCn,
      height: 1,
      fontSize: 50,
      color: AppColors.verdeClaroOscuro);

  static TextStyle estiloContenido = TextStyle(
      fontFamily: FontFamily.helveticaNeueLTStdCn,
      height: 2,
      fontSize: 18,
      color: AppColors.verdeOscuro);

  static TextStyle tituloContenido = TextStyle(
      fontFamily: FontFamily.helveticaNeueLTStdCn,
      height: 1.5,
      fontSize: 25,
      fontStyle: FontStyle.normal,
      color: AppColors.verdeOscuro);

  static TextStyle tabSeleccionadoReceta = TextStyle(
      fontFamily: FontFamily.helveticaNeueLTStdCn,
      height: 1.5,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.blancoSimple);

  static TextStyle tabDesSeleccionadoReceta = TextStyle(
      fontFamily: FontFamily.helveticaNeueLTStdCn,
      height: 1.5,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.verdeOscuro);
}
