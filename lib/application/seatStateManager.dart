import 'package:book_my_seat/book_my_seat.dart';

class SeatManager {
 SeatManager( {this.newSeatState});
 
 final newSeatState;


}
 var seatcurrentState=[
[SeatState.unselected,SeatState.unselected,SeatState.disabled,SeatState.unselected,SeatState.unselected],
[SeatState.unselected,SeatState.unselected,SeatState.disabled,SeatState.unselected,SeatState.unselected],
[SeatState.unselected,SeatState.unselected,SeatState.disabled,SeatState.unselected,SeatState.unselected],
[SeatState.unselected,SeatState.unselected,SeatState.disabled,SeatState.unselected,SeatState.unselected],
[SeatState.unselected,SeatState.unselected,SeatState.disabled,SeatState.unselected,SeatState.unselected],
];