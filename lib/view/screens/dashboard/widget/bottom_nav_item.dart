import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final IconData iconData;
  final String? title;
  final Function? onTap;
  final bool isSelected;
  const BottomNavItem({Key? key, required this.iconData, this.onTap, this.isSelected = false, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            IconButton(
              icon: Icon(iconData,color: isSelected ? Theme.of(context).primaryColor : Colors.grey, size: 25),
              onPressed: onTap as void Function()?,
            ),
            Text(title ?? "", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: isSelected ? Theme.of(context).primaryColor : Colors.grey))
          ],
        ),
      ),
    );
  }
}
