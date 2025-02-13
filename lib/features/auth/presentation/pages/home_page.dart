import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/widgets/page_wrapper.dart';


@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper.tabs(
      routes: [
      ],
      title: '',
      child: SingleChildScrollView(
        child: Text('Home page'),
      ),
    );
  }
}
