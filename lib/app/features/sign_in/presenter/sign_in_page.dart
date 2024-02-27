import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/features/sign_in/presenter/sign_in_controller.dart';
import 'package:login/app/features/sign_in/presenter/sign_in_state.dart';
import 'package:login/components/common_widget.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignInController controller = Modular.get<SignInController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => controller,
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: BlocConsumer<SignInController, LoginState>(
          listener: (context, state) {
            if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is LoadedState) {
              // Redirecionar o usuário para a HomePage
              Modular.to.pushReplacementNamed('/home');
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return buildSignInForm(
                  context, controller, emailController, passwordController);
            }
          },
        ),
      ),
    );
  }

  Widget buildSignInForm(
      BuildContext context,
      SignInController controller,
      TextEditingController emailController,
      TextEditingController passwordController) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),

              ///Formulário
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// email
                    CustomTextField(
                      controller: emailController,
                      icon: Icons.email,
                      label: 'Email',
                    ),

                    ///senha
                    CustomTextField(
                      controller: passwordController,
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),

                    ///Botão de entrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          controller.sign(
                              emailController.text, passwordController.text);
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
