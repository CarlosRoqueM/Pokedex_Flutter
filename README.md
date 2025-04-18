# Pokedex App

Pokedex App es una aplicación desarrollada con Flutter que permite a los usuarios explorar información sobre diferentes Pokémon. La aplicación utiliza una arquitectura moderna basada en `flutter_bloc` y `hydrated_bloc` para la gestión del estado, y aprovecha diversas bibliotecas para mejorar la experiencia del usuario.

## UI

https://www.figma.com/design/i5UA8x8Sn1B31npx1pP6s4/Pokédex---Pokémon-App--Community-?node-id=1018-29177&t=TQeY2mjZiNtPPtLs-0

## API

https://pokeapi.co/api/v2/pokemon/

## Características

- **Exploración de Pokémon**: Consulta información detallada sobre diferentes Pokémon.
- **Interfaz moderna**: Diseñada con `google_fonts` y `flutter_svg` para una experiencia visual atractiva.
- **Imágenes en caché**: Utiliza `cached_network_image` para optimizar la carga de imágenes.
- **Compatibilidad multiplataforma**: Disponible para Android, iOS, Windows, macOS, Linux y web.

## Dependencias principales

- **flutter_bloc: Gestión de estado reactiva.**
- **hydrated_bloc: Persistencia de estado.**
- **cached_network_image: Carga eficiente de imágenes.**
- **google_fonts: Fuentes personalizadas.**
- **flutter_svg: Renderizado de gráficos SVG.**

1. Clona este repositorio:
   ```bash
   git clone https://github.com/CarlosRoqueM/Pokedex_Flutter.git
   cd pokedex
   ```

## lib/

├── main.dart # Punto de entrada de la aplicación  
├── presentation/ # Pantallas de la aplicación  
├── common/widgets/ # Componentes reutilizables  
├── common/asstes/ # Configuración de theme e imágenes y vectores

## Capturas

<div style="display: flex; flex-direction: row; gap: 10px;">
    <img src="/assets/images/image5.png" alt="Captura de pantalla" width="400">
    <img src="/assets/images/image4.png" alt="Captura de pantalla" width="400">
    <img src="/assets/images/image3.png" alt="Captura de pantalla" width="400">
    <img src="/assets/images/image2.png" alt="Captura de pantalla" width="400">
    <img src="/assets/images/image.png" alt="Captura de pantalla" width="400">
</div>
