class EmotionsModel {
  final String title;
  final String image;

  EmotionsModel({required this.title, required this.image});
}

List<EmotionsModel> emotions = [
  EmotionsModel(title: 'Счастье', image: 'assets/images/happy.png'),
  EmotionsModel(title: 'Страх', image: 'assets/images/fear.png'),
  EmotionsModel(title: 'Бешайство', image: 'assets/images/rabies.png'),
  EmotionsModel(title: 'Грусть', image: 'assets/images/sadness.png'),
  EmotionsModel(title: 'Спокойствие', image: 'assets/images/tranquility.png'),
  EmotionsModel(title: 'Сила', image: 'assets/images/strength.png'),
];
