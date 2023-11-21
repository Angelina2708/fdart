import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SelfEsteemTest(),
    );
  }
}

class SelfEsteemTest extends StatefulWidget {
  @override
  _SelfEsteemTestState createState() => _SelfEsteemTestState();
}

class _SelfEsteemTestState extends State<SelfEsteemTest> {
  List<String> questions = [
    'Мені хочеться, щоб мої друзі мене підбадьорювали.',
    'Я постійно відчуваю відповідальність за доручену мені роботу.',
    'Я хвилююся за своє майбутнє.',
    'Багато хто мене ненавидить.',
    'Я володію меншою ініціативою, ніж інші.',
    'Я хвилююся за свій психічний стан.',
    'Я боюсь виглядати по-дурному.',
    'Зовнішній вигляд інших набагато кращий, ніж мій.',
    'Я боюсь виступати з промовою перед незнайомими людьми.',
    'Я припускаюсь помилок.',
    'Як шкода, що я не вмію як слід розмовляти з людьми!',
    'Як шкода, що мені не вистачає впевненості у собі.',
    'Мені б хотілось, щоб мої дії частіше схвалювали інші.',
    'Я надто скромний(скромна).',
    'Моє життя не приносить користі.',
    'Багато хто неправильної думки про мене.',
    'Мені ні з ким поділитися своїми думками.',
    'Люди чекають від мене багато.',
    'Люди не дуже цікавляться моїми досягненнями.',
    'Я сором\'язливий (сором\'язлива).',
    'Я відчуваю, що багато людей мене не розуміють.',
    'Я не відчуваю себе в безпеці.',
    'Я часто хвилююся даремно.',
    'Я ніяковію, коли входжу до кімнати, де вже сидять люди.',
    'Я постійно почуваюся скутим (скутою).',
    'Я думаю про те, що люди говорять про мене за моєю спиною.',
    'Я впевнений (впевнена), що люди майже все сприймають набагато легше, ніж я.',
    'Мені здається, що зі мною має трапитись якась неприємність.',
    'Мене хвилює думка про те, як люди ставляться до мене.',
    'Як шкода, що я не такий комунікабельний (така комунікабельна)!',
    'У суперечках я висловлююсь лише тоді, коли впевнений (впевнена) у своїй правоті.',
    'Я думаю про те, чого чекають від мене друзі.'
  ];

  List<int> scores = [
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1,
    4,
    3,
    2,
    1
  ];

  int currentQuestionIndex = -1;
  int score = 0;
  String resultMessage = '';

  void startTest() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      resultMessage = '';
    });
  }

  void answerQuestion(int answer) {
    setState(() {
      score += scores[currentQuestionIndex];
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex += 1;
      } else {
        currentQuestionIndex += 1;
        calculatingResult();
      }
    });
  }

  void restartTest() {
    setState(() {
      currentQuestionIndex = -1;
      score = 0;
      resultMessage = '';
    });
  }

  void calculatingResult() {
    String selfEsteemLevel = '';
    if (score >= 0 && score <= 25) {
      selfEsteemLevel =
          'Високий рівень самооцінки. Ти не засмучуєшся через зауваження інших і рідко сумніваєшся у своїх діях. Раджу Тобі трошки більше прислухатися до людей, які Тебе оточують, та намагатися краще їх розуміти.';
    } else if (score >= 26 && score <= 45) {
      selfEsteemLevel =
          'Середній рівень самооцінки. Ти рідко страждаєш від «комплексу неповноцінності» та час від часу намагаєшся підлаштуватися під думку інших. Продовжуй у тому ж дусі — Ти добре відчуваєш, чого вартий (варта)!';
    } else if (score >= 46 && score <= 128) {
      selfEsteemLevel =
          'Низький рівень самооцінки. Ти хворобливо сприймаєш критичні зауваження на свою адресу, намагаєшся завжди рахуватися з думками інших і часто страждаєш від «комплексу неповноцінності». Веселіше — насправду Ти крутіший (крутіша), ніж думаєш!';
    }

    setState(() {
      resultMessage = selfEsteemLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тест Ассінгера на самооцінку'),
      ),
      body: Center(
        child: currentQuestionIndex == -1
            ? ElevatedButton(
                onPressed: startTest,
                child: Text('Розпочати тест'),
              )
            : currentQuestionIndex < questions.length
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '${currentQuestionIndex + 1}. ${questions[currentQuestionIndex]}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => answerQuestion(4), // Дуже часто
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: Text('Дуже часто'),
                          ),
                          ElevatedButton(
                            onPressed: () => answerQuestion(3), // Часто
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            child: Text('Часто'),
                          ),
                          ElevatedButton(
                            onPressed: () => answerQuestion(2), // Рідко
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            child: Text('Рідко'),
                          ),
                          ElevatedButton(
                            onPressed: () => answerQuestion(1), // Ніколи
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: Text('Ніколи'),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Ваш результат: $score балів'),
                      Text(resultMessage),
                      ElevatedButton(
                        onPressed: restartTest,
                        child: Text('Почати знову'),
                      ),
                    ],
                  ),
      ),
    );
  }
}