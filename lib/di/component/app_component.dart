// ignore: import_of_legacy_library_into_null_safe

import 'package:cocina_ecologica/data/repository.dart';
import 'package:inject/inject.dart';

import '../../main.dart';

/// The top level injector that stitches together multiple app features into
/// a complete app.
@Injector()
abstract class AppComponent {
  /// An accessor to RestClient object that an application may use.
  ///

  @provide
  MyApp get app;

  @provide
  Repository getRepository();
}
