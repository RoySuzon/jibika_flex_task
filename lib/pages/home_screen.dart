import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jibika_flex_task/components/dimention_extention.dart';
import 'package:jibika_flex_task/pages/widgets/custom_button.dart';
import 'package:jibika_flex_task/pages/widgets/custom_card.dart';
import 'package:jibika_flex_task/pages/widgets/custom_icon_buttion.dart';
import 'package:jibika_flex_task/pages/widgets/custom_rich_text.dart';
import 'package:jibika_flex_task/pages/widgets/custome_barchat.dart';
import 'package:jibika_flex_task/pages/widgets/pie_chart_sample2.dart';
import 'package:jibika_flex_task/resources/color_pallet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime initialDate = DateTime.now();
  int selectIcon = 0;
  final List<Map<String, dynamic>> customRowData = [
    {"title": 'Present', "count": 1206, "color": Colors.lightGreen.shade700},
    {"title": 'Absents', "count": 22, "color": Colors.redAccent},
    {"title": 'Leave', "count": 200, "color": Colors.yellowAccent.shade700},
    {"title": 'Holiday', "count": 200, "color": Colors.teal.shade700},
  ];

  final List<Map<String, dynamic>> iconDataWithTitleList = [
    {"icon": Icons.home, "title": "Home", "badgeCount": 1},
    {"icon": Icons.search, "title": "Search", "badgeCount": 3},
    {"icon": Icons.notifications, "title": "Notifications", "badgeCount": 5},
    {"icon": Icons.settings, "title": "Settings", "badgeCount": 0},
  ];
  String setDate = "Select Date";
  String setDate2 = "Select Date";
  Future<String> showCustomDatePicker() async {
    String setDate = "";
    final selectedDate = await showDatePicker(
        // currentDate:DateTime.now(),
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        barrierColor: Colors.white.withOpacity(.5));
    if (selectedDate != null) {
      setDate = DateFormat("dd MMM y").format(selectedDate);
      initialDate = selectedDate;
      setState(() {});

      debugPrint('Selected Date: $setDate');

      // Do something with the selected date
    }

    return setDate;
    // return date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JIBIKA PLEXUS"),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.width(16)),
          child: Column(
            children: [
              CustomCard(
                  pTop: 5,
                  pBottom: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      iconDataWithTitleList.length,
                      (index) => Expanded(
                        child: Column(
                          children: [
                            CustomIconButtonWithBadge(
                              icon: iconDataWithTitleList[index]["icon"],
                              badgeCount: iconDataWithTitleList[index]["badgeCount"],
                              onPressed: () {
                                selectIcon = index;
                                setState(() {});
                              },
                              title: iconDataWithTitleList[index]["title"],
                            ),
                            Center(
                              child: Container(
                                // width: 100,
                                height: selectIcon == index ? 2 : .5,
                                color: selectIcon == index ? Colors.grey : Colors.grey.shade300,
                              ),
                            ),
                            SizedBox(
                              height: context.width(5),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: context.width(20)),
              CustomCard(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomePieChart(
                          dataList: customRowData,
                        ),
                        Container(height: context.height(10)),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(text: " Active Manpower", style: TextStyle(color: Colors.black)),
                          TextSpan(text: " 1338", style: TextStyle(color: Colors.red)),
                        ]))
                      ],
                    ),
                  ),
                  // const Spacer(),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(context.width(8))),
                      padding: EdgeInsets.all(context.width(5)),
                      width: context.width(180),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () async {
                                setDate = await showCustomDatePicker();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    setDate,
                                    style:
                                        TextStyle(color: Colors.black, fontSize: context.width(14)),
                                  ),
                                  SizedBox(width: context.width(5)),
                                  const Icon(Icons.calendar_month)
                                ],
                              ),
                            ),
                          ),
                          // _customeRow(context,
                          //     title: 'Present', count: '11223', color: Colors.lightGreen),
                          // _customeRow(context,
                          //     title: 'Absents', count: '22', color: Colors.redAccent),
                          // _customeRow(context,
                          //     title: 'Leave', count: '1102', color: Colors.yellowAccent.shade700),
                          // _customeRow(context,
                          //     title: 'Holiday', count: '22', color: Colors.teal.shade700),

                          Padding(
                            padding: EdgeInsets.all(context.width(8)),
                            child: Column(
                              children: List.generate(
                                  customRowData.length,
                                  (index) => _customeRow(context,
                                      title: customRowData[index]['title'],
                                      count: customRowData[index]['count'].toString(),
                                      color: customRowData[index]['color'])),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(height: context.width(16)),
              CustomCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: context.width(70),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CustomButton(
                              title: 'Payable',
                              secondText: '89',
                              thirdText: 'monoower',
                              // onPressed: () {},
                            ),
                            const VerticalDivider(
                              color: AppColors.pageBackground,
                            ),
                            const CustomButton(
                              title: 'Daily',
                              secondText: '15000',
                              thirdText: 'Salary BDT',
                              // onPressed: () {},
                            ),
                            const VerticalDivider(
                              color: AppColors.pageBackground,
                            ),
                            const CustomButton(
                              title: 'Cumulative',
                              secondText: '25000',
                              thirdText: 'Salary BDT',
                              // onPressed: () {},
                            ),
                            const VerticalDivider(
                              color: AppColors.pageBackground,
                            ),
                            CustomButton(
                              onPressed: () async {
                                setDate2 = await showCustomDatePicker();
                              },
                              title: setDate2,
                              child: const Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        height: context.width(160),
                        width: double.infinity,
                        child: BarChartSample2())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _customeRow(BuildContext context,
      {required String title, required String count, required Color color}) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: CustomRichText(
              text: title,
              preTextColor: color,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.width(5)),
            child: Container(
              height: context.height(14),
              width: context.width(2),
              color: Colors.grey.shade400,
            ),
          ),
          Center(
            child: Container(
              width: 2,
              color: color,
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomeRichTextOnly(
              text: count,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
