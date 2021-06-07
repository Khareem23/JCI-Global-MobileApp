import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/UI/dashboard/user_dashboard.dart';
import 'package:jci_remit_mobile/UI/invite/invite_screen.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class DashboardScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var theme = context.themeData.textTheme;
    final _selectedIndex = useState(0);
    void _onItemTap(int index) {
      _selectedIndex.value = index;
    }

    final List<Widget> _children = [
      UserDashboard(),
      Container(),
      Container(),
      InviteScreen(),
    ];

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Color(0xFF999999),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTap,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(AntDesign.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(AntDesign.user),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
                icon: Icon(Feather.users), label: 'Receivers'),
            BottomNavigationBarItem(
              icon: Icon(AntDesign.adduser),
              label: 'Invite Now',
            ),
          ],
        ),
        body: _children[_selectedIndex.value]);
  }
}
