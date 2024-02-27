import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/features/home/presenter/home_page.dart';

class HomeModule extends Module {
  void binds(i) {}

  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
