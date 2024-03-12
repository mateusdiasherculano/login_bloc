import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/features/home/home_module.dart';

import 'app/features/sign_in/sign_in_module.dart';
import 'app/features/sign_up/sign_up_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: SignInModule());
    r.module('/signup', module: SignUpModule());
    r.module('/home', module: HomeModule());
  }
}
