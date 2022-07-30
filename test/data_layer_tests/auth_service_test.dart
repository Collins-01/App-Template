import 'package:app_template/core/data_layer/data_layer.dart';
import 'package:app_template/core/interfaces/interfaces.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  test('Authentication', () {
    final auth = AuthMock();
    expect(auth.isAuthenticated, true);
  });
}

class AuthMock extends Mock implements AuthService {}
