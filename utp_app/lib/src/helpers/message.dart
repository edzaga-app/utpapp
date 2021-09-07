import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Message {
  BuildContext context;
  final type;
  String message;
  
  /// context: el contexto del widget.
  /// type: el tipo de mensage que usa la enumeración MessageType.
  /// message: el mensaje a mostrar.
  /// Muestra los mensajes de confirmación, error o información
  Message(this.context, this.type, this.message) {
    
    List<Icon> iconType = [
      Icon(Icons.check, size: 28.0, color: Colors.green[300]),
      Icon(Icons.info_outline_rounded, size: 28.0, color: Colors.blue[300]),
      Icon(Icons.error_outline, size: 28.0, color: Colors.red[300])
    ];

    List<Color> colorType = [
      Colors.green[300],
      Colors.blue[300],
      Colors.red[300]
    ];

    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      message: message,
      icon: iconType[type.index],
      duration: Duration(seconds: 4),
      leftBarIndicatorColor: colorType[type.index],
    )..show(context);

  }

}





