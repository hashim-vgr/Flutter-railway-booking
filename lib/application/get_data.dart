
import 'package:book_my_seat/book_my_seat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../global_variables.dart';


class GetData{
  
final db = FirebaseFirestore.instance;

Future<DocumentSnapshot<Map<String, dynamic>>> getDocSnapshot() async {
    return await db.collection("other details").doc("stations").get(); 


}

Future<DocumentSnapshot<Map<String, dynamic>>> getSeats({required String date,required String train})async{
    var seats= await db.collection(train).doc(date).collection('Seats').doc("seatStatus").get();
    if(seats.exists){
     return seats; 

    }else{
      final empty =<String,String>{
         
         '10':'available',
         '11':'available',
         '12':'disabled',
         '13':'available',
         '14':'available',
         '20':'available',
         '21':'available',
         '22':'disabled',
         '23':'available',
         '24':'available',
         '30':'available',
         '31':'available',
         '32':'disabled',
         '33':'available',
         '34':'available',
         '40':'available',
         '41':'available',
         '42':'disabled',
         '43':'available',
         '44':'available',
         '50':'available',
         '51':'available',
         '52':'disabled',
         '53':'available',
         '54':'available',

      };
      await db.collection(train).doc(date).collection('Seats').doc("seatStatus").set(empty);
      seats= await db.collection(train).doc(date).collection('Seats').doc("seatStatus").get();
      return seats;
    }
}

 void updateSeatState(newSeatState) async{
 Map<String, dynamic> myMap={};

               for(int i=0;i<5;i++){
                 

              for(int j=0;j<5;j++){
            if(  newSeatState[i][j]==SeatState.sold){
              
              myMap.addEntries([MapEntry('${i+1}$j','booked')]);
            }
            else if(  newSeatState[i][j]==SeatState.unselected){
              
              myMap.addEntries([MapEntry('${i+1}$j','available')]);
            }
            else if(  newSeatState[i][j]==SeatState.disabled){
              
              myMap.addEntries([MapEntry('${i+1}$j','disabled')]);
            }
              
              }}
         

      await db.collection(g_train).doc(g_date).collection('Seats').doc("seatStatus").set(myMap);

Get.snackbar('Success','seats booked successfully');


          

 }

 void setCustomerDetails(name,train,phoneNo,email,seatNumbers,date)async{
  var details ={
    'name':name,
    'email':email,
    'phoneNo':phoneNo

  };
      await db.collection('customerDetails').doc(date).collection(train).doc(seatNumbers.toString()).set(details);


 }


}
 
  
   
  
 
 

