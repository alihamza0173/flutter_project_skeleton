import 'package:built_value/built_value.dart';
import 'package:wc_dart_framework/wc_dart_framework.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../../../models/data/user_data.dart';
import '../../../../models/states/api_state.dart';

part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder> {
  factory LoginState([
    final void Function(LoginStateBuilder) updates,
  ]) = _$LoginState;

  LoginState._();

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize(final LoginStateBuilder b) => b
    ..email = ''
    ..password = '';

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(final LoginStateBuilder b) {
    bool isFormValid() {
      final email = b.email!;
      final password = b.password!;
      if (email.isEmpty || Validators.email('')(email) != null) {
        return false;
      }
      if (password.isEmpty) {
        return false;
      }
      return true;
    }

    b.isFormValid = isFormValid();
  }

  @BlocUpdateField()
  String get email;

  @BlocUpdateField()
  String get password;

  ApiState<UserData> get loginApi;

  // finalize
  bool get isFormValid;
}
