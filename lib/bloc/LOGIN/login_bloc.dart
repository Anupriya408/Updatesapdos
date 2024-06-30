
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_project/bloc/LOGIN/login_event.dart';
import 'package:first_project/bloc/LOGIN/login_state.dart';
import 'package:first_project/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository authenticationRepository;

  LoginBloc({required this.authenticationRepository}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await authenticationRepository.signIn(event.email, event.password);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
