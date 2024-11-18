import 'package:flutter/material.dart';
import '../../../shared/widgets/category_picker.dart';
import '../../../shared/widgets/datepicker.dart';
import '../../../shared/widgets/dropdown.dart';
import '../../../state_util.dart';
import '../../seat_picker/view/seat_picker_view.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hello, Selamat datang",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Badge(
              label: Text(
                "4",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Icon(Icons.notifications_outlined),
            ),
          ),
        ],
        backgroundColor: const Color(0xff2c3e50),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          color: const Color(0xfff0f0f0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Book Your Ticket Today",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff34495e),
                ),
              ),
              const SizedBox(height: 20.0),
              Theme(
                data: ThemeData.light(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12.0,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QCategoryPicker(
                        items: const [
                          {"label": "One Way", "value": "1"},
                          {"label": "Round - Trip", "value": "2"},
                          {"label": "Multiple City", "value": "3"},
                        ],
                        value: "1",
                        onChanged: (index, label, value, item) {},
                      ),
                      const SizedBox(height: 16.0),
                    QDropdownField(
  label: "From",
  value: "Pati",
  items: const [
    {"label": "Pati", "value": "Pati"},
    {"label": "Kudus", "value": "Kudus"},
    {"label": "Semarang", "value": "Semarang"},
    {"label": "Yogyakarta", "value": "Yogyakarta"},
    {"label": "Surabaya", "value": "Surabaya"},
    {"label": "Jakarta", "value": "Jakarta"},
  
  ],
  onChanged: (value, label) {},
),
QDropdownField(
  label: "To",
  value: "Kudus",
  items: const [
    {"label": "Pati", "value": "Pati"},
    {"label": "Kudus", "value": "Kudus"},
    {"label": "Semarang", "value": "Semarang"},
    {"label": "Yogyakarta", "value": "Yogyakarta"},
    {"label": "Surabaya", "value": "Surabaya"},
    {"label": "Jakarta", "value": "Jakarta"},
    
  ],
  onChanged: (value, label) {},
),

                      Row(
                        children: [
                          Expanded(
                            child: QDatePicker(
                              label: "Depart",
                              value: DateTime.now(),
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          const Text(
                            "-",
                            style: TextStyle(fontSize: 24.0, color: Color(0xff34495e)),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: QDatePicker(
                              label: "Return",
                              value: DateTime.now(),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        "Passengers",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xff34495e),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => controller.decrementAdult(),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 16.0),
                                  decoration: BoxDecoration(
                                    color: (controller.qtyAdult == 0)
                                        ? const Color(0xffe0e0e0)
                                        : const Color(0xffe67e22), // Soft gold color
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 22.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "${controller.qtyAdult} Adult",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff34495e),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () => controller.incrementAdult(),
                                child: Container(
                                  margin: const EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe67e22), // Soft gold color
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 22.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => controller.decrementChild(),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 16.0),
                                  decoration: BoxDecoration(
                                    color: (controller.qtyChild == 0)
                                        ? const Color(0xffe0e0e0)
                                        : const Color(0xffe67e22), // Soft gold color
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 22.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "${controller.qtyChild} Child",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff34495e),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () => controller.incrementChild(),
                                child: Container(
                                  margin: const EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe67e22), // Soft gold color
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 22.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      QDropdownField(
                        label: "Train Classes",
                        value: "Executive",
                        items: const [
                          {"label": "Executive", "value": "Executive"},
                          {"label": "Business", "value": "Business"},
                          {"label": "Economy", "value": "Economy"}
                        ],
                        onChanged: (value, label) {},
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        height: 48.0,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffe67e22), // Soft gold button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () => Get.to(const SeatPickerView()),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
