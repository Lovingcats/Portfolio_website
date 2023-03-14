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
              title: '안녕하세요! 신입 모바일 개발자 조용제입니다',
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
            ),
          ],
        ),
        backgroundColor: Colors.black,
        selectedTextColor: Colors.limeAccent,
        textStyle: TextStyle(fontSize: 4.sp),
        titleStyle: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
        toggleTitleStyle:
            TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 60.w, top: 140.h),
              child: Container(
                height: 520.h,
                width: 90.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.8.w,
                    color: const Color(0xff51BFF0),
                  ),
                ),
                child: Image.asset(
                  "images/profile.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text(
                  "About ",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "About ",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: ),
                ),
                  ],
                ),
                
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  "Mobile Developer",
                  style: TextStyle(
                      fontSize: 7.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "\n안녕하세요! Flutter를 배우고 있는 신입 개발자 조용제입니다.\n\nFlutter를 선택한 이유는 뛰어난 크로스 플랫폼 개발 능력과 빠른 개발 속도 때문입니다. ",
                  style: TextStyle(
                      fontSize: 4.5.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  "Flutter를 배우며 앱 개발에 대한 열정과 자신감을 가지게 되었습니다.\n새로운 기술을 배우는 것을 즐기는 개발자가 되고 싶습니다.",
                  style: TextStyle(
                      fontSize: 4.5.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10.w,
                      height: 40.h,
                      child: Image.asset(
                        "images/instagram.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    SizedBox(
                      width: 10.w,
                      height: 40.h,
                      child: Image.asset(
                        "images/facebook.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    SizedBox(
                      width: 10.w,
                      height: 40.h,
                      child: Image.asset(
                        "images/github.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    SizedBox(
                      width: 10.w,
                      height: 40.h,
                      child: Image.asset(
                        "images/discord.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ],
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
