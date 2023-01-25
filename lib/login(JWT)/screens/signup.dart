import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:keycloakflutter/login(JWT)/screens/initial_screen.dart';
import 'package:keycloakflutter/login(JWT)/services/auth_service.dart';

import '../../helper/common/widgets/custom_textField.dart';
import '../widgets/bezierContainer.dart';

enum Auth {
  signin,
  signup,
}

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Auth _auth = Auth.signup;

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          Text('OR',
              style: TextStyle(
                  color: Color.fromARGB(255, 151, 151, 151),
                  fontSize: 25,
                  fontWeight: FontWeight.w500)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
        onTap: () {
          // if (_signUpFormKey.currentState!.validate()) {
          //   signUpUser();
          // }
          signUpUser();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 78, 78, 78),
                    Color.fromARGB(255, 0, 0, 0)
                  ])),
          child: Text(
            'Sign up',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _title() {
  //   return RichText(
  //     textAlign: TextAlign.start,
  //     text: TextSpan(
  //         text: 'The',
  //         style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.w700,
  //             color: Color.fromARGB(255, 0, 0, 0)),
  //         children: [
  //           TextSpan(
  //             text: 'Co',
  //             style:
  //                 TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
  //           ),
  //           TextSpan(
  //             text: 'Creator',
  //             style:
  //                 TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
  //           ),
  //         ]),
  //   );
  // }
  Widget _title() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      child: Image.asset('assets/logo.png'),
    );
  }

  Widget _termsOfService() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'By signing up you agree to our ',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0)),
          children: [
            TextSpan(
              text: 'Terms of Service ',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            TextSpan(
              text: 'and ',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            TextSpan(
              text: ', and confirm that you are at least 18 years old.',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
            ),
          ]),
    );
  }

  // Widget _emailPasswordWidget() {
  //   return Column(
  //     children: <Widget>[
  //       _entryField("Username"),
  //       _entryField("Email id"),
  //       _entryField("Password", isPassword: true),
  //     ],
  //   );
  // }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  //   Widget _entryField(String title, {bool isPassword = false}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           title,
  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //             obscureText: isPassword,
  //             decoration: InputDecoration(
  //                 border: InputBorder.none,
  //                 fillColor: Color(0xfff3f3f4),
  //                 filled: true))
  //       ],
  //     ),
  //   );
  // }

  Widget _emailPasswordWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      // padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: _signInFormKey,
        children: <Widget>[
          Text(
            'Name',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color.fromARGB(255, 151, 151, 151)),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            controller: _nameController,
            hintText: 'Enter your complete name',
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Email',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color.fromARGB(255, 151, 151, 151)),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            controller: _emailController,
            hintText: 'Enter Email',
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Password',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color.fromARGB(255, 151, 151, 151)),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            controller: _passwordController,
            hintText: 'Enter Password',
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _SocialButton() {
    return Container(
        width: 250,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Color(0xff3b5998),
              child: const Icon(FontAwesomeIcons.facebook),
              onPressed: () {},
            ),
            // SizedBox(
            //   width: 10,
            // ),
            FloatingActionButton(
              backgroundColor: Color(0xff4288f4),
              child: const Icon(FontAwesomeIcons.google),
              onPressed: () {},
            ),
            // SizedBox(
            //   width: 10,
            // ),
            FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 0, 114, 180),
              child: const Icon(FontAwesomeIcons.linkedin),
              onPressed: () {},
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            // Positioned(
            //   top: -MediaQuery.of(context).size.height * .15,
            //   right: -MediaQuery.of(context).size.width * .4,
            //   child: BezierContainer(),
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .05),
                    _title(),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: Text('Create your account',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 151, 151, 151))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _emailPasswordWidget(),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    _termsOfService(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: 30),
                    _divider(),
                    // SizedBox(height: 5),
                    _SocialButton(),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            // Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
