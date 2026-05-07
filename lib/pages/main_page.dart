import 'package:flutter/material.dart';
import 'package:skyair/components/background_gradient_decoration.dart';
import 'package:skyair/components/navbar_button.dart';
import 'package:skyair/views/historical_data_view.dart';
import 'package:skyair/views/live_data_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const defaultButtonStyle = NavbarButtonStyle(
    backgroundColor: Color(0x00000000),
    foregroundColor: Color(0xFFAB0097),
  );
  static const activeButtonStyle = NavbarButtonStyle(
    backgroundColor: Color(0xFFF5B8E5),
    foregroundColor: Color(0xFFFFFFFF),
  );

  final List<Widget> _views = [LiveDataView(), HistoricalDataView()];
  int _currentViewIndex = 0;

  NavbarButtonStyle _getButtonStyle(int viewIndex) =>
      _currentViewIndex == viewIndex ? activeButtonStyle : defaultButtonStyle;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        decoration: BackgroundGradientDecoration(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: Column(
              children: [
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => SlideTransition(
                      position: Tween(
                        begin: Offset(-2.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(opacity: animation, child: child),
                    ),
                    child: _views[_currentViewIndex],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF4FE),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: mq.size.width * 0.1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: mq.size.width * 0.2,
                      children: [
                        NavbarButton(
                          style: _getButtonStyle(0),
                          imageSource: 'assets/live_data_button_icon.svg',
                          onPressed: () {
                            setState(() {
                              _currentViewIndex = 0;
                            });
                          },
                        ),
                        NavbarButton(
                          style: _getButtonStyle(1),
                          imageSource: 'assets/historical_data_button_icon.svg',
                          onPressed: () {
                            setState(() {
                              _currentViewIndex = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
