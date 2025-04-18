import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/configs/assets/app_vectors.dart';
import 'package:pokedex/core/configs/theme/app_colors.dart';

class ButtonAnotherSesionGoogle extends StatelessWidget {
  final String title;
  final double? height;
  const ButtonAnotherSesionGoogle({required this.title, this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implementar la lógica del botón aquí
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size.fromHeight(height ?? 60),
        //cambiar color de borde aquí
        side: const BorderSide(
          color: Appcolors.grey, 
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            AppVectors.googleLogo,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
