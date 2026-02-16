import 'package:flutter/material.dart';
import 'package:news_app/src/common/theme/theme_extension.dart';

class HomePageFooter extends StatelessWidget {
  const HomePageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: context.theme.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Row(
                      children: [
                        // Image.network(
                        //   '${data?.image?.url}',
                        //   fit: BoxFit.cover,
                        // ),
                        // SizedBox(width: 10,),
                        // Text(
                        //   'UzReport.uz',
                        //   style: TextStyle(
                        //     color: Colors.white
                        //   ),
                        //   )
                      ],
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 80,
                width: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Copyright © 1999 – 2022, Новости Узбекистана – UzReport.news',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Свидетельство о регистрации № 0605, выдано 14.12.2009 г.',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Приложение разработал @M26_Tash',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
              // Container(
              //   height: 20,
              //   w
              //   child: Text(
              //     'Все права защищены на правах UzReport.uz',
              //     style: TextStyle(
              //           color: Colors.white
              //         ),
              //     ),
              // ),
              // Container(
              //   height: 20,
              //   child: Text(
              //     'App Developed By @M26_Tash',
              //     style: TextStyle(
              //           color: Colors.white
              //         ),
              //     ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
