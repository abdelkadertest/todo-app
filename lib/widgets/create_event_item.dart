import 'package:flutter/material.dart';

class CreateEventItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isSelected;

  const CreateEventItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          )),
      child: Row(
        children: [
          Icon(icon,
              color: isSelected
                  ? Theme.of(context).textTheme.bodySmall!.color
                  : Theme.of(context).textTheme.bodyMedium!.color),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: isSelected
                ? Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16)
                : Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
