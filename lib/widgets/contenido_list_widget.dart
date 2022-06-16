import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/consumer/home_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContenidoListWidget extends StatelessWidget {
  const ContenidoListWidget(
      {Key? key,
      required this.contenido,
      this.mostarEliminar = false,
      this.onTap})
      : super(key: key);
  final Contenido contenido;
  final bool mostarEliminar;
  final VoidCallback? onTap;

  void tapDefecto() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
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
                width:
                    size.width * AppTheme.getResponsiveValue(context, 0.5, 0.8),
                child: AutoSizeText(
                  contenido.titulo,
                  maxLines: 2,
                  minFontSize: 18,
                  style: TextStyle(
                      fontSize: ResponsiveValue(
                            context,
                            defaultValue: 18.0,
                            valueWhen: [
                              const Condition.largerThan(
                                name: MOBILE,
                                value: 20.5,
                              )
                            ],
                          ).value ??
                          0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      fontFamily: FontFamily.helveticaNeueLTStdCn),
                ),
              ),
              mostarEliminar == true
                  ? InkWell(
                      child: Image.asset('assets/imagenes/iconos/delete.png',
                          width: AppTheme.getResponsiveValue(context, 22, 30),
                          height: AppTheme.getResponsiveValue(context, 22, 30)),
                      onTap: onTap,
                    )
                  : const SizedBox.shrink(),
            ],
          )),
      height: kContenidoAltura,
    );
  }
}
