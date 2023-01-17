import 'package:keycloakflutter/screens/login(keycloak)/service/auth_service2.dart';
import 'package:keycloakflutter/screens/login(keycloak)/service/notifications_service.dart';
import 'package:keycloakflutter/screens/login(keycloak)/widget/button_initial.dart';
import 'package:keycloakflutter/screens/login(keycloak)/widget/logo_social_login.dart';
import 'package:keycloakflutter/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';
import '../../widgets/custom_input_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    final Size size = MediaQuery.of(context).size;
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: loginForm.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    width: 400,
                    height: 200,
                    padding: const EdgeInsets.only(top: 30),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/login.jpg'),
                            fit: BoxFit.contain)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    },
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
                  InitialCustomButton(
                    color: AppTheme.primary,
                    text: 'Sign in',
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());

                      final authService =
                          Provider.of<AuthService>(context, listen: false);

                      final String? errorMessage = await authService.login(
                          loginForm.email, loginForm.password);
                      if (!loginForm.isValidForm()) return;

                      if (errorMessage == null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(
                          context,
                          '/actual-home',
                        );
                      } else {
                        NotificationsService.showSnackbar(errorMessage);
                      }

                      //* imprimir valores del formulario
                      //print(loginForm.email);
                    },
                  ),
                  TextButton(
                      onPressed: (() {
                        Navigator.pushNamed(
                          context,
                          '/initialpage',
                        );
                      }),
                      child: const Text('You do not have an account? Sign up')),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LogoSocialLogin(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '',
                          );
                        },
                        backgroundImage: 'assets/google.jpg',
                      ),
                      LogoSocialLogin(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '',
                          );
                        },
                        backgroundImage: 'assets/facebook.png',
                      ),
                      LogoSocialLogin(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '',
                          );
                        },
                        backgroundImage: 'assets/linkedin.jpg',
                      ),
                    ],
                  ),
                ],
              ),
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: size.height * 0.40,
          child: CustomPaint(
            painter: _FondoPaint1(),
          ),
        ),
      ],
    );
  }
}

// import 'package:cocreator_app/screens/login/widget/button_initial.dart';
// import 'package:cocreator_app/theme/app_theme.dart';
// import 'package:flutter/material.dart';

// import '../../widgets/custom_input_field.dart';
// import 'widget/logo_social_login.dart';

// class LoginScreen extends StatelessWidget {
//   static const String routeName = '/login';
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

//     final Map<String, String> formValues = {
//       'email': '',
//       'password': '',
//     };
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         children: [
//           Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Form(
//                 key: myFormKey,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 50),
//                     Container(
//                       width: 400,
//                       height: 200,
//                       padding: const EdgeInsets.only(top: 30),
//                       decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('assets/login.jpg'),
//                               fit: BoxFit.contain)),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     CustomInputField(
//                         labelText: 'Correo',
//                         hintText: 'Correo del usuario',
//                         keyboardType: TextInputType.emailAddress,
//                         formProperty: 'email',
//                         formValues: formValues),
//                     const SizedBox(height: 30),
//                     CustomInputField(
//                         labelText: 'Contraseña',
//                         hintText: 'Contraseña del usuario',
//                         obscureText: true,
//                         formProperty: 'password',
//                         formValues: formValues),
//                     Container(
//                       margin: const EdgeInsets.only(left: 220),
//                       child: TextButton(
//                           onPressed: (() {}),
//                           child: const Text('Forgot password?')),
//                     ),
//                     const SizedBox(height: 10),
//                     InitialCustomButton(
//                       color: AppTheme.primary,
//                       text: 'Login',
//                       onTap: () {
//                         // FocusScope.of(context).requestFocus(FocusNode());

//                         // if (!myFormKey.currentState!.validate()) {
//                         //   // print('Formulario no válido');
//                         //   return;
//                         // }
//                         // //* imprimir valores del formulario
//                         // print(formValues);
//                         Navigator.pushNamed(
//                           context,
//                           '/question1',
//                         );
//                       },
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         LogoSocialLogin(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               '',
//                             );
//                           },
//                           backgroundImage: 'assets/google.jpg',
//                         ),
//                         LogoSocialLogin(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               '',
//                             );
//                           },
//                           backgroundImage: 'assets/facebook.png',
//                         ),
//                         LogoSocialLogin(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               '',
//                             );
//                           },
//                           backgroundImage: 'assets/linkedin.jpg',
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )),
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: size.height * 0.40,
//             child: CustomPaint(
//               painter: _FondoPaint1(),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

class _FondoPaint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    curva2(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void curva2(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const Color(0xff143E6C);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10.5;

    final path = Path();

    path.moveTo(0, size.height * 0.8);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.1,
        size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.1, size.height * 0.60, 0, size.height * 0.2);

    canvas.drawPath(path, paint); //esto es lo que permite que se dibuje todo
  }
}
