import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
    this.leading,
    required this.title,
    this.onTap,
  });

  final Widget? leading;
  final Widget title;
  final VoidCallback? onTap;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 40.w,
              child: widget.leading ?? Container(),
            ),
            Gap(8.w),
            Expanded(
              child: widget.title,
            )
          ],
        ),
      ),
    );
  }
}
