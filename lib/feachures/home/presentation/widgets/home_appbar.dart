import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.grey,
                      ))
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(
                "کاربر",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://www.w3schools.com/howto/img_avatar.png"),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
