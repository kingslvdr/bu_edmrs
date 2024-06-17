import 'package:bu_edmrs/common/widgets/appbar.dart';
import 'package:bu_edmrs/common/widgets/header_container.dart';
import 'package:bu_edmrs/common/widgets/inbox_list.dart';
import 'package:bu_edmrs/common/widgets/items_list.dart';
import 'package:bu_edmrs/utils/constants/colors.dart';
import 'package:bu_edmrs/utils/constants/size.dart';
import 'package:bu_edmrs/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class InboxRequest extends StatelessWidget {
  const InboxRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
              height: 120,
              child: Column(
                children: [
                  TAppBar(
                    padding: const EdgeInsets.symmetric(horizontal: ConstSizes.sm),
                    showBackArrow: true,
                    // leadingIcon: Iconsax.direct_left,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.direct_inbox,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Inbox',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: ConstColors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: DeviceUtils.getScreenHeight() / 1.2,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InboxList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
