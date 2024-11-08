import 'package:flutter/material.dart';
import 'package:hotel_management/states/app_state.dart';
import 'package:hotel_management/widgets/cards/card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return ListView(
          children: [
            CardWidget(
              checkInDate: "12/11/2024",
              checkOutDate: "25/11/2024",
              isDarkMode: appState.isDarkMode,
              roomnum: "Room 058",
              status: true,
            ),
            CardWidget(
              checkInDate: "5/12/2024",
              checkOutDate: "8/12/2024",
              isDarkMode: appState.isDarkMode,
              roomnum: "Room 132",
              status: false,
            ),
            CardWidget(
              checkInDate: "23/12/2024",
              checkOutDate: "25/12/2024",
              isDarkMode: appState.isDarkMode,
              roomnum: "Room 750",
              status: false,
            ),
          ],
        );
      },
    );
  }
}
