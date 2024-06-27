import 'package:bu_edmrs/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../common/widgets/dropdown_controller.dart';

class DropdownExample extends StatelessWidget {
  final DropdownController dropdownController = Get.put(DropdownController());

  DropdownExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bottom Modal Sheet 1/3 of Screen'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _showBottomSheet(context);
            },
            child: Text('Show Bottom Sheet'),
          ),
        ),
    );
  }
}
 void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 1 / 3, // Takes one-third of the screen height
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Modal Bottom Sheet',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      'Your content goes here. This can be a large text or any widgets that you want to display in the bottom sheet.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

