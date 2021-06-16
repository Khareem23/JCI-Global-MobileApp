import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/helper/enums.dart';

import 'network_error_widget.dart';

class BodyBuilder extends StatelessWidget {
  final Widget child;
  final Widget loadingWidget;
  final Widget? errorWidget;
  final Function reload;
  final APIRequestStatus apiRequestStatus;
  final String error;

  const BodyBuilder(
      {Key? key,
      required this.loadingWidget,
      required this.reload,
      required this.child,
      this.errorWidget,
      required this.apiRequestStatus,
      required this.error})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    switch (apiRequestStatus) {
      case APIRequestStatus.loading:
        return loadingWidget;
      case APIRequestStatus.unInitialized:
        return loadingWidget;
      case APIRequestStatus.connectionError:
        return NetworkErrorWidget(refreshCallBack: reload);
      case APIRequestStatus.error:
        return NetworkErrorWidget(
          refreshCallBack: reload,
          error: error,
        );
      case APIRequestStatus.loaded:
        return child;
      default:
        return loadingWidget;
    }
  }
}
