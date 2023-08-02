import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpro/constants.dart';
import 'package:getxpro/global_variables.dart';
import 'package:getxpro/home_form_controller.dart';
import 'package:getxpro/screen_home.dart';
import 'package:getxpro/screen_invoice.dart';
import 'package:getxpro/widgets/global_app_bar.dart';
import 'package:getxpro/widgets/tf_widget.dart';

class ScreenDetails extends StatelessWidget {
   ScreenDetails({super.key});
final TextEditingController emailController =
      TextEditingController();
      final TextEditingController nameController =
      TextEditingController();
      final TextEditingController phoneNoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,top: 100),
        child: Column(
          

          children: [
            TextFieldInput(labelText: 'Name', controller: nameController, onChanged: (value){
              g_name=value;
            }),kSpace,
            TextFieldInput(labelText: 'Email', controller: emailController, onChanged: (value){
              g_email=value;
            }),kSpace,
            TextFieldInput(labelText: 'PhoneNo', controller: phoneNoController, onChanged: (value){
              g_phoneNo=value;
            }),kSpace,

            ElevatedButton(onPressed: (){
              getData.setCustomerDetails(g_name, g_train, g_phoneNo, g_email, g_seatNumbers, g_date);
              Get.to(ScreenInvoice());
            }, child: Text('Show Invoice'))
          ],
        ),
      )),
    );
  }
}