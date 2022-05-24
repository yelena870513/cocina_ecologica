import 'package:cocina_ecologica/constants/app_theme.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/line_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class CreditoScreen extends StatelessWidget {
  CreditoScreen({Key? key}) : super(key: key);

  List<String> nombres = List.generate(7, (index) {
    Faker faker = Faker();
    return faker.person.name();
  });

  List<String> cargos = List.generate(7, (index) {
    Faker faker = Faker();
    return faker.job.title();
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                itemBuilder: (context, index) =>
                    _getCreditoWidget(nombres[index], cargos[index]),
                itemCount: nombres.length,
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCreditoWidget(String nombre, String cargo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cargo,
          style: AppTheme.estiloTitulo.copyWith(fontSize: 25),
        ),
        Text(
          nombre,
          style: AppTheme.estiloContenido,
        )
      ],
    );
  }
}
