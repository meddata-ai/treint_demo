import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:treint/app/style/app_colors.dart';
import 'package:treint/app/style/app_text_styles.dart';

class DiseaseDetailView extends StatelessWidget {
  const DiseaseDetailView({super.key, required this.disease});

  final Map<String, dynamic> disease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          "About",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 100.h,
          width: 90.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        disease['Disease'],
                        style: AppTextStyle.bold20(context),
                      ),
                      Text(
                        disease['Definition'],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recommendations",
                        style: AppTextStyle.bold20(context),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(disease['Reccomendations']),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Analysis',
                        style: AppTextStyle.bold20(context),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                          'List of analysis needed for a doctor to make a treatment plan'),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 16.0,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                  width: 1, color: AppColors.grayStroke),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24.0),
                            child: Row(
                              children: [
                                Text(
                                  (index + 1).toString(),
                                  style: AppTextStyle.bold20(context)!.copyWith(
                                    color: AppColors.blue,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  child: Text(
                                    ' ${disease['Analysis'].split('\n')[index]}',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.semiBold16(context),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: disease['Analysis'].split('\n').length,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
