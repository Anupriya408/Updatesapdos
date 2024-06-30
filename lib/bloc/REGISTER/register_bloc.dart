

import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';
import 'package:first_project/repositories/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationRepository authenticationRepository;

  RegisterBloc({required this.authenticationRepository}) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      await authenticationRepository.register(event.email, event.password);
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterFailure(error.toString()));
    }
  }
}
