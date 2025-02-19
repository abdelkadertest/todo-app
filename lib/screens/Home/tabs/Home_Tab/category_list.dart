import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
  final IconData categoryIcon;
  final String category;
  final bool isSelected;

  const CategoryList(
      {required this.category,
      required this.categoryIcon,
      required this.isSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).cardColor : Colors.transparent,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.white,
            width: 2,
          )),
      child: Row(
        children: [
          Icon(
            categoryIcon,
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          ),
          SizedBox(
            width: 16.w,
          ),
          // provider.homeIcons[index],
          Text(
            category.tr(),
            style: isSelected
                ? Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16)
                : Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
