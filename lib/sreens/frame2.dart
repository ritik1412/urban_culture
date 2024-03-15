import 'package:flutter/material.dart';
import 'package:urban_culture/config/colors.dart';
import 'package:urban_culture/utils/appbar.dart';
import 'package:urban_culture/utils/graph.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgrondcolor,
      appBar: const MyAppBar(title: "Streaks"),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .025,
            ),
            const Text(
              "Today's Goal: 3 streak days",
              style: TextStyle(
                fontFamily: 'Epilogue',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: height * .15,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: kcardcolor,
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Streak Days",
                      style: TextStyle(
                        fontFamily: 'Epilogue',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "2",
                      style: TextStyle(
                        fontFamily: 'Epilogue',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Daily Streak",
              style: TextStyle(
                fontFamily: 'Epilogue',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "2",
              style: TextStyle(
                fontFamily: 'Epilogue',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Row(
              children: [
                Text(
                  "Last 30 Days",
                  style: TextStyle(
                    fontFamily: 'Epilogue',
                    fontSize: 16,
                    color: ktext,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "+100%",
                  style: TextStyle(
                    fontFamily: 'Epilogue',
                    fontSize: 16,
                    color: kgreen,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),

            // Graph
            const IgnorePointer(child: LineChartSample2()),

            const Text(
              "Keep it up! You're on a roll.",
              style: TextStyle(
                fontFamily: 'Epilogue',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kcardcolor),
              child: const Center(
                child: Text(
                  "Get started",
                  style: TextStyle(
                    fontFamily: 'Epilogue',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
