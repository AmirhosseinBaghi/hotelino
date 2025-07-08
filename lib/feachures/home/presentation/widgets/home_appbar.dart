import 'package:flutter/material.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/feachures/home/presentation/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                      )),
                  Consumer<ProfileProvider>(
                    builder: (context, profileProvider, child) {
                      return profileProvider.profile?.notifications != null &&
                              profileProvider.profile!.notifications > 0
                          ? Positioned(
                              right: 12,
                              top: 14,
                              child: Badge(
                                smallSize: 8,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            )
                          : SizedBox();
                    },
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                  icon: Icon(
                    themeProvider.brightness == Brightness.light
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    color: Colors.grey,
                  ))
            ],
          ),
          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
            return Row(
              children: [
                Text(
                  profileProvider.profile?.name ?? "کاربر",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    profileProvider.profile?.avatarUrl ??
                        "https://www.w3schools.com/howto/img_avatar.png",
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
