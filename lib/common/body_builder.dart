import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/helper/enums.dart';

import 'network_error_widget.dart';

class BodyBuilder extends StatelessWidget {
  final Widget child;
  final Widget loadingWidget;
  final Widget errorWidget;
  final Function reload;
  final APIRequestStatus apiRequestStatus;
  final String error;

  const BodyBuilder(
      {Key key,
      this.loadingWidget,
      this.reload,
      this.child,
      this.errorWidget,
      this.apiRequestStatus,
      this.error})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    switch (apiRequestStatus) {
      case APIRequestStatus.loading:
        return loadingWidget;
        break;
      case APIRequestStatus.unInitialized:
        return loadingWidget;
        break;
      case APIRequestStatus.connectionError:
        return NetworkErrorWidget(refreshCallBack: reload);
        break;
      case APIRequestStatus.error:
        return NetworkErrorWidget(
          refreshCallBack: reload,
          error: error,
        );
        break;
      case APIRequestStatus.loaded:
        return child;
        break;
      default:
        return loadingWidget;
    }
  }
}
