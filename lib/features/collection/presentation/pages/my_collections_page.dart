
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pixelfield/core/constants.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/features/collection/presentation/cubit/collections/collection_cubit.dart';

@RoutePage()
class MyCollectionsPage extends StatelessWidget {
  const MyCollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionCubit, CollectionState>(
      builder: (context, state) {
        return switch (state) {
          CollectionInitial() => kLoadingWidget,
          CollectionLoading() => kLoadingWidget,
          CollectionError() => Center(child: Text('Some error')),
          CollectionLoaded() => _MyCollectionsContent(state.collection),
        };
      },
    );
  }
}

class _MyCollectionsContent extends StatelessWidget {
  final List<Bottle> collection;
  const _MyCollectionsContent(this.collection);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collection.length,
      itemBuilder: (context, index) {
        final bottle = collection[index];

        return ListTile(
          title: Text(bottle.name),
          onTap: () {},
        );
      },
    );
  }
}
