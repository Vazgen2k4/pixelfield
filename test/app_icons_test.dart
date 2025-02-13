import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_pixelfield/core/resources/resources.dart';

void main() {
  test('app_icons assets test', () {
    expect(File(AppIcons.squares).existsSync(), isTrue);
  });
}
