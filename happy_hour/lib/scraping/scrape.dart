import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';

main() async {
  http.Response response = await http.get('https://news.ycombinator.com/');

  Document document = parser.parse(response.body);

  await for (Element element in tagStream(document,'a')){
    print(element.text);
  }
}

Stream tagStream(Document document, String tag) async*{
  for(Element element in document.getElementsByTagName(tag)){
    yield element;
  }
}