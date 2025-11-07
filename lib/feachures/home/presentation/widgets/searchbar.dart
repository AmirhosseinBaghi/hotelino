import 'package:flutter/material.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.tune_rounded,
                  color: Theme.of(context).colorScheme.outline,
                )),
            SizedBox(
              height: 24,
              child: VerticalDivider(
                color: Theme.of(context).colorScheme.outline,
                thickness: 1,
                width: 20,
              ),
            ),
            Expanded(
                child: TextField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                  filled: false,
                  hintText: "جستوجو در بین هتل ها",
                  hintTextDirection: TextDirection.rtl,
                  // border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12)),
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  color: Theme.of(context).colorScheme.outline,
                ))
          ],
        ),
      ),
    );
  }
}
