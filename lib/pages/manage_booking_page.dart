import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_management/widgets/loading/loading_widget.dart';
import 'package:hotel_management/widgets/texts/h1_text.dart';
import 'package:hotel_management/widgets/texts/normal_text.dart';
import 'package:hotel_management/widgets/texts/snack_bar_text.dart';
import 'package:hotel_management/widgets/ui_color.dart';

class ManageBookingPage extends StatefulWidget {
  final String roomnum;
  final String checkInDate;
  final String checkOutDate;
  final bool isDarkMode;

  const ManageBookingPage({super.key, required this.checkInDate, required this.checkOutDate, required this.roomnum, required this.isDarkMode});

  @override
  State<ManageBookingPage> createState() => _ManageBookingPageState();
}

class _ManageBookingPageState extends State<ManageBookingPage> {
  TextEditingController daysControler = TextEditingController();

  List<String> paymentMethods = ["Touch N Go", "Online Banking", "PayPal", "Stripe"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColor().primaryBlue,
        iconTheme: IconThemeData(color: UIColor().white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            H1Text(text: widget.roomnum),
            Divider(
              height: 1,
              thickness: 1,
              color: widget.isDarkMode ? UIColor().lightGray : UIColor().darkGray,
            ),
            const SizedBox(
              height: 16,
            ),
            NormalText(text: "Check-In Date: ${widget.checkInDate}"),
            const SizedBox(
              height: 4,
            ),
            NormalText(text: "Check-Out Date: ${widget.checkOutDate}"),
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
                  onPressed: () async {
                    SnackBarText().showBanner(msg: "Checked in, enjoy your stay!", context: context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LoadingWidget().circularLoadingWidget(context);
                      },
                    );
                    await Future.delayed(const Duration(seconds: 2));
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    "Check-In",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 8,
            ),
            Row(mainAxisSize: MainAxisSize.max, children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    SnackBarText().showBanner(msg: "Checked out, stay with us again!", context: context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LoadingWidget().circularLoadingWidget(context);
                      },
                    );
                    await Future.delayed(const Duration(seconds: 2));
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    "Check-Out",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 8,
            ),
            Row(mainAxisSize: MainAxisSize.max, children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(UIColor().secondaryOrange)),
                  onPressed: () async {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: widget.isDarkMode ? UIColor().darkGray : UIColor().lightGray,
                          child: Padding(
                            padding: const EdgeInsets.all(36),
                            child: Column(
                              children: [
                                const H1Text(text: "Number of extra days"),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextField(
                                  controller: daysControler,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  style: TextStyle(color: UIColor().primaryBlue),
                                  decoration: const InputDecoration(
                                    hintText: "num days",
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  hint: const Text(
                                    'Select Payment Method',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items: paymentMethods.map(
                                    (item) {
                                      return DropdownMenuItem<String>(value: item, child: Text(item));
                                    },
                                  ).toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Select Payment Method';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (value) {},
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      color: UIColor().transparentSecondaryBlue,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(mainAxisSize: MainAxisSize.max, children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        SnackBarText().showBanner(msg: "Thank you for staying another ${daysControler.text} days", context: context);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return LoadingWidget().circularLoadingWidget(context);
                                          },
                                        );
                                        await Future.delayed(const Duration(seconds: 1));
                                        if (context.mounted) {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: Text(
                                        "Confirm",
                                        style: Theme.of(context).textTheme.headlineMedium,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Extend Stay",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 8,
            ),
            Row(mainAxisSize: MainAxisSize.max, children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(UIColor().primaryRed)),
                  onPressed: () async {
                    SnackBarText().showBanner(msg: "Cancled Booking", context: context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LoadingWidget().circularLoadingWidget(context);
                      },
                    );
                    await Future.delayed(const Duration(seconds: 2));
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    "Cancel Booking",
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
