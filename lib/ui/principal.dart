import 'package:cocina_ecologica/screens/credito_screen.dart';
import 'package:cocina_ecologica/screens/favorito_screen.dart';
import 'package:cocina_ecologica/screens/inicio_screen.dart';
import 'package:cocina_ecologica/widgets/bounce_tab_bar.dart';
import 'package:flutter/material.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    Size size = MediaQuery.of(context).size;
    return MediaQuery(
        data: query.copyWith(
          textScaleFactor: query.textScaleFactor.clamp(1.0, 1.4),
        ),
        child: Theme(
            data: ThemeData.light(),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/imagenes/splash.jpg'),
                      fit: BoxFit.cover)),
            )));
  }
}
