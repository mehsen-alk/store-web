import 'package:flutter/material.dart';
import 'package:store_web/generated/l10n.dart';

class CustomLoginAppBar extends StatelessWidget {
  const CustomLoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          top: 25,
        ),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                S.of(context).login,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Opacity(
                opacity: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
