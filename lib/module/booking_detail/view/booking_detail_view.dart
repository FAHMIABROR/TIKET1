import 'package:flutter/material.dart';
import '../../../shared/widgets/separator.dart';
import '../../../state_util.dart';
import '../../main_navigation/view/main_navigation_view.dart';
import '../../seat_picker/view/seat_picker_view.dart';
import '../controller/booking_detail_controller.dart';

class BookingDetailView extends StatefulWidget {
  const BookingDetailView({Key? key}) : super(key: key);

  Widget build(context, BookingDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ticket",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.file_upload_outlined,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offAll(MainNavigationView()),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff2C3E50),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: const Color(0xffecf0f1),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 64,
                      left: -18,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xff2C3E50),
                      ),
                    ),
                    Positioned(
                      top: 64,
                      right: -18,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xff2C3E50),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 18,
                      right: 18,
                      child: Separator(),
                    ),
                    Positioned(
                      bottom: 135,
                      left: -18,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xff2C3E50),
                      ),
                    ),
                    Positioned(
                      bottom: 135,
                      right: -18,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xff2C3E50),
                      ),
                    ),
                    Positioned(
                      bottom: 150,
                      left: 18,
                      right: 18,
                      child: Separator(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Executive",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xff34495E),
                                  ),
                                ),
                              ),
                              Text(
                                "18 Juni 2013",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2C3E50),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                          Row(
                            children: [
                              _buildBookingInfo("From", "Pati"),
                              _buildBookingInfo("To", "Kudus"),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              _buildBookingInfo("Departure", "08:00 AM"),
                              _buildBookingInfo("Arrival", "09:00 AM"),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              _buildBookingInfo("Class", "Executive"),
                              _buildBookingInfo("Seat", "Executive, Seat 12"),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              _buildBookingInfo("Passenger", "1 Adult"),
                              _buildBookingInfo("Baggage", "15 KG"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "assets/images/qr.png",
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff39c12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Ticket Downloaded Successfully!"),
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
               
                  Get.to(const SeatPickerView());
                },
                child: const Text(
                  "Download Ticket",
                  style: TextStyle(
                    color: Color(0xff2C3E50),
                    fontSize: 16,
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
  State<BookingDetailView> createState() => BookingDetailController();

  Widget _buildBookingInfo(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xff7F8C8D),
              fontSize: 12.0,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xff2C3E50),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
