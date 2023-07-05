import 'package:store_web/abstracts/states/state.dart';
import 'package:store_web/generated/l10n.dart';
import 'package:store_web/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:store_web/module_auth/ui/widget/custom_auth_filed.dart';
import 'package:flutter/material.dart';
import 'package:store_web/module_main/ui/screen/main_screen.dart';
import 'package:store_web/utils/helpers/custom_flushbar.dart';

class MainStateLoaded extends States {
  MainStateLoaded(MainScreenState screen, {String? error}) : super(screen) {
    screen.countryController.text = '966';
    if (error != null) {
      CustomFlushBarHelper.createError(
              title: S.current.warnning, message: error)
          .show(screen.context);
    }
  }
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  @override
  Widget getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _loginKey,
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}

class Password extends StatefulWidget {
  final bool isLastFiled;

  const Password({
    super.key,
    required this.screen,
    this.isLastFiled = false,
  });

  final LoginScreenState screen;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return CustomAuthFiled(
      title: S.current.password,
      controller: widget.screen.passwordController,
      isPassword: true,
      icon: Icons.lock,
      hintText: S.current.password,
      hidePassword: hidePassword,
      isLastFiled: widget.isLastFiled,
      onHidePassWordChange: (value) {
        setState(() {
          hidePassword = value;
        });
      },
    );
  }
}
