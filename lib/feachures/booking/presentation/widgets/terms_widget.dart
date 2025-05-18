import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/keyboard.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({super.key});

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  bool isCheked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            _showTermsDialog(context);
          },
          child: RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey.shade600),
                  children: [
                    TextSpan(text: "قوانین برنامه"),
                    TextSpan(
                        text: " هتلینو ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary)),
                    TextSpan(text: "را خوانده و می‌پذیرم.")
                  ])),
        ),
        Checkbox(
          value: isCheked,
          onChanged: (value) {
            setState(() {
              isCheked = value ?? false;
            });
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          activeColor: Theme.of(context).colorScheme.primary,
        )
      ],
    );
  }

  void _showTermsDialog(BuildContext context) {
    unfocusEditors(context);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "قوانین برنامه هتلینو",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "این برنامه به شما این امکان را می‌دهد تا به راحتی هتل‌های مختلف را در کشورهای گوناگون جستجو کرده و رزرو کنید\n\n"
                "شما قادر خواهید بود پروفایل شخصی خود را ایجاد کنید و هتل‌هایی که به نیازهای شما نزدیک‌تر هستند را پیدا کنید. توجه داشته باشید که هتل‌های رزرو شده قابل لغو نبوده و پس از انجام رزرو، تغییرات در این زمینه امکان‌پذیر نمی‌باشد\n\n"
                "قیمت‌های هتل‌ها به صورت مقطوع اعلام شده‌اند و هیچ‌گونه تغییر قیمتی پس از رزرو نخواهید داشت. همچنین، اطلاعات هتل‌ها به دقت بررسی و به روزرسانی می‌شوند تا شما تجربه‌ای رضایت‌بخش از اقامت خود داشته باشید",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
