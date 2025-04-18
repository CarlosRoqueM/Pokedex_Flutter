import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/configs/assets/app_vectors.dart';
import 'package:pokedex/core/configs/theme/app_colors.dart';

class ButtonAnotherSesionIos extends StatelessWidget {
  final String title;
  final double? height;
  const ButtonAnotherSesionIos({required this.title, this.height, super.key});

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
          color: Appcolors.grey, // Cambia el color del borde aquí
          // Cambia el ancho del borde aquí
        ),
        // Cambia el color de fondo aquí // Cambia el radio aquí
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            AppVectors.iosLogo,
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
