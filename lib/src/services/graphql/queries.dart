abstract class Queries {
  static const String getPokemon = r'''
    query getFuzzyPokemon($pokemon : String!){
        getFuzzyPokemon(pokemon: $pokemon reverseFlavorTexts: true takeFlavorTexts: 1) {
            species
            sprite
            backSprite
            abilities
          }
        }
  ''';
}
