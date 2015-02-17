import 'package:polymer/polymer.dart';
import 'package:web_links/web_links.dart';

@CustomTag('link-list')
class LinkList extends PolymerElement {
  @published List<Link> links;
  
  LinkList.created() : super.created();
}