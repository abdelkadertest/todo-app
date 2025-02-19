import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/userProvider.dart';
import 'package:todo/Providers/create_event_provider.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/event_model.dart';
import 'package:todo/screens/Home/tabs/Home_Tab/event_item.dart';

import 'category_list.dart';

class HomeTab extends StatelessWidget {
  static const String routeName = "home_tap";

  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CreateEventsProvider()),
        ChangeNotifierProvider(create: (context)=> UserProvider())
      ],
          builder: (context, child) {
            var provider = Provider.of<CreateEventsProvider>(context);
            var userProvider = Provider.of<UserProvider>(context);
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 174.h,
                leading: const SizedBox(),
                leadingWidth: 0,
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "welcome_back".tr(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              "${userProvider.userModel?.name}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "city_country".tr(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     const Icon(
                        //       Icons.sunny,
                        //       color: Colors.white,
                        //       size: 28,
                        //     ),
                        //     const SizedBox(
                        //       width: 8,
                        //     ),
                        //     Container(
                        //       padding: const EdgeInsets.all(8),
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(12),
                        //       ),
                        //       child: Text(
                        //         "ar".tr(),
                        //         style: Theme.of(context).textTheme.titleMedium,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 55,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 16,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              provider.changeCategory(index);
                            },
                            child: CategoryList(
                              category: provider.homeEventsCategory[index],
                              categoryIcon: provider.homeIcons[index],
                              isSelected: provider.selectedCategory == index,
                            ),
                            // child: Container(
                            //   padding: const EdgeInsets.all(14),
                            //   alignment: Alignment.center,
                            //   decoration: BoxDecoration(
                            //       color: provider.selectedCategory == index
                            //           ? Theme.of(context).cardColor
                            //           : Colors.transparent,
                            //       borderRadius: BorderRadius.circular(32),
                            //       border: Border.all(
                            //         color: provider.selectedCategory == index
                            //             ? Colors.transparent
                            //             : Colors.white,
                            //         width: 2,
                            //       )),
                            //   child: Row(
                            //     children: [
                            //       index == 0
                            //           ? const SizedBox(
                            //               width: 0,
                            //             )
                            //           : provider.homeIcons[index],
                            //       index == 0
                            //           ? const SizedBox()
                            //           : const SizedBox(
                            //               width: 16,
                            //             ),
                            //       Text(
                            //         provider.homeEventsCategory[index].tr(),
                            //         style: provider.selectedCategory == index
                            //             ? Theme.of(context)
                            //                 .textTheme
                            //                 .bodyMedium!
                            //                 .copyWith(fontSize: 16)
                            //             : Theme.of(context)
                            //                 .textTheme
                            //                 .bodySmall!
                            //                 .copyWith(fontSize: 16),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          );
                          //   child: CreateEventItem(
                          //     text: provider.eventsCategory[index].tr(),
                          //     isSelected: provider.selectedCategory == index
                          //         ? true
                          //         : false,
                          //     icon: provider.icons[index],
                          //   ),
                          // );
                        },
                        itemCount: provider.eventsCategory.length,
                      ),
                    ),
                  ],
                ),
              ),
              body: StreamBuilder<QuerySnapshot<EventModel>>(
                stream: FirebaseManager.getEvent(
                    provider.homeEventsCategory[provider.selectedCategory]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } if(snapshot.hasError){
                    return Center(
                      child: Text(
                        'something_went_wrong'.tr(),
                      ),
                    );
                  }
                   if (snapshot.hasData && snapshot.data!.docs.isNotEmpty){
                     print('-==================i have data');
                    return Padding(
                      padding:
                      const EdgeInsets.only(top: 16.0, left: 16, right: 16),
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
                  } else{
                     print('=========================no data');
                    return Center(
                      child: Text(
                       'There is no data',
                      ),
                    );
                  }
                },
              ),
            );
    });
  }
}
