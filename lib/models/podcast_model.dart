class PodCast {
  final String image;
  final String date;
  final String time;
  final String title;
  final String audio;
  bool like;

  PodCast(
      {required this.date,
      required this.image,
      required this.time,
      required this.title,
      required this.like,
      required this.audio});
}

List<PodCast> listPodCast = [
  PodCast(
      date: 'DEC 30, 2020',
      image: 'assets/images/image1.png',
      time: '3 hr 31 mins',
      title: 'The Year in MoGraph-2020',
      like: false,
      audio: 'audios/audio1.mp3'),
  PodCast(
      date: 'DEC 30, 2020',
      image: 'assets/images/image2.png',
      time: '3 hr 31 mins',
      title: 'Episode 197: The World of Lettering',
      like: false,
      audio: 'audios/audio2.mp3'),
  PodCast(
      date: 'DEC 30, 2020',
      image: 'assets/images/image3.png',
      time: '3 hr 31 mins',
      title: 'How to Create YouTube Video Ads That Convert',
      like: false,
      audio: 'audios/audio3.mp3'),
  PodCast(
      date: 'DEC 30, 2020',
      image: 'assets/images/image4.png',
      time: '3 hr 31 mins',
      title: 'Airbnb’s Brian Chesky: Designing for trust',
      like: false,
      audio: 'audios/audio4.mp3'),
  PodCast(
      date: 'DEC 30, 2020',
      image: 'assets/images/image5.png',
      time: '3 hr 31 mins',
      title: 'Sounds Worth Saving',
      like: false,
      audio: 'audios/audio5.mp3'),
];
