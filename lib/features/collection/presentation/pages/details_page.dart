// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';
import 'package:test_pixelfield/core/presentation/widgets/page_wrapper.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/primary_button.dart';

@RoutePage()
class DetailsPage extends StatelessWidget {
  final Bottle bottle;
  final int index;
  final int bottlesCount;
  
  const DetailsPage({
    super.key,
    required this.bottle,
    required this.index,
    required this.bottlesCount,
  });

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      withBg: true,
      alignment: Alignment.topCenter,
      floatActionButton: PrimaryButtonWidget(text: 'Add to my collection'),
      appBarParams: AppBarWrapperParams(
        title: 'Genesis Collection',
        titleIsLabel: true,
        toolbarHeight: 72,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.blackSecondary),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            icon: Icon(
              Icons.close,
              size: 24,
            ),
            onPressed: () => context.router.maybePop(),
          ),
          SizedBox(width: 16),
        ],
      ),
      child: _DetailsContent(bottle, index, bottlesCount),
    );
  }
}

class _DetailsContent extends StatelessWidget {
  final Bottle bottle;
  final int index;
  final int bottlesCount;
  
  const _DetailsContent(
    this.bottle,
    this.index,
    this.bottlesCount,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.0,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
            child: Image.asset(bottle.imagePath),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: AppColors.blackPrimary,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 8,
              children: [
                AutoSizeText(
                  "Bottle ${index + 1}/$bottlesCount",
                  style: TextStyle(
                    color: AppColors.greySecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16,
                  ),
                ),
                
                AutoSizeText.rich(
                  TextSpan(text: bottle.name, children: [
                    TextSpan(
                      text: ' ${bottle.details.ageStatement}',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  ]),
                  maxLines: 1,
                  style: TextStyle(
                    color: AppColors.greyPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    height: 40 / 32,
                  ),
                ),
                Text(
                  bottle.bottleNumber,
                  style: TextStyle(
                    color: AppColors.greyPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    height: 40 / 32,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
