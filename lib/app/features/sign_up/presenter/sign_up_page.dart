import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/features/sign_up/presenter/sign_up_controller.dart';
import 'package:login/app/features/sign_up/presenter/sign_up_state.dart';
import 'package:login/components/common_widget.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Modular.get<SignUpController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => controller,
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: BlocConsumer<SignUpController, SignUpState>(
          listener: (context, state) {
            if (state is SignUpErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is SignUpSuccessState) {
              // Redirecionar o usuário para a tela de login
              Modular.to.pushReplacementNamed('/login');
            }
          },
          builder: (context, state) {
            if (state is SignUpLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return buildSignUpForm(
                  context, controller, emailController, passwordController);
            }
          },
        ),
      ),
    );
  }

  Widget buildSignUpForm(
      BuildContext context,
      SignUpController controller,
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

                    ///Botão de cadastrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          controller.signUp(
                              emailController.text, passwordController.text);
                          Modular.to.pushNamed('/sign');
                        },
                        child: const Text(
                          'Cadastrar',
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
