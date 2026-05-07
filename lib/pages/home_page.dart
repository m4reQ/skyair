import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: mq.size.height * 0.2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
                      SvgPicture.asset('assets/logo.svg'),
                      Text(
                        'Check your air',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'quality',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: mq.size.height * 0.04,
                    children: [
                      Text(
                        'SkyAir',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.pushNamed(context, '/main'),
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color(0xFF77B6CD),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Click here',
                              style: TextStyle(
                                fontFamily: 'Sansita Swashed',
                                color: const Color(0xFFFFFFFF),
                                fontSize: 24.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
