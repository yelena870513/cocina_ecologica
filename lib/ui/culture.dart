import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/consumer/controlador_ui_model.dart';
import 'package:cocina_ecologica/consumer/font_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
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
    return Consumer2<ControladorUIModel, FontModel>(
      builder: (context, model, modelFont, child) {
        return Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: InteractiveViewer(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              width: size.width,
              height: size.height,
              decoration: UIKit.texturaPrincipal,
              child: Column(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        contenido.titulo.toUpperCase(),
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
                            color: AppColors.verdeClaroOscuro.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveValue(
                          context,
                          defaultValue: size.height * 0.70,
                          valueWhen: [
                            Condition.largerThan(
                              name: MOBILE,
                              value: size.height * 0.80,
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
                                    defaultValue: ScreenUtil()
                                        .setSp(modelFont.fontSizeContenido),
                                    valueWhen: [
                                      Condition.largerThan(
                                        name: MOBILE,
                                        value: ScreenUtil().setSp(
                                            modelFont.fontSizeContenidoTable),
                                      )
                                    ],
                                  ).value ??
                                  0.0,
                            ),
                          ),
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
