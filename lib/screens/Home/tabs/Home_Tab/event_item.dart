import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/event_model.dart';
import 'package:todo/screens/Home/update_event.dart';

class EventItem extends StatelessWidget {
  final EventModel model;

  const EventItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).primaryColor
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/${model.category}.png",
                  fit: BoxFit.fill,
                  height: 230.h,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                      model.title.tr(),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            FirebaseManager.deleteEvent(model.id);
                          },
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              UpdateEvent.routeName,
                              arguments: model,
                            );
                          },
                          child: Icon(
                            Icons.edit,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        GestureDetector(
                          onTap: (){},
                          child: Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            // width: 43.w,
            // height: 49.h,
            child: Column(
              children: [
                Text(
                  convertMillisecondsToDate(model.date)
                      .split(",")[0]
                      .substring(8, 10),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  convertMillisecondsToDate(model.date).split(",")[2].trim(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String convertMillisecondsToDate(int milliseconds) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    DateFormat formatter = DateFormat("yyyy-MM-dd, EEE, MMM");
    String formatedData = formatter.format(dateTime);
    return formatedData;
  }
}
