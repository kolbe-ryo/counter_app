import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../application/authentication/authentication_service.dart';
import '../../../inflastracture/firebase/authenticate/authenticate_enum.dart';
import 'app_button.dart';
import 'app_icon_button.dart';

class AppSignInButtons extends ConsumerWidget {
  const AppSignInButtons._({
    required this.backgroundColor,
    required this.buttonName,
    required this.onPressed,
    required this.iconData,
  });

  factory AppSignInButtons.email() {
    return AppSignInButtons._(
      backgroundColor: Colors.lightBlue,
      buttonName: 'Email',
      onPressed: (ref) async => ref.read(authenticationServiceProvider(AuthenticationMethod.email)).signIn(),
      iconData: FontAwesomeIcons.envelope,
    );
  }

  factory AppSignInButtons.apple() {
    return AppSignInButtons._(
      backgroundColor: Colors.cyan,
      buttonName: 'Apple',
      onPressed: (ref) async => ref.read(authenticationServiceProvider(AuthenticationMethod.apple)).signIn(),
      iconData: FontAwesomeIcons.apple,
    );
  }

  factory AppSignInButtons.google() {
    return AppSignInButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'Google',
      onPressed: (ref) async => ref.read(authenticationServiceProvider(AuthenticationMethod.google)).signIn(),
      iconData: FontAwesomeIcons.google,
    );
  }

  final Color backgroundColor;
  final String buttonName;
  final void Function(WidgetRef) onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton.largeWidth(
      appButtonStyle: AppIconButton(
        backgroundColor: backgroundColor,
        buttonName: buttonName,
        onPressed: () => onPressed(ref),
        iconData: iconData,
      ),
    );
  }
}
