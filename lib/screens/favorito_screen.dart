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
  FavoritoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.watch<FavoritoModel>().getItem();

    return Consumer2<FavoritoModel, ContenidoModel>(
        builder: (context, model, modelContenido, child) {
      final bool hayFavorito = model.favoritoList.isNotEmpty;
      List<Contenido> contenidos =
          modelContenido.contenidos.where((Contenido element) {
        return model.favoritoList.contains(element.id) == true;
      }).toList();
      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: UIKit.texturaPrincipal,
            width: size.width,
            height: size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
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
                  itemBuilder: (context, index) => Slidable(
                      key: UniqueKey(),
                      child: ContenidoListWidget(contenido: contenidos[index]),
                      endActionPane: ActionPane(
                        dismissible: DismissiblePane(onDismissed: () {
                          contenidos.removeAt(index);
                        }),
                        motion: const ScrollMotion(),
                        children: [],
                      )),
                  itemCount: contenidos.length,
                ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
