import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:riverpod_graphql/src/constants/strings.dart';
import 'package:riverpod_graphql/src/models/pokemon.dart';
import 'package:riverpod_graphql/src/services/graphql/queries.dart';

/// An abstract class which contains all the required APIs for the app.
abstract class GraphQLApi {
  /// Initialises GraphQL client
  Future<void> initGraphQL();

  Future<Pokemon> getPokemon(String pokemon);
}

/// A service used for all the API operations.
class GraphQLService extends GraphQLApi {
  /// Constructor for GraphQLService.
  GraphQLService();
  late GraphQLClient _client;

  @override
  Future<void> initGraphQL() async {
    final _httpLink = HttpLink(Strings.graphQLURL);

    _client = GraphQLClient(link: _httpLink, cache: GraphQLCache());

    debugPrint('GraphQL initialised');
  }

  @override
  Future<Pokemon> getPokemon(String pokemon) async {
    final options = QueryOptions(
        document: gql(Queries.getPokemon),
        variables: <String, String>{'Pokemon': pokemon});

    try {
      final result = await _client.query(options);

      final pokemon = Pokemon.fromJson(result.data!);

      return pokemon;
    } catch (e) {
      rethrow;
    }
  }
}
