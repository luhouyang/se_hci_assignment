import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_management/pages/router.dart';
import 'package:hotel_management/states/app_state.dart';
import 'package:hotel_management/widgets/fields/text_input.dart';
import 'package:hotel_management/widgets/loading/loading_widget.dart';
import 'package:hotel_management/widgets/texts/h1_text.dart';
import 'package:hotel_management/widgets/texts/snack_bar_text.dart';
import 'package:hotel_management/widgets/ui_color.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();

  TextInputs textInputs = TextInputs();
  SnackBarText snackBarText = SnackBarText();

  TextEditingController inEmailTextController = TextEditingController();
  TextEditingController inPassTextController = TextEditingController();

  TextEditingController upEmailTextController = TextEditingController();
  TextEditingController upPassTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();

  bool _isLogin = true;
  bool _hidePassword = true;

  void setShowPasword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  bool getShowPassword() {
    return _hidePassword;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 56, 24, 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Image.asset(
                          'assets/hotel.jpg',
                          scale: 3.5,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const H1Text(text: "Hotel Access"),
                        const SizedBox(
                          height: 32,
                        ),
                        _isLogin
                            ? Form(
                                key: _loginFormKey,
                                child: Column(
                                  children: [
                                    textInputs.inputTextWidget(hint: "email", validator: textInputs.emailVerify, controller: inEmailTextController),
                                    textInputs.obscureInputTextWidget(
                                        hint: "password",
                                        validator: textInputs.passwordVerify,
                                        controller: inPassTextController,
                                        getFunc: getShowPassword,
                                        setFunc: setShowPasword),
                                    forgotPasswordWidget(),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(mainAxisSize: MainAxisSize.max, children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(14),
                                          ),
                                          onPressed: () async {
                                            if (_loginFormKey.currentState!.validate()) {
                                              snackBarText.showBanner(msg: "Logging In", context: context);
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return LoadingWidget().circularLoadingWidget(context);
                                                },
                                              );
                                              await Future.delayed(const Duration(seconds: 2));
                                              if (context.mounted) {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => const RouterPage(),
                                                ));
                                              }
                                            }
                                          },
                                          child: Text(
                                            "LOGIN",
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(mainAxisSize: MainAxisSize.max, children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style:
                                              ElevatedButton.styleFrom(padding: const EdgeInsets.all(14), backgroundColor: UIColor().secondaryOrange),
                                          onPressed: () async {
                                            snackBarText.showBanner(msg: "Welcome Back", context: context);
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return LoadingWidget().circularLoadingWidget(context);
                                              },
                                            );
                                            await Future.delayed(const Duration(seconds: 2));
                                            if (context.mounted) {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => const RouterPage(),
                                              ));
                                            }
                                          },
                                          child: Text(
                                            "Sign In with Google",
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(mainAxisSize: MainAxisSize.max, children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style:
                                              ElevatedButton.styleFrom(padding: const EdgeInsets.all(14), backgroundColor: UIColor().primaryOrange),
                                          onPressed: () async {
                                            snackBarText.showBanner(msg: "Welcome Back", context: context);
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return LoadingWidget().circularLoadingWidget(context);
                                              },
                                            );
                                            await Future.delayed(const Duration(seconds: 2));
                                            if (context.mounted) {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => const RouterPage(),
                                              ));
                                            }
                                          },
                                          child: Text(
                                            "Sign In with Microsoft",
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Divider(color: Theme.of(context).primaryColor, thickness: 1.5),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    createNewAccountText(),
                                  ],
                                ))
                            : Form(
                                key: _signUpFormKey,
                                child: Column(
                                  children: [
                                    textInputs.inputTextWidget(hint: "email", validator: textInputs.emailVerify, controller: upEmailTextController),
                                    textInputs.obscureInputTextWidget(
                                        hint: "password",
                                        validator: textInputs.passwordVerify,
                                        controller: upPassTextController,
                                        getFunc: getShowPassword,
                                        setFunc: setShowPasword),
                                    textInputs.inputTextWidget(
                                        hint: "username", validator: textInputs.usernameVerify, controller: userNameTextController),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(mainAxisSize: MainAxisSize.max, children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(14),
                                          ),
                                          onPressed: () async {
                                            if (_signUpFormKey.currentState!.validate()) {
                                              snackBarText.showBanner(msg: "Creating Account", context: context);
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return LoadingWidget().circularLoadingWidget(context);
                                                },
                                              );
                                              await Future.delayed(const Duration(seconds: 2));
                                              if (context.mounted) {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => const RouterPage(),
                                                ));
                                              }
                                            }
                                          },
                                          child: Text(
                                            "SIGN UP",
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(mainAxisSize: MainAxisSize.max, children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style:
                                              ElevatedButton.styleFrom(padding: const EdgeInsets.all(14), backgroundColor: UIColor().secondaryOrange),
                                          onPressed: () async {
                                            snackBarText.showBanner(msg: "Welcome Back", context: context);
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return LoadingWidget().circularLoadingWidget(context);
                                              },
                                            );
                                            await Future.delayed(const Duration(seconds: 2));
                                            if (context.mounted) {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => const RouterPage(),
                                              ));
                                            }
                                          },
                                          child: Text(
                                            "Sign In with Google",
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(mainAxisSize: MainAxisSize.max, children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style:
                                              ElevatedButton.styleFrom(padding: const EdgeInsets.all(14), backgroundColor: UIColor().primaryOrange),
                                          onPressed: () async {
                                            snackBarText.showBanner(msg: "Welcome Back", context: context);
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return LoadingWidget().circularLoadingWidget(context);
                                              },
                                            );
                                            await Future.delayed(const Duration(seconds: 2));
                                            if (context.mounted) {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => const RouterPage(),
                                              ));
                                            }
                                          },
                                          child: Text(
                                            "Sign In with Microsoft",
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Divider(color: Theme.of(context).primaryColor, thickness: 1.5),
                                    loginWithAccountText(),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 35,
                right: 15,
                child: appState.isDarkMode
                    ? IconButton(
                        onPressed: () {
                          AdaptiveTheme.of(context).setLight();
                          appState.setDarkMode(false);
                        },
                        icon: const Icon(
                          Icons.light_mode_outlined,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          AdaptiveTheme.of(context).setDark();
                          appState.setDarkMode(true);
                        },
                        icon: const Icon(
                          Icons.dark_mode_outlined,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget forgotPasswordWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              text: "forgot password?",
              style: Theme.of(context).textTheme.labelLarge,
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (inEmailTextController.text.isNotEmpty) {
                    snackBarText.showBanner(msg: "Sent to ${inEmailTextController.text}", context: context);
                  } else {
                    snackBarText.showBanner(msg: "Enter your email", context: context);
                  }
                },
            ),
          ),
        ],
      ),
    );
  }

  Widget createNewAccountText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: <TextSpan>[
            TextSpan(text: "Create a new account ", style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
              text: "Here",
              style: Theme.of(context).textTheme.labelLarge,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _isLogin = !_isLogin;
                  setState(() {});
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget loginWithAccountText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: <TextSpan>[
            TextSpan(text: "Already have an account? ", style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
              text: "Login",
              style: Theme.of(context).textTheme.labelLarge,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _isLogin = !_isLogin;
                  setState(() {});
                },
            ),
          ],
        ),
      ),
    );
  }
}
