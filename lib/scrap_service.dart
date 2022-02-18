import 'dart:developer';

import 'package:covid19/stats_helper.dart';
import 'package:web_scraper/web_scraper.dart';

class ScrapService {
  static Future<String> get() async {
    final webScraper = WebScraper(StatsHelper.source);
    try {
      if (await webScraper.loadWebPage(StatsHelper.path)) {
        List<Map<String, dynamic>> elements =
            webScraper.getElement(StatsHelper.infected24hours, []);
        return elements[0]['title'];
      }
    } on WebScraperException catch (e) {
      log(e.errorMessage().toString());
    }
    return 'There has been an error';
  }

  static Future<String> getConfirmedCases() async {
    final webScraper = WebScraper(StatsHelper.source);
    try {
      if (await webScraper.loadWebPage(StatsHelper.path)) {
        List<Map<String, dynamic>> elements =
            webScraper.getElement(StatsHelper.confirmedCases, []);
        return elements[0]['title'];
      }
    } on WebScraperException catch (e) {
      log(e.errorMessage().toString());
    }
    return 'There has been an error';
  }

  static Future<String> getTestedCases() async {
    final webScraper = WebScraper(StatsHelper.source);
    try {
      if (await webScraper.loadWebPage(StatsHelper.path)) {
        List<Map<String, dynamic>> elements =
            webScraper.getElement(StatsHelper.tested24hours, []);
        return elements[0]['title'];
      }
    } on WebScraperException catch (e) {
      log(e.errorMessage().toString());
    }
    return 'There has been an error';
  }

  static Future<String> getDeathCases() async {
    final webScraper = WebScraper(StatsHelper.source);
    try {
      if (await webScraper.loadWebPage(StatsHelper.path)) {
        List<Map<String, dynamic>> elements =
            webScraper.getElement(StatsHelper.deceased24hours, []);
        return elements[0]['title'];
      }
    } on WebScraperException catch (e) {
      log(e.errorMessage().toString());
    }
    return 'There has been an error';
  }
}
