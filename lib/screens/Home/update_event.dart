import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/create_event_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/event_model.dart';
import 'package:todo/screens/Home/home_screen.dart';
import 'package:todo/widgets/create_event_item.dart';

class UpdateEvent extends StatelessWidget {
  static const String routeName = "updateEvent";
  final TextEditingController titleController = TextEditingController();
  final TextEditingController decController = TextEditingController();

  UpdateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as EventModel;
    return ChangeNotifierProvider(
      create: (context) => CreateEventsProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventsProvider>(context);
        ThemeMode mode = ThemeMode.system;
        provider.changeThemeMode(mode);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'update_event'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/${arguments.category}.png",
                      height: 203.h,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
                          child: CreateEventItem(
                            text: provider.eventsCategory[index].tr(),
                            isSelected: provider.eventsCategory[index] ==
                                    arguments.category
                                ? true
                                : false,
                            icon: provider.icons[index],
                          ),
                        );
                      },
                      itemCount: provider.eventsCategory.length,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text("title".tr(),
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).canvasColor,
                        ),
                    controller: titleController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                      labelText: arguments.title.tr(),
                      labelStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Theme.of(context).canvasColor,
                              ),
                      prefixIcon: const Icon(Icons.edit_note),
                      prefixIconColor: Theme.of(context).canvasColor,
                      iconColor: Theme.of(context).focusColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text("description".tr(),
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    maxLines: 5,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).canvasColor,
                        ),
                    controller: decController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.h),
                      labelText: arguments.description.tr(),
                      labelStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Theme.of(context).canvasColor,
                              ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color:
                                Theme.of(context).textTheme.titleSmall!.color,
                          ),
                          const SizedBox(width: 16),
                          Text("event_date".tr(),
                              style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          var date = await showDatePicker(
                            initialDate: DateTime.now(),
                            context: context,
                            firstDate: DateTime.now().subtract(
                              const Duration(
                                days: 365,
                              ),
                            ),
                            lastDate: DateTime.now().add(
                              const Duration(
                                days: 365,
                              ),
                            ),
                          );
                          if (date != null) {
                            provider.changeDate(date);
                          }
                        },
                        child: Text(
                          arguments.date.toString().substring(0, 10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text("location".tr(),
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).focusColor,
                        ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                      labelText: "choose_event_location".tr(),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 16),
                      prefixIcon: const Icon(Icons.add_location_sharp),
                      prefixIconColor: Theme.of(context).primaryColor,
                      suffixIcon: const Icon(Icons.arrow_forward_ios),
                      suffixIconColor: Theme.of(context).primaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity.w,
                    child: ElevatedButton(
                      onPressed: () async {
                        // if (titleController.text.isEmpty ||
                        //     decController.text.isEmpty) {
                        //   print('Error: Title or description is empty');
                        //   return;
                        // }
                        // if (provider.selectedCategoryName == null ||
                        //     provider.selectedCategoryName.isEmpty) {
                        //   print('Error: Category is empty');
                        // }
                        // if (provider.selectedDate == null) {
                        //   print('Error: Date is null');
                        //   return;
                        // }
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                            });
                        await Future.delayed(const Duration(seconds: 2));
                        EventModel model = EventModel(
                            userId: FirebaseAuth.instance.currentUser!.uid,
                            title: titleController.text,
                            description: decController.text,
                            category: provider.selectedCategoryName,
                            date: provider.selectedDate.millisecondsSinceEpoch);
                        // print(arguments.id);
                        FirebaseManager.updateEvent(model, arguments.id)
                            .then((value) {
                          Navigator.pop(context, HomeScreen.routeName);
                          Navigator.pop(context, HomeScreen.routeName);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "update_event".tr(),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
