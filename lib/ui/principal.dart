import 'package:flutter/material.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
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
