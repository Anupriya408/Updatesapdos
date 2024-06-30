
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;

  const RegisterSubmitted(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
