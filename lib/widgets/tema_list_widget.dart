import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/consumer/home_model.dart';
import 'package:cocina_ecologica/model/tema.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TemaListWidget extends StatelessWidget {
  const TemaListWidget({Key? key, required this.tema}) : super(key: key);
  final Tema tema;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        tema.titulo,
        style: TextStyle(
            fontSize: ResponsiveValue(
                  context,
                  defaultValue: 20.0,
                  valueWhen: [
                    const Condition.largerThan(
                      name: MOBILE,
                      value: 22.0,
                    )
                  ],
                ).value ??
                0.0,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.helveticaNeueLTStdCn),
      ),
      height: kTemaAltura,
      alignment: Alignment.centerLeft,
    );
  }
}
