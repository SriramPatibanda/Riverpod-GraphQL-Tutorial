import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_graphql/src/providers/providers.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(graphqlProvider);
    final pokemon = ref.watch(getPokemonNotifierProvider);
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          return pokemon.when(
            () => const Center(
              child: Text('Something Went Wrong'),
            ),
            loading: () => const CircularProgressIndicator(),
            success: (pokemon) => Center(
              child: Column(
                children: [
                  Image.network(pokemon.sprite),
                  Text(pokemon.species)
                ],
              ),
            ),
            error: (error) => Text(error),
          );
        },
      ),
    );
  }
}
