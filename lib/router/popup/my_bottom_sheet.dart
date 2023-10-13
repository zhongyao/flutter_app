import 'package:flutter/material.dart';

import 'my_dialog.dart';

void showMyBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const MyWidget();
      });
}
