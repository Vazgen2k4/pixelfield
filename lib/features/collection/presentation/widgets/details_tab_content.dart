import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/features/collection/presentation/widgets/details_widget.dart';

class DetailsTabContent extends StatelessWidget {
  final Bottle bottle;
  const DetailsTabContent(this.bottle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        DetailsWidget(title: 'Distillery', value: bottle.details.distillery),
        DetailsWidget(title: 'Region', value: bottle.details.region),
        DetailsWidget(title: 'Country', value: bottle.details.country),
        DetailsWidget(title: 'Type', value: bottle.details.type),
        DetailsWidget(title: 'Filled', value: bottle.details.filled),
        DetailsWidget(title: 'Bottled', value: bottle.details.bottled),
        DetailsWidget(title: 'Cask number', value: bottle.details.caskNumber),
        DetailsWidget(title: 'ABV', value: bottle.details.abv.toString()),
        DetailsWidget(title: 'Size', value: bottle.details.size),
        DetailsWidget(title: 'Finish', value: bottle.details.finish),
        DetailsWidget(
            title: 'Age statement', value: bottle.details.ageStatement),
      ],
    );
  }
}
