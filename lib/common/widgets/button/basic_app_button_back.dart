import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicAppButtonBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          // Text(
          //   'Detalle sus Datos Personales',
          //   style: GoogleFonts.poppins(
          //       color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          // ),
        ],
      ),
    );
  }
}
