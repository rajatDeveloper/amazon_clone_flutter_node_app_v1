import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderFun extends StatelessWidget {
  const SliderFun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: GlobalVariables.carouselImages.map((i) {
          return Builder(
              builder: (BuildContext conntext) => Image.network(
                    i,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  ));
        }).toList(),
        options:
            CarouselOptions(viewportFraction: 1, autoPlay: true, height: 200));
  }
}
