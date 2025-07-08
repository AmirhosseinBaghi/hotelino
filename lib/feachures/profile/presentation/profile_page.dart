import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotelino/feachures/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/feachures/profile/presentation/widgets/profile_option_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  void _showSnakbar(BuildContext context, String massege) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        content: Text(
          massege,
          textDirection: TextDirection.rtl,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        final profile = profileProvider.profile;

        if (profile == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : NetworkImage(profile.avatarUrl) as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _getImage,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryFixed,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  profile.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  profile.email,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileOptionItem(
                  title: "اطلاعات صفحه کاربری",
                  icons: Icons.person_outline,
                  onTap: () => _showSnakbar(context, "اطلاعات صفحه کاربری"),
                ),
                ProfileOptionItem(
                  title: "اعلان ها",
                  icons: Icons.notifications_rounded,
                  onTap: () => _showSnakbar(context, "لیست اعلان ها"),
                ),
                ProfileOptionItem(
                  title: "لیست مورد علاقه ها",
                  icons: Icons.favorite_outlined,
                  onTap: () => _showSnakbar(context, "لیست مورد علاقه ها"),
                ),
                ProfileOptionItem(
                  title: "فراموشی رمز عبور",
                  icons: Icons.key_outlined,
                  onTap: () => _showSnakbar(context, "فراموشی رمز عبور"),
                ),
                ProfileOptionItem(
                  title: "روش های پرداخت",
                  icons: Icons.credit_card_outlined,
                  onTap: () => _showSnakbar(context, "روش های پرداخت"),
                ),
                ProfileOptionItem(
                  title: "تنظیمات",
                  icons: Icons.settings,
                  onTap: () => _showSnakbar(context, "تنظیمات"),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
