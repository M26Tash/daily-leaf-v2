import 'package:flutter/material.dart';
import 'package:news_app/domain/provider/local_provider/local_provider.dart';
import 'package:news_app/domain/provider/news_provider.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/ui/components/home_page_all_news/home_page_all_news.dart';
import 'package:news_app/ui/components/home_page_footer/home_page_footer.dart';
import 'package:news_app/ui/components/home_page_slider/home_page_slider.dart';
import 'package:news_app/ui/components/loadings_widgets/loadings_widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewsProvider>(context);
    // print(model.data?.items[0].title);

    return Scaffold(
      drawer: const HomePageDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff003366),
        toolbarHeight: 64,
        surfaceTintColor: const Color(0xff003366),
        // title: model.data?.title == null
        //     ? LoadingsWidgets.appBarTitleLoad
        //     : Text(
        //         model.data?.title ?? S.of(context).title,
        //         style: const TextStyle(fontSize: 24, color: Colors.white),
        //       ),
        // leading: FutureBuilder(
        //   future: ,
        //   builder: (context, snapshot) => IconButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       color: Colors.white,
        //       icon: const Icon(Icons.menu)),
        // ),
        centerTitle: true,
      ),
      body: const HomePageContent(),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 24),
      children: <Widget>[
        const HomePageSlider(),
        const SizedBox(
          height: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                S.current.bodytitile,
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff323232),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const HomePageAllNews(),
            const HomePageFooter()
          ],
        )
      ],
    );
  }
}

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewsProvider>(context);
    final localModel = Provider.of<LocalProvider>(context);
    return Drawer(
      backgroundColor: const Color(0xff003366),
      width: 80,
      child: SafeArea(
        child: Column(
          children: [
            DrawerBtn(
              btnAction: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setString('lang', 'ru');
                model.setUp();
                localModel.setLocale().then(
                  (value) => Navigator.of(context).pop(),);
                
              },
            ),
            const SizedBox(
              height: 12,
            ),
            DrawerBtn(
              btnAction: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setString('lang', 'en');
            
                model.setUp();
                localModel.setLocale().then(
                  (value) => Navigator.of(context).pop());
                
              },
              btnLangCode: 'en',
            ),
            const SizedBox(
              height: 12,
            ),
            DrawerBtn(
              btnAction: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setString('lang', 'uz');
                model.setUp();
                localModel.setLocale().then(
                  (value) => Navigator.of(context).pop());
              },
              btnLangCode: 'uz',
            ),
            const Spacer(),
            FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(
                Icons.exit_to_app,
                color: Color(0xff003366),
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}

class DrawerBtn extends StatelessWidget {
  final String btnLangCode;
  final Function btnAction;
  const DrawerBtn({
    super.key,
    this.btnLangCode = 'ru',
    required this.btnAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => btnAction(),
      child: Text(
        btnLangCode.toUpperCase(),
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
