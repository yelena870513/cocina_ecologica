import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/consumer/contenido_model.dart';
import 'package:cocina_ecologica/consumer/controlador_ui_model.dart';
import 'package:cocina_ecologica/consumer/font_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CultureScreen extends StatelessWidget {
  const CultureScreen({Key? key, required this.contenido}) : super(key: key);
  final Contenido contenido;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        designSize: size,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Consumer3<ControladorUIModel, FontModel, ContenidoModel>(
      builder: (context, model, modelFont, modelContenido, child) {
        return Scaffold(
          bottomNavigationBar: Container(
            height: kBottomNavigationBarHeight,
            color: AppColors.verdeOscuro,
          ),
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: SizedBox(
            height: size.height,
            child: InteractiveViewer(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                width: size.width,
                decoration: UIKit.texturaPrincipal,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          margin: const EdgeInsets.only(top: 22.0),
                          child: AutoSizeText(
                            contenido.titulo.toUpperCase(),
                            maxLines: 3,
                            style: TextStyle(
                                height: 1,
                                fontSize: ResponsiveValue(
                                      context,
                                      defaultValue: 35.0,
                                      valueWhen: [
                                        const Condition.largerThan(
                                          name: MOBILE,
                                          value: 45.0,
                                        )
                                      ],
                                    ).value ??
                                    0.0,
                                fontFamily:
                                    FontFamily.helveticaNeue97BlackCondensed,
                                color: AppColors.verdeClaroOscuro
                                    .withOpacity(0.8)),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        RippleButton(
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.arrow_back,
                                color: modelContenido.isFirstCulture(contenido)
                                    ? AppColors.grisBase
                                    : AppColors.verdeClaroOscuro,
                              ),
                            ),
                            onTap: () {
                              if (!modelContenido.isFirstCulture(contenido)) {
                                List<Contenido> conts = modelContenido
                                    .contenidos
                                    .where(
                                        (element) => element.visible == false)
                                    .toList();
                                int positionContenido =
                                    conts.indexOf(contenido);
                                model.setIndexMenu(positionContenido + 1);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.79,
                          height: ResponsiveValue(
                                context,
                                defaultValue: size.height * 0.65,
                                valueWhen: [
                                  Condition.largerThan(
                                    name: MOBILE,
                                    value: size.height * 0.73,
                                  )
                                ],
                              ).value ??
                              0.0,
                          child: SingleChildScrollView(
                            physics: const PageScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            child: Html(
                              data: contenido.texto,
                              style: {
                                // tables will have the below background color
                                "p": Style(
                                  fontFamily: FontFamily.helveticaNeueLTStdCn,
                                  lineHeight: LineHeight.number(1.5),
                                  fontSize: FontSize(
                                    ResponsiveValue(
                                          context,
                                          defaultValue: ScreenUtil().setSp(
                                              modelFont.fontSizeContenido),
                                          valueWhen: [
                                            Condition.largerThan(
                                              name: MOBILE,
                                              value: ScreenUtil().setSp(
                                                  modelFont
                                                      .fontSizeContenidoTable),
                                            )
                                          ],
                                        ).value ??
                                        0.0,
                                  ),
                                ),
                              },
                            ),
                          ),
                        ),
                        RippleButton(
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.arrow_forward,
                                color: modelContenido.isLastCulture(contenido)
                                    ? AppColors.grisBase
                                    : AppColors.verdeClaroOscuro,
                              ),
                            ),
                            onTap: () {
                              if (!modelContenido.isLastCulture(contenido)) {
                                List<Contenido> conts = modelContenido
                                    .contenidos
                                    .where(
                                        (element) => element.visible == false)
                                    .toList();
                                int positionContenido =
                                    conts.indexOf(contenido);
                                model.setIndexMenu(positionContenido + 3);
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
