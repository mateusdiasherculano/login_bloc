import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/features/sign_up/presenter/sign_up_controller.dart';
import 'package:login/app/features/sign_up/presenter/sign_up_page.dart';

class SignUpModule extends Module {
  void binds(i) {
    i.addSingleton(SignUpController.new);
  }

  void routes(r) {
    r.child('/', child: (context) => SignUpPage());
  }
}
