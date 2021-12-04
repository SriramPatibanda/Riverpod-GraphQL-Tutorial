import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_graphql/src/models/pokemon.dart';

part 'pokemon_state.freezed.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState() = _Initial;

  const factory PokemonState.loading() = _Loading;

  const factory PokemonState.success(Pokemon pokemon) = _Success;

  const factory PokemonState.error(String message) = _Error;
}
