import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pixelfield/core/constants.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/core/router/router.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';
import 'package:test_pixelfield/features/collection/presentation/cubit/collections/collection_cubit.dart';

@RoutePage()
class MyCollectionPage extends StatelessWidget {
  const MyCollectionPage({super.key});

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

  void _onBottleTap(BuildContext context, Bottle bottle, int index) {
    AutoRouter.of(context).push(DetailsRoute(
      bottle: bottle,
      index: index,
      bottlesCount: collection.length,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      padding: const EdgeInsets.all(16),
      itemCount: (collection.length / 2).ceil(),
      itemBuilder: (context, index) {
        final leftIndex = index * 2;
        final rightIndex = leftIndex + 1;

        final bottleLeft = collection[leftIndex];
        Bottle? bottleRight;
        if ((rightIndex) < collection.length) {
          bottleRight = collection[rightIndex];
        }

        return SizedBox(
          height: 330,
          child: Row(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BottleWidget(
                  index: leftIndex,
                  bottle: bottleLeft,
                  onTap: _onBottleTap,
                ),
              ),
              if (bottleRight != null) ...[
                Expanded(
                  child: BottleWidget(
                    index: rightIndex,
                    bottle: bottleRight,
                    onTap: _onBottleTap,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class BottleWidget extends StatelessWidget {
  final Bottle bottle;
  final int index;
  final Function(BuildContext, Bottle, int) onTap;
  const BottleWidget({
    super.key,
    required this.bottle,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context, bottle, index),
      child: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.blackPrimary),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Image.asset(bottle.imagePath),
              SizedBox(
                width: 136,
                child: AutoSizeText(
                  '${bottle.name} ${bottle.bottleNumber}',
                  maxLines: 3,
                  style: TextStyle(
                    color: AppColors.greyPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    height: 28 / 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
