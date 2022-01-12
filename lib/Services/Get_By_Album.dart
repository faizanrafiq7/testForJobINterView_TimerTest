import 'package:chair_app/services/networking.dart';

const ApiKey = '7adc149a71f0ebac7d117052008f56ab';

class Album {
  Future<dynamic> getByAlbum(String albumName) async {
    String url =
        'https://ws.audioscrobbler.com/2.0/?method=album.search&album=$albumName&api_key=$ApiKey&format=json';

    return await NetworkHelper(url).getData();
  }
}
