import 'package:utp_app/src/models/nav/nav_menu_item.dart';

import '../pages/mobile_portal.dart';
import '../pages/directory.dart';
import '../pages/parking.dart';
import '../pages/news.dart';
import '../pages/events.dart';
import '../pages/campus.dart';
import '../pages/radio_station.dart';
import '../pages/orientation_test.dart';
import '../pages/suggestions.dart';
import '../pages/share.dart';
import '../pages/help.dart';

import '../widgets/home/home_widgets.dart';


class Navigation with ChangeNotifier {
  String currentNavigation = 'Home';
  String nameNavigation = 'Utp Móvil';

  get getNavigation {
    if (currentNavigation == 'mobilePortal') {
      return MobilePortal() ;
    } else if (currentNavigation == "directory") {
      return Directory();
    } else if (currentNavigation == 'parking') {
      return Parking();
    } else if (currentNavigation == 'news') {
      return News();
    } else if (currentNavigation == 'events') {
      return Events();
    } else if (currentNavigation == 'campus') {
      return Campus();
    } else if (currentNavigation == 'radioStation') {
      return RadioStation();
    } else if (currentNavigation == 'orientationTest') {
      return OrientationTest();
    } else if (currentNavigation == 'suggestions') {
      return Suggestions();
    } else if (currentNavigation == 'share') {
      return Share();
    } else if (currentNavigation == 'help') {
      return Help();
    } else {
      return SwitchList();
    }
  }

  updateNavigation(String navigation, int index) {
    currentNavigation = navigation;
    nameNavigation = menuTitles[index];
    notifyListeners();
  }

}