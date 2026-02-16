import 'package:flutter/material.dart';
import 'package:news_app/src/common/localization/localization_extensions.dart';
import 'package:news_app/src/core/models/article_model/article_model.dart';
import 'package:news_app/src/common/shared_providers/locale_provider/locale_provider.dart';
import 'package:news_app/src/features/home_page/provider/home_provider.dart';
import 'package:news_app/src/features/home_page/widgets/home_page_all_news/home_page_all_news.dart';
import 'package:news_app/src/features/home_page/widgets/home_page_footer/home_page_footer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeProvider>();

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.hasError) {
      return Center(child: Text(state.errorMessage!));
    }

    return Scaffold(
      drawer: const HomePageDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff003366),
        toolbarHeight: 64,
        surfaceTintColor: const Color(0xff003366),
        title: Text(
          'News App',
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
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
      body: HomePageContent(articles: state.articles),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final List<ArticleModel> articles;
  const HomePageContent({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 24),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                context.locale.allNews,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff323232),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            HomePageAllNews(articles: articles),
            const HomePageFooter(),
          ],
        ),
      ],
    );
  }
}

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final localModel = Provider.of<LocaleProvider>(context);
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
                localModel.setLocale().then(
                  (value) => Navigator.of(context).pop(),
                );
              },
            ),
            const SizedBox(height: 12),
            DrawerBtn(
              btnAction: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setString('lang', 'en');

                localModel.setLocale().then(
                  (value) => Navigator.of(context).pop(),
                );
              },
              btnLangCode: 'en',
            ),
            const SizedBox(height: 12),
            DrawerBtn(
              btnAction: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setString('lang', 'tr');
                localModel.setLocale().then(
                  (value) => Navigator.of(context).pop(),
                );
              },
              btnLangCode: 'tr',
            ),
            const Spacer(),
            FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(Icons.exit_to_app, color: Color(0xff003366)),
            ),
            const SizedBox(height: 12),
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
