import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/model/contenido.dart';
import 'package:cocina_ecologica/model/generador.dart';
import 'package:cocina_ecologica/model/tema.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/contenido_list_widget.dart';
import 'package:cocina_ecologica/widgets/line_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoritoScreen extends StatelessWidget {
  FavoritoScreen({Key? key}) : super(key: key);
  List<Tema> temas = Generador.data();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Contenido> contenidos = temas.first.contenidos.take(5).toList();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: UIKit.texturaPrincipal,
          width: size.width,
          height: size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(Strings.favoritos, style: AppTheme.estiloTitulo, textAlign: TextAlign.left,),
                  ),
                  CustomPaint(painter: LineaHorizontal(),)
                ],),
              ),
              SizedBox(
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
  }
}
