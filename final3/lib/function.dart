import 'package:http/http.dart' as http;

fetchdata(List a) async {
  String url='';
  var i =0;
  var l = a.length;
  while(i<l) {
    url = 'http://10.0.2.2:5000/api?query=' + a[i].toString();
    http.Response response = await http.get(Uri.parse(url));
    i++;
  }
  //return response.body;
}
