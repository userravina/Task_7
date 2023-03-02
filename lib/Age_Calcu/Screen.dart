import 'package:flutter/material.dart';

class Age_calcu extends StatefulWidget {
  const Age_calcu({Key? key}) : super(key: key);

  @override
  State<Age_calcu> createState() => _Age_calcuState();
}

class _Age_calcuState extends State<Age_calcu> {
  TextEditingController dateController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  String BornDate = "";
  String BornMonth = "";
  String Bornyear = "";

  int currentDate = DateTime.now().day;
  int currentMonth = DateTime.now().month;
  int currentyear = DateTime.now().year;

  String Calcu_Day = "00";
  String Calcu_Month = "00";
  String Calcu_year = "00";

  String next_day = "00";
  String next_Month = "00";

  List<String> All_month = [
    "",
    "Jan",
    "Feb",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  List<int> mounth_Day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Age Calculate",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Color(0xff203A43),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Date",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Text(
                  "$currentDate${All_month[currentMonth]},$currentyear",
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Date Of Birth",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: dateController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "DD",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: monthController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "MM",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: yearController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "YYYY",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          dateController.clear();
                          monthController.clear();
                          yearController.clear();

                          Calcu_year = "00";
                          Calcu_Month = "00";
                          Calcu_year = "00";

                          next_day = "00";
                          next_Month = "00";
                        });
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          height: 60,
                          child: Text(
                            "Clear",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff3547A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        BornDate = dateController.text;
                        BornMonth = monthController.text;
                        Bornyear = yearController.text;

                        int T_Day = currentDate;
                        int T_Month = currentMonth;
                        int T_year = currentyear;

                        if (int.parse(BornDate) > currentDate) {
                          T_Month--;
                          T_Day += mounth_Day[int.parse(BornMonth) - 1];
                        }
                        if (int.parse(BornDate) > currentDate) {
                          T_year--;
                          T_Month += 12;
                        }
                        if (int.parse(BornDate) > currentDate) {
                          T_Month--;
                        }
                        setState(() {
                          Calcu_year =
                              (T_year - int.parse(Bornyear)).toString();
                          Calcu_Month =
                              (T_Month - int.parse(BornMonth)).toString();
                          Calcu_Day = (T_Day - int.parse(BornDate)).toString();

                          int T_Nextmonth = int.parse(next_Month);
                          if (currentMonth > int.parse(BornMonth)) {
                            T_Nextmonth = int.parse(BornMonth) - currentMonth;
                            T_Nextmonth = int.parse(next_Month);
                          } else {
                            next_Month = (int.parse(BornMonth) - currentMonth)
                                .toString();
                          }
                          int T_nextDay = mounth_Day[int.parse(BornMonth) - 1] -
                              int.parse(Calcu_Day);
                          next_Month =
                              (int.parse(BornMonth) - currentMonth).toString();
                          next_day = T_nextDay.toString();
                        });
                      },
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Colors.white,
                      child: Ink(
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff13547A),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Present Age",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.center,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff13547A),
                      Color(0xff203A43),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Calcu_year,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "year",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Calcu_Month,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "MM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Calcu_Day,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "DD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Next Birthday",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.center,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff6BBED9),
                      Color(0xff006ACB),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          next_Month,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "MM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          next_day,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "DD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
