import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_pixelfield/core/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.bg).existsSync(), isTrue);
    expect(File(AppImages.bottle).existsSync(), isTrue);
    expect(File(AppImages.logo).existsSync(), isTrue);
  });
}
