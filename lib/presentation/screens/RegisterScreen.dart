import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/infraestructure/inputs/inputs.dart';
import 'package:formsapp/presentation/blocs/register/register_cubit.dart';
import 'package:formsapp/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Usuario"),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
          child: const _RegisterView()
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 5),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    //el watch dispara la re rendirizacion de los widgets
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de Usuario',
              onChanged: registerCubit.usernameChange,
              errorMessage: username.errorMessage,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Correo Electronico',
              onChanged: registerCubit.emailChange,
              errorMessage: email.errorMessage,

            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: registerCubit.passwordChange,
              errorMessage: password.errorMessage,
            ),

            const SizedBox(height: 20),

            FilledButton.tonalIcon(
              onPressed: () {
                registerCubit.onSubmit();
            },
              icon: const Icon(Icons.save),
              label: const Text("Crear Usuario"),
            ),

            const SizedBox(height: 20)
          ],
        ));
  }
}
