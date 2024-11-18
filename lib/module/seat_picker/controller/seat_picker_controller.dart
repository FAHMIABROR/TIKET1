import 'package:flutter/material.dart';

import '../../../state_util.dart';
import '../view/seat_picker_view.dart';

class SeatPickerController extends State<SeatPickerView>
    implements MvcController {
  static late SeatPickerController instance;
  late SeatPickerView view;

  
  final int carriageCount = 5;

 
  int selectedCarriage = 0;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  
  Map<int, List<int>> usedSeats = {
    0: [11],
    1: [5, 10],
    2: [8, 18],
    3: [0, 1],
    4: [20]
  };

 
  Map<int, List<int>> selectedSeats = {
    0: [0, 1, 2, 3, 4, 7, 8, 9, 12, 16, 18, 19, 20, 21, 23, 24, 27],
    1: [],
    2: [],
    3: [],
    4: []
  };

 
  void updateSeat(int index) {
    final currentUsedSeats = usedSeats[selectedCarriage] ?? [];
    final currentSelectedSeats = selectedSeats[selectedCarriage] ?? [];

    if (currentSelectedSeats.contains(index)) return;

    if (!currentUsedSeats.contains(index)) {
      currentUsedSeats.add(index);
    } else {
      currentUsedSeats.remove(index);
    }

    usedSeats[selectedCarriage] = currentUsedSeats;
    setState(() {});
  }

  
  void updateCarriage(int value) {
    selectedCarriage = value;
    setState(() {});
  }

  
  List<int> get currentUsedSeats =>
      usedSeats[selectedCarriage] ?? [];


  List<int> get currentSelectedSeats =>
      selectedSeats[selectedCarriage] ?? [];
}
