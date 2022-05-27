import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/font_model.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/line_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CreditoScreen extends StatelessWidget {
  CreditoScreen({Key? key}) : super(key: key);

  List<String> nombres = [
    "Yanet Cabargas Fernández",
    "Madelaine Vázquez Gálvez",
    "Jeniffer Lucia Muñiz Márquez",
    "Yelena Islen San Juan",
    "Maylen Gesen Gallinal",
    "Mercedes María Sosa Hernández\n        Ivett Muñoz Ramírez",
    "978-959-315-257-0"
  ];

  List<String> cargos = [
    "Dirección de proyecto",
    "Proveedor de contenidos",
    "Diseño",
    "Programación",
    "Control de calidad",
    "Gestión de la calidad y auditoría",
    "ISBN"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<FontModel>(builder: (context, modelFont, child) {
      return Scaffold(
        body: Container(
          decoration: UIKit.texturaPrincipal,
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30.0),
                    child: Text(
                      Strings.creditos,
                      style: AppTheme.estiloTitulo,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomPaint(
                    painter: LineaHorizontal(),
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => _getCreditoWidget(
                    context, nombres[index], cargos[index], modelFont),
                itemCount: nombres.length,
              ))
            ],
          ),
        ),
      );
    });
  }

  Widget _getCreditoWidget(context, String nombre, String cargo, modelFont) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cargo,
          style: AppTheme.estiloTitulo.copyWith(
            fontSize: ResponsiveValue(
                  context,
                  defaultValue: ScreenUtil().setSp(modelFont.fontSizeCargo),
                  valueWhen: [
                    Condition.largerThan(
                      name: MOBILE,
                      value: ScreenUtil().setSp(modelFont.fontSizeCargoTable),
                    )
                  ],
                ).value ??
                0.0,
          ),
        ),
        Text(
          nombre,
          style: AppTheme.estiloContenido,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
