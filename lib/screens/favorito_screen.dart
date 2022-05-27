import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/consumer/contenido_model.dart';
import 'package:cocina_ecologica/consumer/favorito_model.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/contenido_list_widget.dart';
import 'package:cocina_ecologica/widgets/line_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class FavoritoScreen extends StatelessWidget {
  const FavoritoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.watch<FavoritoModel>().getItem();

    return Consumer2<FavoritoModel, ContenidoModel>(
        builder: (context, model, modelContenido, child) {
      List<Contenido> contenidos =
          modelContenido.contenidos.where((Contenido element) {
        return model.favoritoList.contains(element.id) == true;
      }).toList();
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
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
                        padding: const EdgeInsets.only(top: 30, left: 30.0),
                        child: Text(
                          Strings.favoritos,
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
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemBuilder: (context, index) => Slidable(
                        key: Key(index.toString()),
                        child:
                            ContenidoListWidget(contenido: contenidos[index]),
                        endActionPane: ActionPane(
                          dismissible: DismissiblePane(onDismissed: () {
                            contenidos.removeAt(index);
                          }),
                          motion: ScrollMotion(),
                          children: [],
                        )),
                    itemCount: contenidos.length,
                  ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void doNothing(BuildContext context) {}
}
