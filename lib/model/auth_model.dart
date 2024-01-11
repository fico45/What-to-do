import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';

/// Authentication class for this sample application.
/// It should be self-explanatory.
@freezed
sealed class AuthModel with _$AuthModel {
  const factory AuthModel.signedIn({
    required String id,
    required String displayName,
    required String email,
    required String token,
  }) = SignedIn;
  const AuthModel._();
  const factory AuthModel.signedOut() = SignedOut;
  bool get isAuth => switch (this) {
        SignedIn() => true,
        SignedOut() => false,
      };
}
