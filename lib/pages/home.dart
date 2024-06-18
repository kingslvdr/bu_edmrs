// import 'package:carousel_slider/carousel_slider.dart';

import 'package:bu_edmrs/common/widgets/header_container.dart';
import 'package:bu_edmrs/common/widgets/home_appbar.dart';
import 'package:bu_edmrs/pages/balance.dart';
import 'package:bu_edmrs/pages/inbox_request.dart';
import 'package:bu_edmrs/pages/tablePage.dart';
import 'package:bu_edmrs/utils/constants/menu_const.dart';
import 'package:bu_edmrs/utils/constants/text_strings.dart';
import 'package:bu_edmrs/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
              height: 200,
              child: Column(
                children: [
                  HomeAppBar(),
                  Balances(),
                ],
              ),
            ),
            // gridMenu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ResponsiveGridRow(
                    children: List.generate(
                      Menutitle.length,
                      (index) => ResponsiveGridCol(
                        xs: 6,
                        md: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            splashColor: Colors.blue.withOpacity(0.5),
                            highlightColor: Colors.blue.withOpacity(0.5),
                            onTap: () {
                              if (index == 0) {
                                Get.to(() => const InboxRequest());
                              } else if (index == 1) {
                                Get.to(() => DataTableExample());
                                // alert(
                                //   "IMPORTANT NOTICE",
                                //   "This accredited hospital request form is specifically designed for employees who have availed the hospitalization benefit at our affiliated hospitals. Please do not use this form for your Medical Expense Reimbursement.",
                                //   context,
                                //   onConfirm: () {
                                //     Navigator.of(context, rootNavigator: true)
                                //         .pop();
                                //     Navigator.pushNamed(context, '/Admission');
                                //     // intent(context, Admission(toggleTheme: toggleTheme, isDarkMode: isDarkMode),'/Admission');
                                //   },
                                // );
                              } else if (index == 2) {
                                alert(
                                  TTexts.reimburseTitle,
                                  TTexts.reimburseBody,
                                  context,
                                  onConfirm: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    Navigator.pushNamed(
                                        context, '/Reimbursement');
                                  },
                                );
                              } else {
                                print("New Card tapped!");
                              }
                            },
                            child: index == 0
                                ? Stack(
                                    children: [
                                      Card(
                                        elevation: 5,
                                        color: isDarkMode
                                            ? const Color.fromARGB(
                                                255, 81, 81, 81)
                                            : const Color.fromARGB(
                                                255, 255, 255, 255),
                                        shadowColor: isDarkMode
                                            ? const Color.fromARGB(
                                                255, 109, 109, 109)
                                            : const Color.fromARGB(
                                                255, 67, 67, 67),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                buildImage(Menuicons[index], 90,
                                                    90, Alignment.center),
                                                const SizedBox(height: 10),
                                                Text(
                                                  Menutitle[index]
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color: isDarkMode
                                                        ? const Color.fromARGB(
                                                            255, 255, 255, 255)
                                                        : const Color.fromARGB(
                                                            255, 0, 0, 0),
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: 'Urbanist',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        // left: 0,
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '5',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .apply(
                                                      color: Colors.white,
                                                      fontSizeFactor: 0.8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Card(
                                    elevation: 5,
                                    color: isDarkMode
                                        ? const Color.fromARGB(255, 81, 81, 81)
                                        : const Color.fromARGB(
                                            255, 255, 255, 255),
                                    shadowColor: isDarkMode
                                        ? const Color.fromARGB(
                                            255, 109, 109, 109)
                                        : const Color.fromARGB(255, 67, 67, 67),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            buildImage(Menuicons[index], 90, 90,
                                                Alignment.center),
                                            const SizedBox(height: 10),
                                            Text(
                                              Menutitle[index].toUpperCase(),
                                              style: TextStyle(
                                                color: isDarkMode
                                                    ? const Color.fromARGB(
                                                        255, 255, 255, 255)
                                                    : const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Urbanist',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
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
