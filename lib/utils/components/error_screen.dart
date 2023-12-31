import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_web/generated/l10n.dart';
import 'package:store_web/utils/components/fixed_container.dart';
import 'package:store_web/utils/images/images.dart';

class ErrorStateWidget extends StatelessWidget {
  final String? error;
  final VoidCallback? onRefresh;
  final List<String>? errors;

  const ErrorStateWidget({super.key, this.error, required this.onRefresh, this.errors})
      : assert(error != null || errors != null);

  @override
  Widget build(BuildContext context) {
    return FixedContainer(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Flex(
              direction: Axis.vertical,
              children: [
                error != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flushbar(
                          title: S.of(context).thisErrorHappened,
                          message: error,
                          icon: const Icon(
                            Icons.info,
                            size: 28.0,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          flushbarStyle: FlushbarStyle.FLOATING,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flushbar(
                          title: S.of(context).errOc + ' : ',
                          messageText: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: getErrorMessage(errors!, true)),
                          icon: const Icon(
                            Icons.info,
                            size: 28.0,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          flushbarStyle: FlushbarStyle.FLOATING,
                        ),
                      ),
                Container(
                  height: 24,
                ),
                SvgPicture.asset(
                  SvgAsset.ERROR_SVG,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                Container(
                  height: 32,
                ),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 0),
                        onPressed: onRefresh,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            S.of(context).refresh,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getErrorMessage(List<String> errs, bool indexed) {
    List<Widget> errorMessages = [];
    int i = 1;
    String index;
    for (var element in errs) {
      index = indexed ? '$i- ' : '';
      errorMessages.add(Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          index + element,
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ));
      i++;
    }
    return errorMessages;
  }
}
