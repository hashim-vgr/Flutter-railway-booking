import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getxpro/application/get_data.dart';
import 'package:getxpro/screen_booking.dart';
import 'package:getxpro/tf_decoration.dart';
import 'package:getxpro/widgets/global_app_bar.dart';

import 'dart:math' as math;
import 'dart:async';

import 'constants.dart';
import 'global_variables.dart';
import 'home_form_controller.dart';

GetData getData = GetData();


class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  FormController formController = FormController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: GlobalAppBar(),
        body: FutureBuilder(
            future: getData.getDocSnapshot(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.exists) {
                  Map<String, dynamic>? myData = snapshot.data?.data();
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text('Let\'s book your next Train',
                            style: Theme.of(context).textTheme.headlineLarge),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Obx(() => DropdownButtonFormField(
                                          value: formController.selectedFrom
                                              .toString(),
                                          items: myData?.values
                                              .toList()
                                              .map<DropdownMenuItem<String>>(
                                                  (value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: ((value) => formController
                                              .setSelectedFrom(value)),
                                          decoration:
                                              tF_decoration(context, 'From')))),
                                  kSpace,
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Obx(
                                        () => DropdownButtonFormField(
                                            value: formController.selectedTo
                                                .toString(),
                                            items: myData?.values
                                                .toList()
                                                .map<DropdownMenuItem<String>>(
                                                    (value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: ((value) =>
                                                formController
                                                    .setSelectedTo(value)),
                                            decoration:
                                                tF_decoration(context, 'To')),
                                      ))
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //TODO: implement function
                                // var temp = formController.selectedFrom;
                                // formController.selectedFrom =
                                //     formController.selectedTo;
                                // formController.selectedTo = temp;
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Transform.rotate(
                                    angle: 90 * math.pi / 180,
                                    child: const Icon(Icons.compare_arrows)),
                              ),
                            ),
                          ],
                        ),
                        kSpace,
                        Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Obx(
                                () => Text(
                                    formController.selectedDate.toString()),
                              ),
                            )),
                        kSpace,
                        ElevatedButton(
                            onPressed: () {
                              formController.chooseDate();
                            },
                            child: Text('Change Date')),
                        kSpace,
                        ElevatedButton(
                            onPressed: () {
                              if (formController.selectedFrom ==
                                  formController.selectedTo) {
                                Get.snackbar('Error',
                                    'Select Different Start and End locations');
                              } else {
                                g_date = formController.selectedDate.toString();
                                g_train =
                                    '${formController.selectedFrom}-${formController.selectedTo}';
                                Future<DocumentSnapshot<Map<String, dynamic>>>
                                    seatDetails = getData.getSeats(
                                        date: formController.selectedDate
                                            .toString(),
                                        train:
                                            '${formController.selectedFrom}-${formController.selectedTo}');

                                Get.to(ScreenBooking(
                                  seatDetails: seatDetails,
                                ));
                              }
                            },
                            child: Text('Book Seats'))
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
              throw () {};
            }));
  }
}


