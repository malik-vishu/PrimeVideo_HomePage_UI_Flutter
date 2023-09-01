import 'package:banner_carousel/banner_carousel.dart';
import 'package:primevideo_ui/data/data.dart';
import 'package:primevideo_ui/data/model.dart';

List<BannerModel> listBanners = [
  BannerModel(imagePath: Data.jackryan, id: "1"),
  BannerModel(imagePath: Data.bosch, id: "2"),
  BannerModel(imagePath: Data.mirzapur, id: "3"),
  BannerModel(imagePath: Data.omen, id: "4"),
];

List<String> listBannerVideo = [
  "assets/video/jackryan_trailer.mp4",
  "null",
  "assets/video/mirzapur_trailer.mp4",
  "null"
];

Content topContent = const Content(
  name: 'S.W.A.T',
  image: Data.swat,
);
final List<Content> continueWatching = [
  const Content(
    name: 'S.W.A.T',
    image: Data.swat,
  ),
  const Content(
    name: 'Yeh Jawaani Hai Deewani',
    image: Data.jawaani,
  ),
  const Content(
    name: 'BOSCH',
    image: Data.bosch,
  ),
  const Content(
    name: 'Top Gun',
    image: Data.topgun,
  ),
  const Content(
    name: 'Black Mirror',
    image: Data.flash,
  ),
];

final List<Content> original = [
  const Content(
    name: 'Made in Heaven',
    image: Data.heaven,
  ),
  const Content(
    name: 'The Lost Flower of Alice Hart',
    image: Data.alice,
  ),
  const Content(
    name: 'Good Omens 2',
    image: Data.omen,
  ),
  const Content(
    name: 'Jack Ryan',
    image: Data.jackryan,
  ),
  const Content(
    name: 'Mirzapur',
    image: Data.mirzapur,
  ),
];

const List<Content> academy = [
  Content(name: 'Top Gun', image: Data.topgun),
  Content(name: 'Passengers', image: Data.passengers),
  Content(name: 'The Boss Baby', image: Data.bossbaby),
];

