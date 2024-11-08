import 'package:flutter/material.dart';
import 'package:hotel_management/states/app_state.dart';
import 'package:hotel_management/widgets/ui_color.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(36),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 75,
                                    backgroundImage: AssetImage('assets/placeholders/profile_placeholder.jpg'),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: InkWell(
                                      hoverColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onHover: (value) {},
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: (appState.isDarkMode ? UIColor().secondaryOrange : UIColor().secondaryBlue).withOpacity(0.1),
                                          border: Border.all(
                                            color: appState.isDarkMode ? UIColor().secondaryOrange : UIColor().secondaryBlue,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(150),
                                        ),
                                        child: Icon(
                                          color: appState.isDarkMode ? UIColor().secondaryOrange : UIColor().secondaryBlue,
                                          Icons.camera_alt_outlined,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Theme.of(context).primaryColor,
                                  backgroundColor: UIColor().primaryOrange,
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () async {},
                                child: Text(
                                  "LOGOUT",
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
