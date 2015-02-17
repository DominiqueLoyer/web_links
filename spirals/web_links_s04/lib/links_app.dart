import 'package:polymer/polymer.dart';
import 'package:web_links/web_links.dart';

@CustomTag('links-app')
class LinksApp extends PolymerElement {
  var links = toObservable(new List<Link>()); 
  
  LinksApp.created() : super.created() {
    var link1 = new Link('On Dart', 'http://ondart.me/');
    var link2 = new Link('Polymer.dart', 'https://www.dartlang.org/polymer-dart/');
    var link3 = new Link('Books To Read', 'http://www.goodreads.com/');
    links..add(link1)..add(link2)..add(link3);
  }
}
