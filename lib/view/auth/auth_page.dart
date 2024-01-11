import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:what_to_do/provider/auth/auth_provider.dart';
import 'package:what_to_do/utils/consts.dart';
import 'package:what_to_do/view/auth/auth_controller.dart';
import 'package:what_to_do/view/widgets/button.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});
  static String get routeName => 'auth';
  static String get routeLocation => '/$routeName';
  static String get title => 'auth.login.title'.tr();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final authPr = ref.read(authProvider.notifier);
    final form = AuthController.loginFormGroup;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            AuthController.isLogin
                ? 'auth.login.title'.tr()
                : 'auth.register.title'.tr(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        body: Padding(
          padding: LayoutConst.formPadding,
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: LayoutConst.formLabelPadding,
                          child: Text(
                            'E-mail',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                        ),
                        ReactiveTextField(
                          decoration: FormStyleConst.defaultInputDecoration,
                          formControlName: 'email',
                          textInputAction: TextInputAction.next,
                          onSubmitted: (_) {
                            form.focus('password');
                          },
                        ),
                        Padding(
                          padding: LayoutConst.formLabelPadding,
                          child: Text(
                            'Password',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                        ),
                        ReactiveTextField(
                          decoration: FormStyleConst.defaultInputDecoration,
                          formControlName: 'password',
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          onSubmitted: (_) async {
                            await authPr.signIn(
                              email: form.control('email').value,
                              password: form.control('password').value,
                            );
                          },
                        ),
                        const SizedBox(
                          height: SizeConst.sizeS,
                        ),
                        Button(
                          type: ButtonType.primary,
                          child: Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: getContentColor(
                                    context: context,
                                    type: ButtonType.primary,
                                  ),
                                ),
                          ),
                          onPressed: () async {
                            await authPr.signIn(
                              email: form.control('email').value,
                              password: form.control('password').value,
                            );
                          },
                        ),
                      ],
                    )),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Text(
                        "auth.login.dont-have-account".tr(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: getContentColor(
                                context: context,
                                type: ButtonType.primary,
                              ),
                            ),
                      ),
                      Button(
                        type: ButtonType.secondary,
                        child: Text(
                          'auth.login.go-to-register'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: getContentColor(
                                  context: context,
                                  type: ButtonType.secondary,
                                ),
                              ),
                        ),
                        onPressed: () async {
                          AuthController.isLogin = false;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
