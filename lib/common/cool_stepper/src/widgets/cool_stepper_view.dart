import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/common/cool_stepper/src/models/cool_step.dart';
import 'package:jci_remit_mobile/common/cool_stepper/src/models/cool_stepper_config.dart';

class CoolStepperView extends StatelessWidget {
  final CoolStep step;
  final VoidCallback onStepNext;
  final VoidCallback onStepBack;
  final EdgeInsetsGeometry contentPadding;
  final CoolStepperConfig config;

  const CoolStepperView({
    Key key,
    @required this.step,
    this.onStepNext,
    this.onStepBack,
    this.contentPadding,
    this.config,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final title = Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: config.headerColor ??
            Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    step.title.toUpperCase(),
                    style: config.titleTextStyle ??
                        TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              Visibility(
                  visible: config.icon == null,
                  child: Icon(
                    Icons.help_outline,
                    size: 18,
                    color: config.iconColor ?? Colors.black38,
                  ),
                  replacement: config.icon ?? Container())
            ],
          ),
          SizedBox(height: 5.0),
          Text(
            step.subtitle,
            style: config.subtitleTextStyle ??
                TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
          )
        ],
      ),
    );

    final content = Expanded(
      child: SingleChildScrollView(
        padding: contentPadding,
        child: step.content,
      ),
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, content],
      ),
    );
  }
}
