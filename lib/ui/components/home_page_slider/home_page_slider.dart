import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/provider/news_provider.dart';
import 'package:news_app/ui/components/loadings_widgets/loadings_widgets.dart';
import 'package:provider/provider.dart';

class HomePageSlider extends StatelessWidget {
  const HomePageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<NewsProvider>(context);
    // final data = model.data;

    // // return model.data!.items.isEmpty ? LoadingsWidgets.contentLoading
    // // print(data?.items[0].content?.images);
    // return model.data?.items == null ? LoadingsWidgets.contentLoading: CarouselSlider.builder(
    //   itemBuilder: (context, index, realIndex) => SliderItem(
    //     bgPass: model.data?.items[index].enclosure?.url,
    //     itemTitle: data?.items[index].title,
    //   ),
    //   itemCount: data?.items.length,
    //   options: CarouselOptions(
    //     height: 250,
    //     autoPlay: true,
    //     autoPlayInterval: const Duration(seconds: 8),
    //     autoPlayCurve: Curves.decelerate,
    //     enlargeCenterPage: true
    //   ),
    // );

    return Placeholder();
  }
}

class SliderItem extends StatelessWidget {
  final String? bgPass;
  final String? itemTitle;
  const SliderItem({
    super.key,
    this.bgPass,
    this.itemTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 320,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) =>
                  const Center(
                child: CircularProgressIndicator(),
              ),
              imageUrl: bgPass!,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Container(
          height: 320,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: Colors.black45,
          ),
          alignment: Alignment.bottomLeft,
          child: Text(
            itemTitle ?? 'Error',
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
