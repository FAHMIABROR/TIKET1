import 'package:flutter/material.dart';
import '../../../state_util.dart';
import '../../booking_detail/view/booking_detail_view.dart';
import '../controller/seat_picker_controller.dart';

class SeatPickerView extends StatefulWidget {
  const SeatPickerView({Key? key}) : super(key: key);

  Widget build(context, SeatPickerController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Seat",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff383d47),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20.0,
            color: Color(0xff383d47),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select Carriage:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                DropdownButton<int>(
                  value: controller.selectedCarriage,
                  onChanged: (value) {
                    if (value != null) {
                      controller.updateCarriage(value);
                    }
                  },
                  items: List.generate(
                    controller.carriageCount,
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text("Carriage ${index + 1}"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _SeatLegend(color: Color(0xff1aa84b), label: "Available"),
                _SeatLegend(color: Color(0xfff8c321), label: "Selected"),
                _SeatLegend(color: Color(0xffe4e4e4), label: "Unavailable"),
              ],
            ),
            const SizedBox(height: 20),
            // Seat Layout
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Icon(Icons.door_back_door, color: Colors.grey, size: 40),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10, // Number of rows
                        itemBuilder: (context, rowIndex) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Left side seats
                                ...List.generate(2, (seatIndex) {
                                  final seatNumber = rowIndex * 4 + seatIndex;
                                  final isAvailable = !controller.currentUsedSeats.contains(seatNumber);
                                  final isSelected = controller.currentSelectedSeats.contains(seatNumber);
                                  return _Seat(
                                    seatNumber: seatNumber,
                                    isAvailable: isAvailable,
                                    isSelected: isSelected,
                                    onTap: isAvailable
                                        ? () => controller.updateSeat(seatNumber)
                                        : null,
                                  );
                                }),
                                // Spacer for aisle
                                const SizedBox(width: 20),
                                // Right side seats
                                ...List.generate(2, (seatIndex) {
                                  final seatNumber = rowIndex * 4 + seatIndex + 2;
                                  final isAvailable = !controller.currentUsedSeats.contains(seatNumber);
                                  final isSelected = controller.currentSelectedSeats.contains(seatNumber);
                                  return _Seat(
                                    seatNumber: seatNumber,
                                    isAvailable: isAvailable,
                                    isSelected: isSelected,
                                    onTap: isAvailable
                                        ? () => controller.updateSeat(seatNumber)
                                        : null,
                                  );
                                }),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Icon(Icons.wc, color: Colors.grey, size: 40),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(const BookingDetailView()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfffdc620),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Confirm Seat",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383d47),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<SeatPickerView> createState() => SeatPickerController();
}

class _Seat extends StatelessWidget {
  final int seatNumber;
  final bool isAvailable;
  final bool isSelected;
  final VoidCallback? onTap;

  const _Seat({
    Key? key,
    required this.seatNumber,
    required this.isAvailable,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xfff8c321)
              : isAvailable
                  ? const Color(0xff1aa84b)
                  : const Color(0xffe4e4e4),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            "S${seatNumber + 1}",
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _SeatLegend extends StatelessWidget {
  final Color color;
  final String label;

  const _SeatLegend({
    Key? key,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
