import 'package:store_web/generated/l10n.dart';
import 'package:store_web/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:store_web/module_auth/ui/states/login_states/login_state.dart';
import 'package:flutter/material.dart';

class LoginStateSuccess extends LoginState {
  final bool inited;
  LoginStateSuccess(LoginScreenState screen, this.inited) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.jpg'),
        ElevatedButton(
          onPressed: () {
            //screen.moveToNext(inited);
          },
          child: Text(S.of(context).welcomeToOurApp),
        )
      ],
    );
  }
}
