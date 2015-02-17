import 'dart:convert';
import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:web_links/web_links.dart';

@CustomTag('links-app')
class LinksApp extends PolymerElement {
  var links = new Links(); 
  
  LinksApp.created() : super.created() {
    links.internalList = toObservable(links.internalList);
    load();
  }

  fromJson(List<Map<String, Object>> linkList) {
    links.fromJson(linkList);
  }

  load() {
    String json = window.localStorage['web_links'];
    if (json == null) {
      links.init();
    } else {
      fromJson(JSON.decode(json));
    }
  }
}