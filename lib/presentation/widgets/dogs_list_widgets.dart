import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/dog_entity.dart';
import '../bloc/dog_list_cubit/dog_list_cubit.dart';
import '../bloc/dog_list_cubit/dog_list_state.dart';
import 'dog_card_widget.dart';

class DogsList extends StatelessWidget {
  final scrollController = ScrollController();

  DogsList({super.key});

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<DogListCubit>().loadDog();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return BlocBuilder<DogListCubit, DogState>(
      builder: (context, state) {
        List<DogEntity> dogs = [];
        bool isLoading = false;
        if (state is DogsLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is DogsLoading) {
          dogs = state.oldDogsList;
          isLoading = true;
        } else if (state is DogsLoaded) {
          dogs = state.dogsList;
        } else if (state is DogError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(fontSize: 25),
            ),
          );
        }

        return ListView.separated(
          controller: scrollController,
          itemCount: dogs.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < dogs.length) {
              return DogCard(dog: dogs[index]);
            } else {
              Timer(const Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });
              _loadingIndicator();
            }
            return null;
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[400],
            );
          },
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
