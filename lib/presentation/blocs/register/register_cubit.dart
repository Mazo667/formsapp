import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/infraestructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      username: Username.dirty(value: state.username.value),
      password: Password.dirty(value: state.password.value),
      email: Email.dirty(value: state.email.value),
      isValid: Formz.validate([
        state.username,
        state.password,
        state.email,
      ])
    )
    );

    print('Cubit Submit: $state');
  }

  void usernameChange(String value){
    final username = Username.dirty(value: value);

    emit(
        state.copyWith(
            username: username,
        isValid: Formz.validate([username])
        )
    );
  }

  void emailChange(String value){
    final email = Email.dirty(value: value);
    emit(
        state.copyWith(email: email)
    );
  }

  void passwordChange(String value){
    final password = Password.dirty(value: value);
    emit(
        state.copyWith(password: password,
        isValid: Formz.validate([password, state.username]))
    );
  }

}
