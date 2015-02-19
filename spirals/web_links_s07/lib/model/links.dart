part of web_links;

class Link implements Comparable {
  String name;
  Uri url;

  Link(this.name, String link) {
    url = Uri.parse(link);
  }

  Link.fromJson(Map<String, Object> linkMap) {
    name = linkMap['name'];
    url = Uri.parse(linkMap['url']);
  }

  Map<String, Object> toJson() {
    var linkMap = new Map<String, Object>();
    linkMap['name'] = name;
    linkMap['url'] = url.toString();
    return linkMap;
  }

  String toString() {
    return '{name: ${name}, url: ${url.toString()}}';
  }
  
  /**
   * Compares two links based on their names.
   * If the result is less than 0 then the first link is less than the second,
   * if it is equal to 0 they are equal and
   * if the result is greater than 0 then the first is greater than the second.
   */
  int compareTo(Link link) {
    if (name != null && link.name != null) {
      return name.compareTo(link.name);
    } else {
      throw new Exception('a link name must be present');
    }
  }
}

class Links {
  var _list = new List<Link>();

  Iterator<Link> get iterator => _list.iterator;
  bool get isEmpty => _list.isEmpty;

  List<Link> get internalList => _list;
  set internalList(List<Link> observableList) => _list = observableList;

  init() {
    var link1 = new Link('On Dart', 'http://ondart.me/');
    var link2 = new Link('Polymer.dart', 'https://www.dartlang.org/polymer-dart/');
    var link3 = new Link('Books To Read', 'http://www.goodreads.com/');
    this..add(link1)..add(link2)..add(link3);
  }
  
  bool add(Link newLink) {
    if (newLink == null) {
      throw new Exception('a new link must be present');
    }
    for (Link link in _list) {
      if (newLink.name == link.name) return false;
    }
    _list.add(newLink);
    return true;
  }

  Link find(String name) {
    for (Link link in _list) {
      if (link.name == name) return link;
    }
    return null;
  }

  bool remove(Link link) {
    return _list.remove(link);
  }

  sort() {
    _list.sort();
  }
  
  List<Map<String, Object>> toJson() {
    var linkList = new List<Map<String, Object>>();
    for (Link link in _list) {
      linkList.add(link.toJson());
    }
    return linkList;
  }

  fromJson(List<Map<String, Object>> linkList) {
    if (!_list.isEmpty) {
      throw new Exception('links are not empty');
    }
    for (Map<String, Object> linkMap in linkList) {
      Link link = new Link.fromJson(linkMap);
      add(link);
    }
  }
}
