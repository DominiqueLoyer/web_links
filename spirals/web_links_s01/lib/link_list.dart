import 'package:polymer/polymer.dart';

@CustomTag('link-list')
class LinkList extends PolymerElement {
  List links = 
      ['http://ondart.me/', 
       'https://www.dartlang.org/polymer-dart/'];

  LinkList.created() : super.created();
}