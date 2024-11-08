import 'package:flutter/material.dart';
import 'package:hotel_management/pages/manage_booking_page.dart';
import 'package:hotel_management/widgets/texts/h1_text.dart';
import 'package:hotel_management/widgets/texts/normal_text.dart';
import 'package:hotel_management/widgets/ui_color.dart';

class CardWidget extends StatelessWidget {
  final String roomnum;
  final String checkInDate;
  final String checkOutDate;
  final bool isDarkMode;

  const CardWidget({super.key, required this.checkInDate, required this.checkOutDate, required this.isDarkMode, required this.roomnum});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 5,
      color: isDarkMode ? DataPresentationColor().darkBackground : DataPresentationColor().lightBackground,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            H1Text(text: roomnum),
            Divider(
              height: 1,
              thickness: 1,
              color: isDarkMode ? UIColor().lightGray : UIColor().darkGray,
            ),
            const SizedBox(
              height: 16,
            ),
            NormalText(text: "Check-In Date: $checkInDate"),
            const SizedBox(
              height: 4,
            ),
            NormalText(text: "Check-Out Date: $checkOutDate"),
            const SizedBox(
              height: 4,
            ),
            const NormalText(text: "Facilities: Swimming Pool, Gym, Buffet"),
            const SizedBox(
              height: 12,
            ),
            Row(mainAxisSize: MainAxisSize.max, children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ManageBookingPage(
                          checkInDate: checkInDate,
                          checkOutDate: checkOutDate,
                          roomnum: roomnum,
                          isDarkMode: isDarkMode,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Manage",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
