import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:web_links/web_links.dart';

@CustomTag('link-list')
class LinkList extends PolymerElement {
  @published List<Link> links;
  
  LinkList.created() : super.created();
  
  add(Event e, var detail, Node target) {
    InputElement name = shadowRoot.querySelector("#name");
    InputElement url = shadowRoot.querySelector("#url");
    LabelElement message = shadowRoot.querySelector("#message");
    var error = false;
    message.text = '';
    if (name.value.trim() == '') {
      message.text = 'name is mandatory; ${message.text}';
      error = true;
    }
    if (url.value.trim() == '') {
      message.text = 'web link is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var link = new Link(name.value, url.value);
      links.add(link);
    }
  }
}