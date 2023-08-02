import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var selectedFrom = 'Trivandrum'.obs;
  var selectedTo = 'Trivandrum'.obs;
  var selectedDate = '${DateTime.now().day} ${DateTime.now().month}'.obs;
  // var name ='Enter your name'.obs;
  // var email ='Enter your email'.obs;
  // var phoneNo ='Enter your Phone'.obs;

  void setSelectedFrom(value) {
    selectedFrom.value = value.toString();
  }

  void setSelectedTo(value) {
    selectedTo.value = value.toString();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024),
        initialEntryMode: DatePickerEntryMode.calendar,
        // initialDatePickerMode: DatePickerMode.day,
        helpText: 'When are you planning the trip ?',
        selectableDayPredicate: disableDate);

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = '${pickedDate.day} ${pickedDate.month}';
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;
  }
}