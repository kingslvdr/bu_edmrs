import 'package:bu_edmrs/common/widgets/items.dart';
import 'package:bu_edmrs/utils/constants/colors.dart';
import 'package:bu_edmrs/utils/constants/size.dart';
import 'package:bu_edmrs/utils/device/device_utility.dart';
import 'package:bu_edmrs/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class RequestEmployeeDetails extends StatelessWidget {
  const RequestEmployeeDetails({super.key, required this.item});
  final Items item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getScreenHeight() / 1.3,
      child: Column(
        children: [
          const Center(
            child: Text(
              'Employee Details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Iconsax.bank),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Business')
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  item.business.toString()
                ),
              ),
              const Divider(
                color: ConstColors.darkGrey,
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Iconsax.bank),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Department')
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  item.department.toString(),
                ),
              ),
              const Divider(
                color: ConstColors.darkGrey,
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Iconsax.bank),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Position')
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  item.position.toString(),
                ),
              ),
              const Divider(
                color: ConstColors.darkGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
