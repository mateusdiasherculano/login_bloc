import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/app/features/sign_up/presenter/sign_up_state.dart';

class SignUpController extends Cubit<SignUpState> {
  SignUpController() : super(SignUpInitial());

  Future<void> signUp(String email, String password) async {
    // Emitindo o estado de Loading para indicar que a autenticação está em andamento
    emit(SignUpLoadingState());

    try {
      // Simulando uma autenticação assíncrona
      await Future.delayed(Duration(seconds: 2));

      // Verificação simulada de credenciais
      if (email != '' && password != '') {
        // Emite o estado LoadedState para indicar que a autenticação foi bem-sucedida
        emit(SignUpSuccessState());
      } else {
        // Emite o estado ErrorState com uma mensagem de erro
        emit(const SignUpErrorState(
            'Credenciais inválidas. Por favor, verifique seu e-mail e senha.'));
      }
    } catch (e) {
      // Emite o estado ErrorState caso ocorra uma exceção durante a autenticação
      emit(SignUpErrorState('Ocorreu um erro durante a autenticação: $e'));
    }
  }
}
