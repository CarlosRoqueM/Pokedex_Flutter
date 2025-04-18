import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicAppTitle extends StatelessWidget {
  final String title;

  const BasicAppTitle({
    required this.title,
    super.key,
  }); // Cambiado a BasicAppTitle

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),
      ),
    );
  }
}
