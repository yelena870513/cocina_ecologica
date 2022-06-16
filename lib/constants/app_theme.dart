import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppTheme {
  AppTheme._();

  static TextStyle estiloTitulo = TextStyle(
      fontFamily: FontFamily.helveticaNeue97BlackCondensed,
      height: 1,
      fontSize: 50,
      color: AppColors.verdeClaroOscuro);

  static TextStyle estiloContenido = TextStyle(
      fontFamily: FontFamily.helveticaNeueLTStdCn,
      height: 2,
      fontSize: 20,
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

  static double getResponsiveValue(
      BuildContext context, double mobil, double tablet) {
    return ResponsiveValue(
          context,
          defaultValue: mobil,
          valueWhen: [
            Condition.largerThan(
              name: MOBILE,
              value: tablet,
            )
          ],
        ).value ??
        0.0;
  }
}
