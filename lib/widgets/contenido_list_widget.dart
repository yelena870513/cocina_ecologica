import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/consumer/home_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContenidoListWidget extends StatelessWidget {
  const ContenidoListWidget({Key? key, required this.contenido})
      : super(key: key);
  final Contenido contenido;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/imagenes/iconos/NOMBRE_RECETA.png'),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 200,
                child: AutoSizeText(
                  contenido.titulo,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: ResponsiveValue(
                            context,
                            defaultValue: 18.0,
                            valueWhen: [
                              Condition.largerThan(
                                name: MOBILE,
                                value: 20.0,
                              )
                            ],
                          ).value ??
                          0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      fontFamily: FontFamily.helveticaNeueLTStdCn),
                ),
              ),
            ],
          )),
      height: kContenidoAltura,
    );
  }
}
