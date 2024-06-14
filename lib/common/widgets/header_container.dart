
import 'package:bu_edmrs/common/widgets/circular_container.dart';
import 'package:bu_edmrs/common/widgets/custom_curved_widget.dart';
import 'package:bu_edmrs/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomCurveWidget(
      child: Container(
        color: ConstColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 190,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  backgroundColor: ConstColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                  backgroundColor: ConstColors.textWhite.withOpacity(0.1),
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
