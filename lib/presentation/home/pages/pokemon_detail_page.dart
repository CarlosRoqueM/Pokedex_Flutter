import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonDetailPage extends StatelessWidget {
  final Map pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokemonName =
        pokemon['name'][0].toUpperCase() + pokemon['name'].substring(1);
    List types = pokemon['types'];
    String pokemonTypes = types
        .map((type) =>
            type['type']['name'][0].toUpperCase() +
            type['type']['name'].substring(1))
        .join(', ');

    // Obtener habilidades
    List abilities = pokemon['abilities'];
    String pokemonAbilities = abilities
        .map((ability) =>
            ability['ability']['name'][0].toUpperCase() +
            ability['ability']['name'].substring(1))
        .join(', ');

    // Obtener estadísticas
    List stats = pokemon['stats'];

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  pokemon['sprites']['front_default'],
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "N° ${pokemon['id'].toString().padLeft(3, '0')}",
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                "$pokemonName",
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Type: \n$pokemonTypes",
                style:
                    GoogleFonts.poppins(fontSize: 16, color: Colors.blueGrey),
              ),
              const SizedBox(height: 16),
              Text(
                "Abilities: \n$pokemonAbilities",
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 16),
              Text(
                "Stats:",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: stats.map((stat) {
                  String statName = stat['stat']['name'][0].toUpperCase() +
                      stat['stat']['name'].substring(1);
                  int baseStat = stat['base_stat'];

                  // Normalizar el valor de la estadística (asumiendo un máximo de 255)
                  double progress = baseStat / 255;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statName,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey[300],
                          color: Colors.red,
                          minHeight: 10,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "$baseStat",
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
