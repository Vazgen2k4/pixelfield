import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/presentation/widgets/page_wrapper.dart';

@RoutePage()
class InProgressPage extends StatelessWidget {
  const InProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Center(
        child: Text('In progress',
            style: TextStyle(
              fontSize: 32,
            )),
      ),
    );
  }
}
