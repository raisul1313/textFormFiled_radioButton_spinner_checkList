import 'package:flutter/material.dart';
import 'package:owner_information/utils/color_utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final bool isCenterTitle;
  final bool showLeadingBackButton;
  final List<Widget>? actions;

  CustomAppBar({
    this.title = "",
    this.isCenterTitle = true,
    this.showLeadingBackButton = false,
    this.actions,
    Key? key,
  })  : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
          style: TextStyle(color: ColorUtils.WASA_TEXT_COLOR),
        ),
        centerTitle: isCenterTitle,
        backgroundColor: ColorUtils.WASA_BACKGROUND,
        elevation: 2.0,
        leading:
            showLeadingBackButton ? _customBackButton() : SizedBox.shrink(),
        actions: actions);
  }

  Widget _customBackButton() {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.undo, color: ColorUtils.WASA_TEXT_COLOR, size: 25.0),
          onPressed: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}
