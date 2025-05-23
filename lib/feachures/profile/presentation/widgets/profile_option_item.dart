import 'package:flutter/material.dart';
import 'package:hotelino/core/constant/constant.dart';

class ProfileOptionItem extends StatelessWidget {
  final String title;
  final IconData icons;
  final VoidCallback onTap;
  const ProfileOptionItem(
      {super.key,
      required this.title,
      required this.icons,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 14,
              ),
              Expanded(
                  child: Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              )),
              SizedBox(
                width: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff4eae2),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  icons,
                  size: 20,
                  color: Appcolors.darkFocusBorder,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
