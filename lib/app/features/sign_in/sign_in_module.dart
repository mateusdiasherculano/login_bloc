import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/features/sign_in/presenter/sign_in_controller.dart';
import 'package:login/app/features/sign_in/presenter/sign_in_page.dart';

class SignInModule extends Module {
  void binds(i) {
    i.addSingleton(SignInController.new);
  }

  void routes(r) {
    r.child('/sign', child: (context) => SignInPage());
  }
}
