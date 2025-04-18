import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/core/configs/theme/app_colors.dart';

class BasicAppSubTitle extends StatelessWidget {
  final String subTitle;

  const BasicAppSubTitle({
    required this.subTitle,
    super.key,
  }); // Cambiado a BasicAppTitle

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        subTitle,
        style: GoogleFonts.poppins(
            color: Appcolors.grey, fontSize: 15, fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      ),
    );
  }
}
