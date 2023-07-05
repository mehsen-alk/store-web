import 'dart:async';
import 'package:store_web/abstracts/states/state.dart';
import 'package:store_web/module_main/ui/states/main_state_loaded.dart';
import 'package:store_web/utils/components/custom_app_bar.dart';
import 'package:store_web/utils/images/images.dart';
import 'package:injectable/injectable.dart';
import 'package:store_web/module_auth/state_manager/login_state_manager/login_state_manager.dart';
import 'package:flutter/material.dart';

@injectable
class MainScreen extends StatefulWidget {
  final LoginStateManager _stateManager;

  const MainScreen(this._stateManager);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  late States _currentStates;
  late AsyncSnapshot loadingSnapshot;
  late StreamSubscription _stateSubscription;
  bool deepLinkChecked = false;
  bool rememberMe = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void refresh() {
    if (mounted) setState(() {});
  }

  late bool canPop;
  @override
  void initState() {
    canPop = Navigator.of(context).canPop();
    loadingSnapshot = const AsyncSnapshot.nothing();
    _currentStates = MainStateLoaded(this);

    // _stateSubscription = widget._stateManager.stateStream.listen((event) {
    //   if (mounted) {
    //     setState(() {
    //       _currentStates = event;
    //     });
    //   }
    // });
    // widget._stateManager.loadingStream.listen((event) {
    //   if (mounted) {
    //     setState(() {
    //       loadingSnapshot = event;
    //     });
    //   }
    // });
    super.initState();
  }

  dynamic args;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(255, 233, 195, 113),
            ),
          ),
          Image.asset(
            ImageAsset.AUTH_BACKGROUND,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 200,
            child: Scaffold(
              appBar: CustomC4dAppBar.appBar(
                context,
                canGoBack: canPop,
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
              body: loadingSnapshot.connectionState != ConnectionState.waiting
                  ? _currentStates.getUI(context)
                  : Stack(
                      children: [
                        _currentStates.getUI(context),
                        Container(
                          width: double.maxFinite,
                          color: Colors.transparent.withOpacity(0.0),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }
}
