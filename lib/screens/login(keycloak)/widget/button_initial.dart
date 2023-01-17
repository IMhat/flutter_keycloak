import 'package:flutter/material.dart';

class InitialCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const InitialCustomButton(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 350,
        height: 65,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Sans',
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}






//     return ElevatedButton(
//       onPressed: onTap,
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size(double.infinity, 50),
//         primary: const Color(0xff767BFF),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//             color: color == null
//                 ? Colors.white
//                 : const Color.fromARGB(255, 255, 255, 255),
//             fontFamily: 'RobotoMono',
//             fontSize: 20),
//       ),
//     );
//   }
// }
