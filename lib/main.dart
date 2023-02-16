import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morphing_text/morphing_text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 900),
        builder: (BuildContext context, Widget? child) => const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: '안녕하세요! 신입 모바일 개발자 멍청이입니다',
              home: Scaffold(
                body: SidebarPage(),
              ),
            ));
  }
}

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;
  // ignore: prefer_final_fields
  AssetImage _avatarImg = const AssetImage('images/profile.png');
  int index = 1;
  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home,
        onPressed: () => setState(() {
          index = 1;
        }),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'About',
        icon: Icons.person_outline,
        onPressed: () => setState(() {
          index = 2;
        }),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        avatarImg: _avatarImg,
        title: 'Cho Yong Je',
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('안녕하세요! 신입 모바일 개발자 조용제입니다')));
        },
        body: Stack(
          children: [
            AnimatedOpacity(
              opacity: index == 1 ? 1 : 0,
              duration: const Duration(milliseconds: 700),
              child: _homebody(size, context),
            ),
            AnimatedOpacity(
              opacity: index == 2 ? 1 : 0,
              duration: const Duration(milliseconds: 700),
              child: _aboutbody(size, context),
            )
          ],
        ),
        backgroundColor: Colors.black,
        selectedTextColor: Colors.limeAccent,
        textStyle: const TextStyle(fontSize: 15),
        titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        toggleTitleStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _homebody(Size size, BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/coding.jpg'), // 배경 이미지
            ),
          ),
        ),
        Positioned.fill(
            child: Opacity(
          opacity: 0.6,
          child: Container(
            color: const Color(0xFF000000),
          ),
        )),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 105.w, top: 315.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "CHO YONG JE",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 85.w),
              child: SizedBox(
                width: 250.0.w,
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 7.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText('I Enjoy Coding',
                          speed: const Duration(milliseconds: 150)),
                      TypewriterAnimatedText("I'm Mobile Developer",
                          speed: const Duration(milliseconds: 150)),
                      TypewriterAnimatedText("I Love Developing",
                          speed: const Duration(milliseconds: 150)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _aboutbody(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: Text(
          _headline,
          style: Theme.of(context).textTheme.headline2,
          overflow: TextOverflow.visible,
          softWrap: false,
        ),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: Text(
          _headline,
          style: Theme.of(context).textTheme.headline2,
          overflow: TextOverflow.visible,
          softWrap: false,
        ),
      ),
    );
  }
}
