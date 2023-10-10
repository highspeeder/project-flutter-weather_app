import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg',
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else if (condition < 500) {
      return SvgPicture.asset(
        'svg/cloudDrizzle.svg',
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_rain.svg',
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else if (condition < 700) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else if (condition < 800) {
      return SvgPicture.asset(
        'svg/cloudFog.svg',
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else {
      return Image.asset('images/question.png');
    }
  }

  ({Widget airIcon, Widget airText}) getAirIcon(int index) {
    if (index == 1) {
      return (
        airIcon: SvgPicture.asset(
          'svg/good.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 37.0,
          height: 35.0,
        ),
        airText: const Text(
          '"매우좋음"',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (index == 2) {
      return (
        airIcon: SvgPicture.asset(
          'svg/fair.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 37.0,
          height: 35.0,
        ),
        airText: const Text(
          '"좋음"',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (index == 3) {
      return (
        airIcon: SvgPicture.asset(
          'svg/moderate.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 37.0,
          height: 35.0,
        ),
        airText: const Text(
          '"보통"',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (index == 4) {
      return (
        airIcon: SvgPicture.asset(
          'svg/poor.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 37.0,
          height: 35.0,
        ),
        airText: const Text(
          '"나쁨"',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (index == 5) {
      return (
        airIcon: SvgPicture.asset(
          'svg/bad.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 37.0,
          height: 35.0,
        ),
        airText: const Text(
          '"매우나쁨"',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return (
        airIcon: Image.asset('images/question.png'),
        airText: const Text(
          '연결에러',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }
}
