import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:treint/app/pages/disease_detail_view.dart';
import 'package:treint/app/pages/intro_view/intro_view.dart';
import 'package:treint/app/style/app_colors.dart';
import 'package:treint/app/style/app_text_styles.dart';
import 'package:treint/app/widgets/custom_text_field.dart';

import 'app/style/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme(context: context).ligitTheme,
          debugShowCheckedModeBanner: false,
          home: const IntroView(),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> json = [];
  List<String> symptomsJson = [];
  String search = '';
  final List<String> searchList = [];
  final List<dynamic> filteredJson = [];
  final ExpandableController expandableController = ExpandableController();
  final TextEditingController searchInputContoller = TextEditingController();
  late TextEditingController autoCompleteController;
  int bottomNavIndex = 1;
  readJsonFile(String filePath) async {
    var input = await rootBundle.loadString('assets/diseases.json');
    var symptomsInput =
        await rootBundle.loadString('assets/symptoms_final.json');
    setState(() {
      json = jsonDecode(input);
      symptomsJson = jsonDecode(symptomsInput).cast<String>();
    });
  }

  @override
  void initState() {
    readJsonFile('assets/sample1.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100.h, maxWidth: 90.w),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              children: [
                Autocomplete<String>(
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return symptomsJson.where(
                      (element) {
                        return element
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      },
                    );
                  },
                  onSelected: (option) {
                    searchList.add(option);
                    filteredJson.clear();
                    for (final element in json) {
                      int temp = 0;
                      for (final searchFilter in searchList) {
                        if (element["Sympotms"].contains(searchFilter)) {
                          temp++;
                        }
                      }
                      if (temp == searchList.length) {
                        filteredJson.add(element);
                      }
                    }
                    setState(
                      () {
                        (searchList.isNotEmpty &&
                                !expandableController.expanded)
                            ? expandableController.toggle()
                            : null;
                        searchInputContoller.clear();
                        search = '';
                      },
                    );
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    autoCompleteController = fieldTextEditingController;
                    autoCompleteController.clear();
                    return CustomTextFieldWidget(
                      borderRadius: BorderRadius.circular(16),
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      withBorder: true,
                      hintText: "What's bothering you?",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      headerText: 'Write your symptoms here',
                    );
                  },
                ),
                ExpandablePanel(
                  controller: expandableController,
                  collapsed: const SizedBox(height: 32),
                  expanded: Column(
                    children: [
                      Container(
                        height: 5.h,
                        width: 100.w,
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: searchList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: AppColors.grayStroke, width: 2)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(searchList[index]),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    alignment: Alignment.center,
                                    onPressed: () {
                                      setState(
                                        () {
                                          searchList.removeAt(index);
                                          filteredJson.clear();
                                          for (final element in json) {
                                            int temp = 0;
                                            for (final searchFilter
                                                in searchList) {
                                              if (element["Sympotms"]
                                                  .contains(searchFilter)) {
                                                temp++;
                                              }
                                              if (temp == searchList.length) {
                                                filteredJson.add(element);
                                              }
                                            }
                                          }
                                          searchList.isEmpty
                                              ? expandableController.toggle()
                                              : null;
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.cancel_outlined,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(24.0)),
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Probable cause',
                                style: AppTextStyle.bold20(context),
                              ),
                            ),
                            Text(
                              'Please select a disease most suitble for you',
                              style: AppTextStyle.medium14(context),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: searchList.isNotEmpty && filteredJson.isEmpty
                        ? Center(
                            child: Text(
                              'Nothing found',
                              style: AppTextStyle.bold32(context),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DiseaseDetailView(
                                          disease: (filteredJson.isEmpty &&
                                                  searchList.isEmpty)
                                              ? json[index]
                                              : filteredJson[index])));
                                },
                                child: Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (filteredJson.isEmpty &&
                                                searchList.isEmpty)
                                            ? json[index]['Disease']
                                            : filteredJson[index]['Disease'],
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.bold18(context),
                                      ),
                                      const SizedBox(
                                        height: 24.0,
                                      ),
                                      Text(
                                        (filteredJson.isEmpty &&
                                                searchList.isEmpty)
                                            ? json[index]['Definition']
                                            : filteredJson[index]['Definition'],
                                        style: AppTextStyle.regular14(context),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Column(
                                children: const [
                                  Divider(
                                    thickness: 1,
                                    color: AppColors.gray,
                                    indent: 16.0,
                                  ),
                                ],
                              );
                            },
                            itemCount:
                                (filteredJson.isEmpty && searchList.isEmpty)
                                    ? json.length
                                    : filteredJson.length,
                          ),
                  ),
                ),
                // TextButton(
                //     onPressed: () async {
                //       List<dynamic> symptoms = [];
                //       for (final element in json) {
                //         for (final symptom in element['Sympotms']) {
                //           if (!symptoms.contains(symptom)) {
                //             symptoms.add(symptom);
                //           }
                //         }
                //       }
                //       File file = await File('../symptoms.json').create();
                //       file.writeAsStringSync(symptoms.toString());
                //       print(symptoms);
                //     },
                //     child: Text(
                //       "PRESS ME",
                //       style: AppTextStyle.bold18(context),
                //     )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(18.sp),
              topLeft: Radius.circular(18.sp)),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grayStroke,
              spreadRadius: 1,
              blurRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0.sp),
            topRight: Radius.circular(18.0.sp),
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            elevation: 0.0,
            items: [
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Coming soon',
                  showDuration: const Duration(seconds: 2),
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  child: SvgPicture.asset(
                    'assets/icons/tracker.svg',
                    width: 32.sp,
                    height: 32.sp,
                  ),
                ),
                activeIcon: Tooltip(
                  message: 'Coming soon',
                  showDuration: const Duration(seconds: 2),
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  child: SvgPicture.asset(
                    'assets/icons/tracker_active.svg',
                    width: 32.sp,
                    height: 32.sp,
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 32.sp,
                  height: 32.sp,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/search_active.svg',
                  width: 32.sp,
                  height: 32.sp,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Coming soon',
                  showDuration: const Duration(seconds: 2),
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  child: SvgPicture.asset(
                    'assets/icons/doctors.svg',
                    width: 32.sp,
                    height: 32.sp,
                  ),
                ),
                activeIcon: Tooltip(
                  message: 'Coming soon',
                  showDuration: const Duration(seconds: 2),
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  child: SvgPicture.asset(
                    'assets/icons/doctors_active.svg',
                    width: 32.sp,
                    height: 32.sp,
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Coming soon',
                  showDuration: const Duration(seconds: 2),
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    width: 32.sp,
                    height: 32.sp,
                  ),
                ),
                activeIcon: Tooltip(
                  message: 'Coming soon',
                  showDuration: const Duration(seconds: 2),
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  child: SvgPicture.asset(
                    'assets/icons/profile_active.svg',
                    width: 32.sp,
                    height: 32.sp,
                  ),
                ),
                label: "",
              ),
            ],
            currentIndex: bottomNavIndex,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
