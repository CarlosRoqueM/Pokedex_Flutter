import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/presentation/home/pages/pokemon_detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  // URL de la API de Pokémon
  final pokeApi = "https://pokeapi.co/api/v2/pokemon/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List pokedex = []; // Inicializar con una lista vacía

  // Método para obtener la lista de Pokémon
  // y asignar el valor a la variable pokedex
  @override
  void initState() {
    super.initState();
    if (mounted) {
      _getPokemon();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search Pokémon",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    _getPokemon(); // Recargar todos los Pokémon si el campo está vacío
                  } else {
                    pokedex = pokedex
                        .where((pokemon) => pokemon['name']
                            .toString()
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  }
                });
              },
            ),
          ),
          Expanded(
            child: pokedex.isEmpty // Verificar si la lista está vacía
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: pokedex.length,
                    itemBuilder: (context, index) {
                      // Obtener el nombre con la primera letra en mayúscula
                      String pokemonName =
                          pokedex[index]['name'][0].toUpperCase() +
                              pokedex[index]['name'].substring(1);

                      // Obtener los tipos del Pokémon
                      List types = pokedex[index]['types'];
                      String pokemonTypes = types
                          .map((type) =>
                              type['type']['name'][0].toUpperCase() +
                              type['type']['name'].substring(1))
                          .join(', ');

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "N° ${pokedex[index]['id'].toString().padLeft(3, '0')}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              pokemonName, // Nombre con la primera letra en mayúscula
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Type: $pokemonTypes", // Tipos del Pokémon
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        trailing: Image.network(
                          pokedex[index]['sprites']['front_default'],
                          fit: BoxFit.fill,
                          width: 80,
                          height: 80,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PokemonDetailPage(pokemon: pokedex[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Método para obtener la lista de Pokémon
  void _getPokemon() async {
    var url = Uri.https("pokeapi.co", "/api/v2/pokemon/");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print("Success");
        var decodedResponse = jsonDecode(response.body);
        List results = decodedResponse['results'];

        // Obtener detalles de cada Pokémon
        List detailedPokedex = [];
        for (var pokemon in results) {
          String pokemonId = pokemon['url'].split('/')[6];
          final pokemonResponse = await http
              .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$pokemonId"));
          if (pokemonResponse.statusCode == 200) {
            var pokemonDetails = jsonDecode(pokemonResponse.body);
            detailedPokedex.add(pokemonDetails);
          }
        }

        setState(() {
          pokedex = detailedPokedex;
        });
      } else {
        print("Error");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
