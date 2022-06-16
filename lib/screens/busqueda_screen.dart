import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/contenido_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/screens/receta_screen.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/contenido_list_widget.dart';
import 'package:cocina_ecologica/widgets/customAppBarBusqueda.dart';
import 'package:cocina_ecologica/widgets/line_horizontal_gruesa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BusquedaScreen extends StatelessWidget {
  BusquedaScreen({Key? key}) : super(key: key);
  ContenidoModel aux = ContenidoModel();
  final ValueNotifier<bool> _hideAppBarNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<ContenidoModel>(builder: (context, modelContenido, child) {
      List<Contenido> contenidos = [];
      List<Contenido> contenidosMostrar = modelContenido.contenidos
          .where((element) => element.visible == true)
          .toList();
      for (int i = 0; i < contenidosMostrar.length; i++) {
        Contenido item = contenidosMostrar[i];
        for (int j = 0; j < modelContenido.registroBusqueda.length; j++) {
          if (item.id == modelContenido.registroBusqueda[j].id) {
            contenidos.add(item);
          }
        }
      }

      aux = modelContenido;

      return Scaffold(
        bottomNavigationBar: Container(
          height: kBottomNavigationBarHeight,
          color: AppColors.verdeOscuro,
        ),
        appBar: const CustomAppBarBusqueda(),
        body: Container(
          margin: const EdgeInsets.only(top: 20.0),
          decoration: UIKit.texturaPrincipal,
          child: SafeArea(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20.0),
                        child: Text(
                          Strings.busqueda,
                          style: AppTheme.estiloTitulo,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomPaint(
                          painter: LineaHorizontalGruesa(
                              2,
                              const Offset(300.0, 0.0),
                              const Offset(-300.0, 0.0))),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: contenidos.isNotEmpty
                          ? ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              itemBuilder: (context, index) => InkWell(
                                child: ContenidoListWidget(
                                    contenido: contenidos[index]),
                                onTap: () => _abrirPaginaReceta(
                                    context, contenidos[index]),
                              ),
                              itemCount: contenidos.length,
                            )
                          : Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                Strings.noBusqueda,
                                style: TextStyle(
                                    fontSize: ResponsiveValue(
                                          context,
                                          defaultValue: 18.0,
                                          valueWhen: [
                                            const Condition.largerThan(
                                              name: MOBILE,
                                              value: 20.0,
                                            )
                                          ],
                                        ).value ??
                                        0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                    fontFamily:
                                        FontFamily.helveticaNeueLTStdCn),
                              ),
                            ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _abrirPaginaReceta(BuildContext context, Contenido contenido) async {
    _hideAppBarNotifier.value = true;
    await Navigator.push(
        context,
        PageRouteBuilder(
          reverseTransitionDuration: const Duration(milliseconds: 600),
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: RecetaScreen(contenido: contenido),
            );
          },
        ));
    _hideAppBarNotifier.value = false;
  }

  Future<bool> _onWillPopScope() {
    aux.limpiarBusqueda();
    return Future<bool>.value(true);
  }
}
