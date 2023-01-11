import 'package:keycloakflutter/screens/login/service/auth_service2.dart';
import 'package:keycloakflutter/screens/login/widget/button_initial.dart';
import 'package:keycloakflutter/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';
import '../../widgets/custom_input_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
          child: ChangeNotifierProvider(
        create: (context) => LoginFormProvider(),
        child: const _LoginForm(),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: loginForm.formKey,
          child: Column(
            children: [
              const CustomInputField(
                labelText: 'Name',
                hintText: 'Name ',
                formProperty: 'first_name',
              ),
              const SizedBox(height: 30),
              const CustomInputField(
                labelText: 'Last Name',
                hintText: 'Last Name',
                formProperty: 'last_name',
                //formValues: formValues
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Email',
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                formProperty: 'email',
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no luce como un correo';
                  // if (value == null) return 'Este campo es requerido';
                  // return value.length < 3 ? 'Mínimo de 3 letras' : null;
                },
                // formValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Password',
                hintText: 'Password',
                obscureText: true,
                formProperty: 'password',
                //formValues: formValues,
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  if (value == null) return 'Este campo es requerido';
                  return value.length < 3 ? 'Mínimo de 3 letras' : null;
                },
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                  value: 'Admin',
                  items: const [
                    DropdownMenuItem(
                        value: 'Admin',
                        child: Text(
                          'Admin',
                          style: TextStyle(color: Colors.black),
                        )),
                    DropdownMenuItem(
                        value: 'Superuser',
                        child: Text(
                          'Superuser',
                          style: TextStyle(color: Colors.black),
                        )),
                    DropdownMenuItem(
                        value: 'Developer',
                        child: Text(
                          'Developer',
                          style: TextStyle(color: Colors.black),
                        )),
                    DropdownMenuItem(
                        value: 'Jr. Developer',
                        child: Text(
                          'Jr. Developer',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                  onChanged: (value) {
                    //print(value);
                    // formValues['role'] = value ?? 'Admin';
                  }),
              const SizedBox(
                height: 40,
              ),
              InitialCustomButton(
                color: AppTheme.primary,
                text: 'Create Account',
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());

                  final authService =
                      Provider.of<AuthService>(context, listen: false);

                  final String? errorMessage = await authService.createUser(
                      loginForm.email, loginForm.password);
                  if (!loginForm.isValidForm()) return;

                  if (errorMessage == null) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(
                      context,
                      '/question1',
                    );
                  } else {
                    //print(errorMessage);
                  }

                  //* imprimir valores del formulario
                  //print(loginForm.email);
                },
              )
            ],
          ),
        ));
  }
}
