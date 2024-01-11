import 'package:reactive_forms/reactive_forms.dart';

class AuthController {
  static bool isLogin = true;

  static final loginFormGroup = FormGroup({
    'email': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
  });

  static final registerFormGroup = FormGroup(
    {
      'email': FormControl<String>(validators: [Validators.required]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
      ]),
      'passwordConfirmation': FormControl<String>(),
    },
    validators: [
      const MustMatchValidator(
        'password',
        'passwordConfirmation',
        true,
      ),
    ],
  );
}
