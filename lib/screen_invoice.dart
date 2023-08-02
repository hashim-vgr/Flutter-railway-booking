import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getxpro/constants.dart';
import 'package:getxpro/global_variables.dart';
import 'package:getxpro/screen_home.dart';

import 'widgets/global_app_bar.dart';

class ScreenInvoice extends StatelessWidget {
  const ScreenInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobalAppBar(),
        body: Center(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row( mainAxisSize: MainAxisSize.min,children: [
        Icon(
              FontAwesomeIcons.trainSubway,
              color: Colors.red,
              size: 30,
        ),
        Text(
              'BookMyTrain',
              style: Theme.of(context).textTheme.titleSmall,
        ),SizedBox(width: 200,)
      ]),kSpace,
                      Text("name $g_name"),
                      Text("mail $g_email"),
                      Text("phoneNo $g_phoneNo"),
                      Text("seatNumbers $g_seatNumbers"),
                      Text("helpine : 81009790879"),
                      kSpace,
                      Image.asset('assets/QR.png')
                      
                    ],
                  ),
                ),
              ),
              kSpace,kSpace,
              ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            Get.to(ScreenHome());
          },
          child: const Text('Book Other Ticket'),
        ),
            ],
          ),
        ));
  }
}
