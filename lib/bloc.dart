import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class weatherState {
  String name;
  double temperature;
  Icon icon;

  weatherState(this.name, this.temperature, this.icon);
}

class weather extends Bloc<dynamic, weatherState> {
  String url =
      "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=fcb80db3b2180d2cd9cc191278bf70cb";

  weather() : super(weatherState("", 0.0, Icon(CupertinoIcons.cloud)));

  Future<Map<String, dynamic>> fetch({lat, lon, name = ""}) async {
    String addtionData = "";
    if (name != "") {
      addtionData = "&q=" + name;
    } else {
      addtionData = "&lat=" + lat.toString() + "&lon=" + lon.toString();
    }
    http.Response response = await http.get(Uri.parse(url + addtionData));
    return jsonDecode(response.body);
  }

  @override
  // TODO: implement stream
  Stream<weatherState> mapEventToState(dynamic state) async* {
    Map<String, dynamic> temp;
    if (state is Map<String, dynamic>)
      temp = await fetch(lat: state["lat"], lon: state["lon"]);
    else {
      temp = await fetch(name: state);
    }

    Icon icon = Icon(
      CupertinoIcons.cloud,
      size: 100.0,
    );
    int x = int.parse(temp["weather"][0]["id"].toString());
    switch (x) {
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
        icon = Icon(CupertinoIcons.cloud_bolt, size: 100.0);
        break;

      case 300:
      case 301:
      case 302:
      case 303:
      case 304:
      case 305:
      case 306:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 315:
      case 316:
      case 317:
      case 318:
      case 319:
      case 320:
      case 321:
        icon = Icon(CupertinoIcons.cloud_drizzle, size: 100.0);
        break;

      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
      case 505:
      case 506:
      case 507:
      case 508:
      case 509:
      case 510:
      case 511:
      case 512:
      case 513:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 521:
      case 522:
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:

      case 531:
        icon = Icon(CupertinoIcons.cloud_rain, size: 100.0);
        break;

      case 600:
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
      case 606:
      case 607:
      case 608:
      case 609:
      case 610:
      case 611:
      case 612:
      case 613:
      case 614:
      case 615:
      case 616:
      case 617:
      case 618:
      case 619:
      case 620:
      case 621:
      case 622:
        icon = Icon(CupertinoIcons.snow, size: 100.0);
        break;

      case 701:
      case 702:
      case 703:
      case 704:
      case 705:
      case 706:
      case 707:
      case 708:
      case 709:
      case 710:
      case 711:
      case 712:
      case 713:
      case 714:
      case 715:
      case 716:
      case 717:
      case 718:
      case 719:
      case 720:
      case 721:
      case 722:

      case 723:
      case 724:
      case 725:
      case 726:
      case 727:
      case 728:
      case 729:
      case 730:
      case 731:
      case 732:

      case 733:
      case 734:
      case 735:
      case 736:
      case 737:
      case 738:
      case 739:
      case 740:
      case 741:

      case 742:

      case 743:
      case 744:
      case 745:
      case 746:
      case 747:
      case 748:
      case 749:
      case 750:
      case 751:
      case 752:

      case 753:
      case 754:
      case 755:
      case 756:
      case 757:
      case 758:
      case 759:
      case 760:
      case 761:

      case 762:

      case 763:
      case 764:
      case 765:
      case 766:
      case 767:
      case 768:
      case 769:
      case 770:
      case 771:

      case 772:

      case 773:
      case 774:
      case 775:
      case 776:
      case 777:
      case 778:
      case 779:
      case 780:
      case 781:
        icon = Icon(CupertinoIcons.smoke, size: 100.0);
        break;
      case 800:
        icon = Icon(CupertinoIcons.sun_max, size: 100.0);
        break;
      case 801:
      case 802:
      case 803:
      case 804:
        icon = Icon(CupertinoIcons.cloud, size: 100.0);
        break;
      default:
    }

    yield weatherState(
        temp["name"], double.parse(temp["main"]["temp"].toString()), icon);
  }
}
