import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:urban_culture/config/colors.dart';
import 'package:urban_culture/controller/product_controller.dart';
import 'package:urban_culture/firebase_options.dart';
import 'package:urban_culture/sreens/frame1.dart';
import 'package:urban_culture/sreens/frame2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductController()),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ValueNotifier<int> _selectedIndexNotifier;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedIndexNotifier = ValueNotifier<int>(0);
    _pageController = PageController(initialPage: _selectedIndexNotifier.value);
  }

  @override
  void dispose() {
    _selectedIndexNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Screen1(),
    Screen2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _selectedIndexNotifier.value = index;
            },
            children: _widgetOptions,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(height: 1, color: kbottomnavbarBorder),
                Container(
                  height: MediaQuery.of(context).size.height * .1,
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ValueListenableBuilder<int>(
                    valueListenable: _selectedIndexNotifier,
                    builder: (context, selectedIndex, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Spacer(),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                _pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              },
                              icon: SvgPicture.asset("assets/images/search.svg",
                                  color: selectedIndex == 0
                                      ? kiconcolor
                                      : Colors.grey),
                            ),
                            Text(
                              "Routine",
                              style: TextStyle(
                                  fontFamily: 'Epilogue',
                                  fontSize: 12,
                                  color: selectedIndex == 0
                                      ? kiconcolor
                                      : Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                _pageController.animateToPage(1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              },
                              icon: SvgPicture.asset(
                                  "assets/images/streaks.svg",
                                  color: selectedIndex == 1
                                      ? kiconcolor
                                      : Colors.grey),
                            ),
                            Text(
                              "Streaks",
                              style: TextStyle(
                                  fontFamily: 'Epilogue',
                                  fontSize: 12,
                                  color: selectedIndex == 1
                                      ? kiconcolor
                                      : Colors.grey),
                            )
                          ],
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
