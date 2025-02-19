import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_maneger.dart';

import 'Home_Tab/event_item.dart';

class LoveTap extends StatelessWidget {
  static const String routeName = "love-tap";

  const LoveTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'favorite_events'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseManager.getFavoriteEvent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "something_went_wrong".tr(),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) {
                      return EventItem(
                        model: snapshot.data!.docs[index].data(),
                      );
                    },
                    itemCount: snapshot.data?.docs.length ?? 0,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
