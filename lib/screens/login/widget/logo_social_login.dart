import 'package:flutter/material.dart';

class LogoSocialLogin extends StatelessWidget {
  final VoidCallback onTap;
  final String backgroundImage;
  const LogoSocialLogin(
      {Key? key, required this.onTap, required this.backgroundImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFECE9EC),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(7),
          child: CircleAvatar(
            maxRadius: 18,
            backgroundImage: AssetImage(backgroundImage),
          ),
        ),
      ]),
    );
  }
}
