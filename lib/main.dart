import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:cocina_ecologica/consumer/contenido_model.dart';
import 'package:cocina_ecologica/consumer/home_model.dart';
import 'package:cocina_ecologica/ui/transition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'constants/strings.dart';
import 'consumer/controlador_ui_model.dart';
import 'consumer/favorito_model.dart';
import 'consumer/font_model.dart';
import 'data/datasources/content_datasource.dart';
import 'model/registro_busqueda.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RegistroBusquedaAdapter());
  await Hive.openBox<int>(Strings.favoritos);
  await Hive.openBox<RegistroBusqueda>(Strings.dbBusqueda);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  ContentDataSource contentDataSource = ContentDataSource();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoritoModel>(
            create: (context) => FavoritoModel()),
        ChangeNotifierProvider<FontModel>(create: (context) => FontModel()),
        ChangeNotifierProvider<HomeModel>(create: (context) => HomeModel()),
        ChangeNotifierProvider<ControladorUIModel>(
            create: (context) => ControladorUIModel()),
        ChangeNotifierProvider<ContenidoModel>(
            create: (context) => ContenidoModel()),
      ],
      child: Observer(builder: (context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, widget) => ResponsiveWrapper.builder(
                  ClampingScrollWrapper.builder(context, widget!),
                  breakpoints: const [
                    ResponsiveBreakpoint.resize(350, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    ResponsiveBreakpoint.resize(1024, name: DESKTOP),
                  ],
                ),
            title: Strings.appName,
            theme: ThemeData(
                primarySwatch: Colors.green,
                fontFamily: FontFamily.helveticaNeue97BlackCondensed),
            home: FutureBuilder(
              builder: (context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data != null) {
                  return const TransitionScreen();
                }
                return const SizedBox.shrink();
              },
              future: contentDataSource.loadData(),
            ));
      }),
    );
  }
}
