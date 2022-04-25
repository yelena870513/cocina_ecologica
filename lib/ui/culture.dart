import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/constants/strings.dart';
import 'package:cocina_ecologica/uikit/uikit.dart';
import 'package:cocina_ecologica/widgets/campo_busqueda.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class CultureScreen extends StatelessWidget {
  const CultureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Faker faker = Faker();
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
              const CampoBusqueda(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    Strings.culturaCuba.toUpperCase(),
                    style: TextStyle(
                      height: 1,
                        fontSize: 40,
                        fontFamily: FontFamily.helveticaNeue97BlackCondensed,
                        color: AppColors.verdeClaroOscuro.withOpacity(0.8)),
                  ),
                ),
              ),
              SizedBox(
                height: 450,
                child: SingleChildScrollView(
                  physics: const PageScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Text(
                    faker.lorem.sentences(100).join(" . "),
                    style: TextStyle(
                      height: 1.5,
                        fontFamily: FontFamily.helveticaNeueLTStdCn, fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
