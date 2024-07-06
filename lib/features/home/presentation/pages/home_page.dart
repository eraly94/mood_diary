import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_diary/features/home/data/models/emotions_model.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:mood_diary/core/theme/app_colors.dart';
import 'package:mood_diary/core/theme/app_styles.dart';

import '../widgets/wraptext_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EmotionsModel> emotions = [];

  @override
  void initState() {
    emotions = [
      EmotionsModel(title: 'Счастье', image: 'assets/images/happy.png'),
      EmotionsModel(title: 'Страх', image: 'assets/images/fear.png'),
      EmotionsModel(title: 'Бешайство', image: 'assets/images/rabies.png'),
      EmotionsModel(title: 'Грусть', image: 'assets/images/sadness.png'),
      EmotionsModel(
          title: 'Спокойствие', image: 'assets/images/tranquility.png'),
      EmotionsModel(title: 'Сила', image: 'assets/images/strength.png'),
    ];
    _notesController.addListener(_validateFields);
    super.initState();
  }

  int currentIndex = 0;
  int _selectedIndex = -1;
  double _value1 = 4.5;
  double _value2 = 4.5;
  DateTime selectedDate = DateTime.now();

  final Set<String> selectedItems = <String>{};

  final TextEditingController _notesController = TextEditingController();
  bool _allFieldsValid = false;

  List<Map<String, dynamic>> selected = [
    {'title': 'Возбуждение', "isActive": false},
    {'title': 'Восторг', "isActive": false},
    {'title': 'Игривость', "isActive": false},
    {'title': 'Наслаждение', "isActive": false},
    {'title': 'Очарование', "isActive": false},
    {'title': 'Осознанность', "isActive": false},
    {'title': 'Смелость', "isActive": false},
    {'title': 'Удовольствие', "isActive": false},
    {'title': 'Чувственность', "isActive": false},
    {'title': 'Энергичность', "isActive": false},
    {'title': 'Экстравагантность', "isActive": false},
  ];

  void _toggleSelection(int index) {
    setState(() {
      selected[index]['isActive'] = !selected[index]['isActive'];
    });

    _validateFields();
  }

  void _validateFields() {
    bool emotionsSelected = _selectedIndex != -1;
    bool stressLevelSelected = _value1 != null;
    bool selfEvaluationSelected = _value2 != null;
    bool notesFilled = _notesController.text.isNotEmpty;
    bool anySelected = selected.any((item) => item['isActive']);

    setState(() {
      _allFieldsValid = emotionsSelected &&
          stressLevelSelected &&
          selfEvaluationSelected &&
          notesFilled &&
          anySelected;
    });
  }

  void _save() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Отлично!',
            style: AppStyles.w800f16,
          ),
          content: Text(
            'Ваше сегодняшнее настроение сохранено.',
            style: AppStyles.w400f14,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Спасибо!',
                style: AppStyles.w500f14,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day} ${_getMonthName(date.month)} ${date.year}';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'января';
      case 2:
        return 'февраля';
      case 3:
        return 'марта';
      case 4:
        return 'апреля';
      case 5:
        return 'мая';
      case 6:
        return 'июня';
      case 7:
        return 'июля';
      case 8:
        return 'августа';
      case 9:
        return 'сентября';
      case 10:
        return 'октября';
      case 11:
        return 'ноября';
      case 12:
        return 'декабря';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _formatDate(selectedDate),
            style: AppStyles.w700f18,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: SvgPicture.asset('assets/svgs/calendar.svg'),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      width: 320,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.grey4,
                        borderRadius: BorderRadius.circular(47),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              currentIndex = 0;
                              setState(() {});
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(47),
                                color: currentIndex == 0
                                    ? AppColors.tangerine
                                    : Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 20),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/diary.png',
                                      width: 12,
                                      height: 12,
                                      color: currentIndex == 0
                                          ? AppColors.white
                                          : AppColors.grey,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Дневник настроения',
                                      style: currentIndex == 0
                                          ? AppStyles.w500f12
                                              .copyWith(color: AppColors.white)
                                          : AppStyles.w500f12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              currentIndex = 1;
                              setState(() {});
                              _validateFields();
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(47),
                                color: currentIndex == 1
                                    ? AppColors.tangerine
                                    : Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 5),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/diary.png',
                                      width: 12,
                                      height: 12,
                                      color: currentIndex == 1
                                          ? AppColors.white
                                          : AppColors.grey,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Статистика',
                                      style: currentIndex == 1
                                          ? AppStyles.w500f12
                                              .copyWith(color: AppColors.white)
                                          : AppStyles.w500f12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Visibility(
                  visible: currentIndex == 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text('Что чувствуешь?',
                          style: AppStyles.w800f16
                              .copyWith(color: AppColors.black)),
                      SizedBox(
                        height: 118,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: emotions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                                _validateFields();
                              },
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 118,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(76),
                                      border: Border.all(
                                        color: _selectedIndex == index
                                            ? AppColors.tangerine
                                            : Colors.transparent,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 13, horizontal: 6),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(emotions[index].image,
                                              width: 53, height: 50),
                                          Text(
                                            emotions[index].title,
                                            style: AppStyles.w400f11,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        children: List<Widget>.generate(
                          selected.length,
                          (index) => WraptextWidget(
                            wrapText: selected[index]['title'],
                            onTap: () => _toggleSelection(index),
                            isActive: selected[index]['isActive'],
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text('Уровень стресса?',
                          style: AppStyles.w800f16
                              .copyWith(color: AppColors.black)),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: 335,
                        height: 108,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                        ),
                        child: Column(
                          children: [
                            SfSliderTheme(
                              data: const SfSliderThemeData(
                                tickOffset: Offset(0, -20),
                                overlayRadius: 15,
                              ),
                              child: SfSlider(
                                min: 2.0,
                                max: 7.0,
                                interval: 1,
                                showTicks: true,
                                value: _value1,
                                activeColor: AppColors.tangerine,
                                onChanged: (dynamic newValue1) {
                                  setState(() {
                                    _value1 = newValue1;
                                  });
                                  _validateFields();
                                },
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Низкий',
                                  style: AppStyles.w400f11
                                      .copyWith(color: AppColors.grey5),
                                ),
                                Text(
                                  'Высокой',
                                  style: AppStyles.w400f11
                                      .copyWith(color: AppColors.grey5),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text('Самооценка?',
                          style: AppStyles.w800f16
                              .copyWith(color: AppColors.black)),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: 335,
                        height: 108,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                        ),
                        child: Column(
                          children: [
                            SfSliderTheme(
                              data: const SfSliderThemeData(
                                tickOffset: Offset(0, -20),
                                overlayRadius: 15,
                              ),
                              child: SfSlider(
                                min: 2.0,
                                max: 7.0,
                                interval: 1,
                                showTicks: true,
                                value: _value2,
                                activeColor: AppColors.tangerine,
                                onChanged: (dynamic newValue2) {
                                  setState(() {
                                    _value2 = newValue2;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Неуверенность',
                                  style: AppStyles.w400f11
                                      .copyWith(color: AppColors.grey5),
                                ),
                                Text(
                                  'Уверенность',
                                  style: AppStyles.w400f11
                                      .copyWith(color: AppColors.grey5),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text('Заметки',
                          style: AppStyles.w800f16
                              .copyWith(color: AppColors.black)),
                      const SizedBox(height: 10),
                      Container(
                        width: 335,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                        ),
                        child: TextFormField(
                          controller: _notesController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Введите заметку',
                            hintStyle: AppStyles.w400f13
                                .copyWith(color: AppColors.grey5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      SizedBox(
                        width: 335,
                        height: 44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(69),
                            ),
                            backgroundColor: _allFieldsValid
                                ? AppColors.tangerine
                                : AppColors.grey5,
                          ),
                          onPressed: _allFieldsValid ? _save : null,
                          child: Text(
                            'Сохранить',
                            style: AppStyles.w400f20.copyWith(
                              color: _allFieldsValid
                                  ? AppColors.white
                                  : AppColors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Visibility(
                  visible: currentIndex == 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Статистика за прошлый месяц!',
                            style: AppStyles.w800f16,
                          ),
                          const SizedBox(height: 10),
                          Image.asset('assets/images/statistics.png'),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
