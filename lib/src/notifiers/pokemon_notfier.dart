import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_graphql/src/services/graphql/graphql_service.dart';
import 'package:riverpod_graphql/src/state/pokemon_state.dart';

class PokemonNotifier extends StateNotifier<PokemonState> {
  /// Constructor for ListArticlesNotifier.
  PokemonNotifier(this._graphQLApi) : super(const PokemonState()) {
    listArticles();
  }

  final GraphQLApi _graphQLApi;

  Future<void> listArticles() async {
    try {
      state = const PokemonState.loading();
      final pokemon = await _graphQLApi.getPokemon();
      if (pokemon != null) {
        state = PokemonState.success(pokemon);
      } else {
        state = const PokemonState();
      }
    } catch (e) {
      state = const PokemonState.error('Could not fetch Articles');
      debugPrint(e.toString());
    }
  }
}
