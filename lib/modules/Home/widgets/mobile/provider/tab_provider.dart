import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  // SelectedTab? tab;
  // Icon? icon;

  // TabProvider({
  //   this.tab,
  //   this.icon,
  // });

  bool switch1 = true;
  bool switch2 = false;
  bool switch3 = false;

  Widget? setTab(String menuTab) {
    // check the selceted tab and set the screen accordingly
    switch (menuTab) {
      case 'home':
        switch1 = true;
        switch2 = false;
        switch3 = false;
        notifyListeners();
        break;
      case 'statistics':
        switch1 = false;
        switch2 = true;
        switch3 = false;
        notifyListeners();
        break;
      case 'about':
        switch1 = false;
        switch2 = false;
        switch3 = true;
        notifyListeners();
        break;
    }
    return null;
  }
}
