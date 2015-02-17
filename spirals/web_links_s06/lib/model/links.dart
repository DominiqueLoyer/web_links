part of web_links;

class Link {
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
}