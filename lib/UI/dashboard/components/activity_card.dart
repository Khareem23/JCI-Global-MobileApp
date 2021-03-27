import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/widgets/icon_button.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ActivityCard({Key key, @required this.title, @required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Container(
      height: 120,
      width: 110,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButtonAction(icon: icon),
          SizedBox(
            height: 20,
          ),
          Text(
            '$title',
            textAlign: TextAlign.start,
            style: theme.headline3.copyWith(color: AppColors.colorShade1),
          ),
        ],
      ),
    );
  }
}
