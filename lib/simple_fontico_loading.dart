library simple_fontellico_progress_dialog;

import 'package:flutter/material.dart';
import 'package:simple_fontellico_progress_dialog/fontelico_icons.dart';
import 'package:simple_fontellico_progress_dialog/rotate_icon.dart';

enum SimpleFontelicoProgressDialogType {
  normal,
  threelines,
  multilines,
  refresh,
  hurricane,
  iphone,
  phoenix
}

class SimpleFontelicoProgressDialog {
  /// Value to indicate if dialog is open
  bool _isOpen = false;

  /// Context to render the dialog
  BuildContext? context;

  /// Bool value to indicate the barrierDismisable of the dialog
  final bool? barrierDimisable;

  /// Duration for animation
  final Duration? duration;

  SimpleFontelicoProgressDialog(
      {this.context,
      this.barrierDimisable,
      this.duration = const Duration(milliseconds: 1000)});

  /// Method to render the widget into the dialog
  Widget _getLoadingIndicator(SimpleFontelicoProgressDialogType type) {
    switch (type) {
      case SimpleFontelicoProgressDialogType.threelines:
        return RotateIcon(
          duration: this.duration,
          child: Icon(
            Fontelico.threelines,
            color: Colors.blue[600],
            size: 40.0,
          ),
        );
      case SimpleFontelicoProgressDialogType.multilines:
        return RotateIcon(
          duration: this.duration,
          child: Icon(
            Fontelico.multilines,
            color: Colors.blue[600],
            size: 40.0,
          ),
        );
      case SimpleFontelicoProgressDialogType.refresh:
        return RotateIcon(
          duration: this.duration,
          child: Icon(
            Fontelico.refresh,
            color: Colors.blue[600],
            size: 40.0,
          ),
        );
      case SimpleFontelicoProgressDialogType.hurricane:
        return RotateIcon(
          duration: this.duration,
          child: Icon(
            Fontelico.hurricane,
            color: Colors.blue[600],
            size: 40.0,
          ),
        );
      case SimpleFontelicoProgressDialogType.iphone:
        return RotateIcon(
          duration: this.duration,
          child: Icon(
            Fontelico.iphone,
            color: Colors.blue[600],
            size: 40.0,
          ),
        );
      case SimpleFontelicoProgressDialogType.phoenix:
        return RotateIcon(
          duration: this.duration,
          child: Icon(
            Fontelico.phoenix,
            color: Colors.blue[600],
            size: 40.0,
          ),
        );
      case SimpleFontelicoProgressDialogType.normal:
      default:
        return CircularProgressIndicator();
    }
  }

  /// message: String to indicate a message into the dialog. Required
  /// type: Simple dialog type (normal, threeline, multiline, refresh, hurricane, phoenix, iphone)
  /// height: Double value to indicate the dialog height
  /// width: Double value to indicate the dialog width
  /// radius: Double value to indicate the dialog border radius
  /// elevation: Double value to indicate the dialog elevation
  /// backgroundColor: Double value to indicate the dialog background color
  /// horizontal: Boolean value to indicate if loading has to show on horizontal
  /// separation: Double value to indicate the separation between loading and text
  void show({
    @required String? message,
    SimpleFontelicoProgressDialogType type =
        SimpleFontelicoProgressDialogType.normal,
    double height = 100,
    double width = 120,
    double radius = 5.0,
    double elevation = 5.0,
    Color backgroundColor = Colors.white,
    bool horizontal = false,
    double separation = 10.0,
  }) {
    assert(context != null, 'Context must not be null');
    _isOpen = true;
    showDialog(
        context: context!,
        barrierDismissible: barrierDimisable!,
        useSafeArea: true,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(0.0),
            child: Center(
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(radius))),
                child: !horizontal
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children:
                            _getChildren(type, message, horizontal, separation),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children:
                            _getChildren(type, message, horizontal, separation),
                      ),
              ),
            ),
          );
        });
  }

  /// Method to hide the dialog
  void hide() {
    if (_isOpen) {
      Navigator.of(context!).pop();
    }
  }

  List<Widget> _getChildren(SimpleFontelicoProgressDialogType type,
      String? message, bool horizontal, double separation) {
    return [
      _getLoadingIndicator(type),
      !horizontal
          ? SizedBox(
              height: separation,
            )
          : SizedBox(
              width: separation,
            ),
      Text(
        message!,
        style: TextStyle(fontSize: 14),
      )
    ];
  }
}
