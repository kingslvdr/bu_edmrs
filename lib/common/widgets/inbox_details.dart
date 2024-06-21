import 'package:bu_edmrs/common/widgets/items.dart';
import 'package:bu_edmrs/common/widgets/items_list.dart';
import 'package:bu_edmrs/common/widgets/request_emp_dtl.dart';
import 'package:bu_edmrs/utils/constants/colors.dart';
import 'package:bu_edmrs/utils/constants/size.dart';
import 'package:bu_edmrs/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Items item;

  ItemDetailsScreen({super.key, required this.item});
  final localStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(TabbarController());

    return Scaffold(
      appBar: AppBar(
        title: Text(item.empName.toString()),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.25, // Adjust the width as needed
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                    foregroundColor:
                        WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () {
                    // saveData("save", context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.thumb_down),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Reject'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.25, // Adjust the width as needed
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll<Color>(Colors.green),
                    foregroundColor:
                        WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () {
                    // saveData("save", context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.thumb_up),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Approve'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RequestEmployeeDetails(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
