import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_graphql/src/notifiers/pokemon_notfier.dart';
import 'package:riverpod_graphql/src/services/graphql/graphql_service.dart';
import 'package:riverpod_graphql/src/state/pokemon_state.dart';

final graphqlProvider =
    Provider<GraphQLService>((ref) => GraphQLService()..initGraphQL());

final getPokemonNotifierProvider =
    StateNotifierProvider<PokemonNotifier, PokemonState>(
  (StateNotifierProviderRef<PokemonNotifier, PokemonState> ref) =>
      PokemonNotifier(
    ref.watch(graphqlProvider),
  ),
);
