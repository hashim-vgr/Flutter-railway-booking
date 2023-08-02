import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getxpro/application/get_data.dart';
import 'package:getxpro/global_variables.dart';
import 'package:getxpro/screen_details.dart';
import 'package:getxpro/screen_invoice.dart';
import 'package:getxpro/widgets/global_app_bar.dart';

import 'application/seatStateManager.dart';

class ScreenBooking extends StatelessWidget {
   ScreenBooking({required this.seatDetails});
   Future<DocumentSnapshot<Map<String, dynamic>>> seatDetails;
   int no_of_seat_selected=0;

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      
      appBar: GlobalAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30 ,right: 30,top: 10,bottom: 10),
            child: FutureBuilder(
              future: seatDetails,
              builder: (context, snapshot) {
               

                if (snapshot.hasData) {
                 

                if (snapshot.data!.exists) {
                  

                 Map<String, dynamic>? myData = snapshot.data?.data();
                 
                 List myList =myData!.values.toList();
                
                 

                
                 
                int m=0;
                int n=0;
                for(int i=0;i<5;i++){
                 

              for(int j=0;j<5;j++){
                
                
                if(myList[m]=='available'){
                  seatcurrentState[n][j]=SeatState.unselected;
                }else if(myList[m]=='disabled'){
                  seatcurrentState[n][j]=SeatState.disabled;
                }else if(myList[m]=='booked'){
                  seatcurrentState[n][j]=SeatState.sold;
                }
                
                m+=1;
              }
              n+=1;
            }
           
              
              return SeatLayoutWidget(
              onSeatStateChanged: (rowIndex, colIndex, updatedSeatState) {
                print("tapped $rowIndex $colIndex $updatedSeatState");
                if(updatedSeatState==SeatState.selected){
                  no_of_seat_selected++;
                   g_seatNumbers.add("$rowIndex-$colIndex");
                   seatcurrentState[rowIndex][colIndex]=SeatState.selected;
                }
                if(updatedSeatState==SeatState.unselected){
                  no_of_seat_selected--;
                  g_seatNumbers.remove("$rowIndex-$colIndex");
                   seatcurrentState[rowIndex][colIndex]=SeatState.unselected;
                }
              },
              stateModel: SeatLayoutStateModel(
                rows:5,
                cols: 5,
                seatSvgSize: 80,
                pathUnSelectedSeat: 'assets/seat-disabled.svg',
                pathSelectedSeat: 'assets/seat-selected.svg',
                pathSoldSeat: 'assets/seat-sold.svg',
                pathDisabledSeat: 'assets/seat-unselected.svg',
                currentSeatsState: seatcurrentState,
              ),
                    );}else{
                      return CircularProgressIndicator();
                    }}else{
                 return CircularProgressIndicator();

                    }}
            ),
          ),ElevatedButton(onPressed: (){
              if(no_of_seat_selected<=0){
                Get.snackbar('Error', 'select atleast one seat');
              }else{

            for(int i=0;i<5;i++){
              for(int j=0;j<5;j++){
                if(seatcurrentState[i][j]==SeatState.selected){
                  seatcurrentState[i][j]=SeatState.sold;
                }
              }
            }
         
          GetData getData=GetData();
          getData.updateSeatState(seatcurrentState);
             Get.to(ScreenDetails());

          }
          }, child: Text('Book selected seats'))
        ],
      ),

    );
  }
}

 