import 'package:bu_edmrs/common/widgets/appbar.dart';
import 'package:bu_edmrs/common/widgets/cart_menu_icon.dart';
import 'package:bu_edmrs/utils/constants/size.dart';
import 'package:bu_edmrs/utils/popups/popups.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/constants/colors.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    super.key,
  });
  final localStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return TAppBar(
      padding: const EdgeInsets.symmetric(horizontal: ConstSizes.md),
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localStorage.read('greeting'),
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: ConstColors.grey),
          ),
          Text(
            localStorage.read('fullname'),
            // 'King Salvador',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: ConstColors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                localStorage.read('department'),
                // 'King Salvador',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: ConstColors.white),
              ),
              const SizedBox(
                width: ConstSizes.spaceBtwItems,
              ),
              Text(
                localStorage.read('position'),
                // 'King Salvador',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: ConstColors.white),
              ),
            ],
          ),
        ],
      ),
      actions: [
        CounterIcon(
          onPressed: () {
            PopUps.showLogout(context);
          },
          iconColor: ConstColors.white,
        ),
      ],
    );
  }
}
