import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/font_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:html/parser.dart';

import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomAppBarGeneral extends StatelessWidget
    implements PreferredSizeWidget {
  final String seccion;
  // ignore: prefer_final_fields
  final int currentIndex;
  final bool fuente;
  final Contenido contenido;

  const CustomAppBarGeneral(
      {Key? key,
      required this.seccion,
      required this.currentIndex,
      required this.fuente,
      required this.contenido})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Consumer<FontModel>(builder: (context, model, child) {
      return Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: Image.asset('assets/imagenes/iconos/boton_MAS.png',
                    width: 32, height: 32),
                onTap: () {
                  model.incrementFontSizeContenido();
                },
              ),
              const SizedBox(width: 15),
              InkWell(
                child: Image.asset('assets/imagenes/iconos/boton_MENOS.png',
                    width: 32, height: 32),
                onTap: () {
                  model.decrementFontSizeContenido();
                },
              ),
              SizedBox(
                width: ResponsiveValue(
                      context,
                      defaultValue: 150.0,
                      valueWhen: [
                        const Condition.largerThan(
                          name: MOBILE,
                          value: 220.0,
                        )
                      ],
                    ).value ??
                    0.0,
              ),
              InkWell(
                  child: Image.asset(
                      'assets/imagenes/iconos/icono_COMPARTIR.png',
                      width: 32,
                      height: 32),
                  onTap: () {
                    const String cabeceraIngredientes =
                        Strings.tabIngredientes + "\n============\n";
                    const String cabeceraProcedimiento =
                        Strings.tabProcedimientos + "\n=============\n";
                    final documentTitulo = "*" +
                        contenido.titulo +
                        "*\n==========================\n\n\n";

                    final documentIngredientes = parse(contenido.texto);
                    String parsedString2 =
                        parse(documentIngredientes.body!.text)
                            .documentElement!
                            .text;
                    final documentProcedimiento = parse(contenido.description);
                    String parsedString3 =
                        parse(documentProcedimiento.body!.text)
                            .documentElement!
                            .text;

                    parsedString2 = cabeceraIngredientes +
                        "\n" +
                        parsedString2.replaceAll("\n\n\n", " --");
                    parsedString3 = cabeceraProcedimiento +
                        "\n" +
                        parsedString3.replaceAll("\n\n\n", " --");
                    FlutterShare.share(
                        title: contenido.titulo,
                        text: documentTitulo +
                            "```" +
                            parsedString2 +
                            "\n" +
                            parsedString3 +
                            "```");
                  }),
              const SizedBox(width: 15),
              InkWell(
                  child: Image.asset('assets/imagenes/iconos/icono_CERRAR.png',
                      width: 32, height: 32),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
              const SizedBox(width: 15),
            ],
          ),
        ),
      );
    });
  }
}
