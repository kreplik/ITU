import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:math';
import 'dart:io';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      initialRoute: 'main', // Set the initial route to the main screen
      routes: {
        'main': (context) => const MyHomePage(),
        'gamePage': (context) => const GamePage(),
        'levels': (context) => const LevelsPage(),
      },
    );
  }
}

// Home page
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  MyHome createState() => MyHome();
}

class MyHome extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: Text(
          TextChanger.mainText,
          style: GoogleFonts.roadRage(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.normal),
        ),
        backgroundColor: ColorChanger.appBar,
      ),
      // main background
      body: Container(
        decoration: BoxDecoration(gradient: ColorChanger.mainBG),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // buttons on main page
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const LevelsPage()), // go to level's screen
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 20),
                    ),
                    child: Text(
                      TextChanger.mainPlay,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const SettingsPage()), // go to setting's screen
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 20),
                    ),
                    child: Text(
                      TextChanger.mainSettings,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                aboutPage()), // go to about's screen
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 20),
                    ),
                    child: Text(
                      TextChanger.mainAbout,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

// class for changing theme modes
class ThemeChanger {
  static bool isDarkMode = false;

  static void toggleTheme() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      ColorChanger.appBar = Color.fromARGB(255, 84, 0, 99);
      ColorChanger.mainBG = LinearGradient(
        colors: [
          Color.fromARGB(255, 1, 59, 106),
          Color.fromARGB(255, 133, 245, 255)
        ], // Změň barvy podle potřeby
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      );
      ColorChanger.flagC = Colors.white;
    } else {
      ColorChanger.mainBG = LinearGradient(
        colors: [
          Colors.blue,
          Color.fromARGB(255, 133, 245, 255)
        ], // Změň barvy podle potřeby
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      );

      ColorChanger.appBar = Color.fromARGB(255, 233, 111, 255);
      ColorChanger.flagC = Colors.black;
    }
  }
}

// class for translating text
class TextChanger {
  static String mainText = 'Hledání min';
  static String mainPlay = 'Hrát';
  static String mainSettings = 'Nastavení';
  static String mainLeaderB = 'Žebříček';
  static String mainAbout = 'O aplikaci';

  static String settingsTitle = 'Nastavení';
  static String settingsLanguage = 'Jazyk';
  static String settingsTheme = 'Tmavý režim';

  static String levelsMain = 'Volba úrovně';
  static String levelsEasy = 'Lehká';
  static String levelsMedium = 'Střední';
  static String levelsHard = 'Těžká';

  static String gameOver = 'KONEC HRY';
  static String author = 'Autor: Adam Nieslanik';
}

// main theme mode
class ColorChanger {
  static LinearGradient mainBG = LinearGradient(
    colors: [
      Colors.blue,
      Color.fromARGB(255, 133, 245, 255)
    ], 
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  static Color appBar = Color.fromARGB(255, 233, 111, 255);
  static Color flagC = Colors.black;
}

// setting page
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Settings createState() => Settings();
}

class Settings extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextChanger.mainText,
          style: GoogleFonts.roadRage(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.normal),
        ),
        backgroundColor: ColorChanger.appBar,
      ),
      // pages' body
      body: Container(
        decoration: BoxDecoration(gradient: ColorChanger.mainBG),
        child: Center(
          child: SizedBox(
            width: 350.0,
            height: 450.0,
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                color: ColorChanger.appBar,
                constraints:
                    const BoxConstraints(minHeight: 200.0, minWidth: 200.0),
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: Text(
                        TextChanger.settingsTitle,
                        style: GoogleFonts.roadRage(
                            color: Colors.white,
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 60),
                    // THEME ROW
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child: Text(
                            TextChanger.settingsTheme,
                            style: GoogleFonts.roadRage(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 60),

                        // THEME SWITCH
                        Switch(
                          value: ThemeChanger.isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              ThemeChanger.toggleTheme();
                            });
                          },
                        ),
                        // THEME SWITCH
                      ],
                    ),
                    // THEME ROW
                    const SizedBox(height: 20),
                    // LANGUAGE ROW
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child: Text(
                            TextChanger.settingsLanguage,
                            style: GoogleFonts.roadRage(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 20),

                        // FIRST FLAG ICON
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              TextChanger.mainText = 'Hledání min';
                              TextChanger.mainPlay = 'Hrát';
                              TextChanger.mainSettings = 'Nastavení';
                              TextChanger.mainLeaderB = 'Žebříček';
                              TextChanger.mainAbout = 'O aplikaci';

                              TextChanger.settingsTitle = 'Nastavení';
                              TextChanger.settingsLanguage = 'Jazyk';
                              TextChanger.settingsTheme = 'Tmavý režim';

                              TextChanger.levelsMain = 'Volba úrovně';
                              TextChanger.levelsEasy = 'Lehká';
                              TextChanger.levelsMedium = 'Střední';
                              TextChanger.levelsHard = 'Těžká';
                              TextChanger.author = 'Autor: Adam Nieslanik';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(4.0),
                            shape: const CircleBorder(),
                            fixedSize: const Size(50, 40),
                          ),
                          child: Ink(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/cz.jpg'),
                                fit: BoxFit
                                    .fill, 
                              ),
                            ),
                          ),
                        ),

                        // FIRST FLAG ICON

                        const SizedBox(width: 2),

                        // SECOND FLAG ICON
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              TextChanger.mainText = 'Minesweeper';
                              TextChanger.mainPlay = 'Play';
                              TextChanger.mainSettings = 'Settings';
                              TextChanger.mainLeaderB = 'Leaderboard';
                              TextChanger.mainAbout = 'About';

                              TextChanger.settingsTitle = 'Settings';
                              TextChanger.settingsLanguage = 'Language';
                              TextChanger.settingsTheme = 'Dark mode';

                              TextChanger.levelsMain = 'Choose level';
                              TextChanger.levelsEasy = 'Easy';
                              TextChanger.levelsMedium = 'Medium';
                              TextChanger.levelsHard = 'Hard';
                              TextChanger.author = 'Author: Adam Nieslanik';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(4.0),
                            shape: const CircleBorder(),
                            fixedSize: const Size(50, 40),
                          ),
                          child: Ink(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/gb.jpg'),
                                fit: BoxFit
                                    .fill, 
                              ),
                            ),
                          ),
                        ),
                        // SECOND FLAG ICON
                      ],
                    ),
                    // LANGUAGE ROW
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LevelsPage extends StatefulWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  Levels createState() => Levels();
}

class Levels extends State<LevelsPage> {
  int optionSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            TextChanger.mainText,
            style: GoogleFonts.roadRage(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: ColorChanger.appBar),
      // levels's body
      body: Container(
          decoration: BoxDecoration(
            gradient: ColorChanger.mainBG,
          ),
          child: Center(
              child: SizedBox(
                  width: 350.0,
                  height: 450.0,
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: ColorChanger.appBar,
                    child: Container(
                      constraints: const BoxConstraints(
                          minHeight: 200.0, minWidth: 200.0),
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const Alignment(15, 0),
                                child: SizedBox(
                                  width: 302,
                                  height: 70,
                                  child: Text(
                                    TextChanger.levelsMain,
                                    style: GoogleFonts.roadRage(
                                        color: Colors.white,
                                        fontSize: 60.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              // FIRST ROW ------------------
                              Row(
                                children: [
                                  // INKWELL EASY ------------------
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        optionSelected = 1;
                                        MineChanger.mines =
                                            20; // set mines probability
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: (optionSelected == 1)
                                              ? Colors.blue
                                              : Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.circle,
                                          size: 30,
                                          color: (optionSelected == 1)
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // INKWELL ------------------

                                  const SizedBox(width: 140),

                                  // TEXT BOX ------------------
                                  Text(
                                    TextChanger.levelsEasy,
                                    style: GoogleFonts.roadRage(
                                        color: Colors.white,
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  // TEXT BOX ------------------
                                ],
                              ),
                              // FIRST ROW ------------------

                              const SizedBox(height: 15),

                              // SECOND ROW ------------------
                              Row(
                                children: [
                                  // INKWELL  MEDIUM ------------------
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        optionSelected = 2;
                                        MineChanger.mines =
                                            30; // set mines probability
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: (optionSelected == 2)
                                              ? Colors.blue
                                              : Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.circle,
                                          size: 30,
                                          color: (optionSelected == 2)
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // INKWELL ------------------

                                  const SizedBox(width: 140),

                                  // TEXT BOX ------------------
                                  Text(
                                    TextChanger.levelsMedium,
                                    style: GoogleFonts.roadRage(
                                        color: Colors.white,
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  // TEXT BOX ------------------
                                ],
                                // SECOND ROW ------------------
                              ),
                              const SizedBox(height: 15),

                              // THIRD ROW ------------------
                              Row(
                                children: [
                                  // INKWEL HARD ---------------
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        optionSelected = 3;
                                        MineChanger.mines =
                                            40; // set mines probability
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: (optionSelected == 3)
                                              ? Colors.blue
                                              : Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.circle,
                                          size: 30,
                                          color: (optionSelected == 3)
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // INKWEL ---------------

                                  const SizedBox(width: 140),

                                  // TEXT BOX -------------
                                  Text(
                                    TextChanger.levelsHard,
                                    style: GoogleFonts.roadRage(
                                        color: Colors.white,
                                        fontSize: 45.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  // TEXT BOX -------------
                                ],
                              ),
                              // THIRD ROW --------------------
                              const SizedBox(height: 2),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const GamePage()), // go to game's screen
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(70, 50),
                                    backgroundColor: Colors.blue,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  )))),
    );
  }
}

// dragable flag from appbar
class DraggableFlag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: true,
      child: Icon(Icons.flag, color: ColorChanger.flagC),
      feedback: Icon(Icons.flag, color: ColorChanger.flagC, size: 40),
      childWhenDragging: Container(),
    );
  }
}

// mines probability
class MineChanger {
  static int mines = 20;
}

// game page
class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Game createState() => Game();
}

class Game extends State<GamePage> {
  int counter = 0;
  late DateTime startTime;
  late Timer timer;

  final int rows = 8;
  final int columns = 8;

  // helping array for revealed cell
  late List<List<bool>> isRevealed =
      List.generate(rows, (row) => List.generate(columns, (col) => false));

  // helping array for flagged cell
  late List<List<bool>> isFlagged =
      List.generate(rows, (row) => List.generate(columns, (col) => false));

  late List<List<int>> mineField;

  // final mines field
  List<List<int>> finalField = [];

  void setCsv() {
    String filePath = "/Users/adamnieslanik/app/assets/game.csv";

    int randomMineCount =
        Random().nextInt((MineChanger.mines)); // Generate a random mine count

    generateMineField(rows, columns, randomMineCount, filePath);
  }

  void generateMineField(
      int rows, int columns, int mineCount, String filePath) async {
    // Initialize an empty mine field
    mineField =
        List.generate(rows, (row) => List.generate(columns, (col) => 0));

    // randomly place mines in the mine field
    Random random = Random();
    int minesPlaced = 0;
    while (minesPlaced < mineCount) {
      int randomRow = random.nextInt(rows);
      int randomCol = random.nextInt(columns);
      if (mineField[randomRow][randomCol] == 0) {
        mineField[randomRow][randomCol] = 9;
        minesPlaced++;
      }
    }
    File file = File(filePath);
    IOSink sink = file.openWrite();

    for (int row = 0; row < mineField.length; row++) {
      String rowString = mineField[row].join(',');
      sink.write('$rowString\n');
    }
    sink.close();
    // calculate neighbor mine counts
    finalField = calculateNeighborMineCounts(mineField);

    // save the mine field to a CSV file
    saveMineFieldToCSV(finalField, filePath);
  }

  List<List<int>> calculateNeighborMineCounts(List<List<int>> mineField) {
    int rows = mineField.length;
    int columns = mineField[0].length;

    List<List<int>> neighborMineCounts =
        List.generate(rows, (row) => List.generate(columns, (col) => 0));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        if (mineField[i][j] == 9) {
          // If it's a mine, increment neighbor counts
          for (int x = i - 1; x <= i + 1; x++) {
            for (int y = j - 1; y <= j + 1; y++) {
              if (x >= 0 &&
                  x < rows &&
                  y >= 0 &&
                  y < columns &&
                  !(x == i && y == j)) {
                neighborMineCounts[x][y]++;
              }
            }
          }
        }
      }
    }

    return neighborMineCounts;
  }

  void saveMineFieldToCSV(List<List<int>> mineField, String filePath) async {
    File file = File(filePath);
    IOSink sink = file.openWrite();

    for (int row = 0; row < mineField.length; row++) {
      String rowString = mineField[row].join(',');
      sink.write('$rowString\n');
    }

    sink.close();
  }

  @override
  void initState() {
    // start timer and load mine field
    super.initState();
    startTime = DateTime.now();
    startTimer();

    setCsv();
  }

  // timer class
  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (Timer timer) {
      setState(() {
        counter = DateTime.now().difference(startTime).inSeconds;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer
    timer.cancel();
    super.dispose();
  }

  bool isGameOver = false; // indicates game over

  void checkGameOver() {
    isGameOver = true;
    timer.cancel(); // stop timer

    if (isGameOver) {
      // If the game is over, show widget
      setState(() {});
    }
  }

  // game over widget
  Widget gameOver() {
    return Center(
      child: SizedBox(
        width: 450.0,
        height: 450.0,
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: ColorChanger.appBar,

          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 85),
                    Center(
                      child: Text(TextChanger.gameOver,
                          style: GoogleFonts.roadRage(
                              color: Colors.white,
                              fontSize: 70.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 125),
                // print time
                SizedBox(
                  child: Text('$counter s',
                      style: GoogleFonts.roadRage(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 125),

                // home/restart buttons
                Row(
                  children: [
                    const SizedBox(width: 120),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, 'main',
                              ((route) => false)); // go to main screen
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(70, 50),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, 'levels',
                              ((route) => false)); // go to levels screen
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(70, 50),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.restart_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // main game's widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            TextChanger.mainText,
            style: GoogleFonts.roadRage(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: ColorChanger.appBar),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: ColorChanger.mainBG),
            child: Column(
              children: [
                // header with timer and flag
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(color: ColorChanger.appBar),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // timer
                        children: [
                          const Icon(Icons.timer, color: Colors.white),
                          const SizedBox(width: 4.0),
                          Text('$counter s',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        // flag
                        children: [
                          DraggableFlag(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100.0),
                // mine field
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                    ),
                    itemBuilder: (context, index) {
                      int row = index ~/ columns;
                      int col = index % columns;

                      // get tapped cell
                      String cellValue = finalField[row][col].toString();

                      Color cellColor;

                      // set cell's color according to value
                      if (cellValue == '1') {
                        cellColor = Colors.green;
                      } else if (cellValue == '2') {
                        cellColor = Colors.blue;
                      } else if (cellValue == '3') {
                        cellColor = Colors.red;
                      } else {
                        cellColor = Colors.white;
                      }

                      return DragTarget<bool>(
                        onWillAccept: (_) => true,
                        onAccept: (_) {
                          // handle flag placement
                          setState(() {
                            isFlagged[row][col] = true;
                          });
                        },
                        builder: (context, accepted, rejected) {
                          return GestureDetector(
                            onTap: () {
                              if (cellValue == '9') {
                                // tapped mine
                                checkGameOver();
                              }
                              // handle tap on cell
                              setState(() {
                                isRevealed[row][col] = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: (isRevealed[row][col])
                                    ? Color.fromARGB(255, 231, 158, 244)
                                    : ColorChanger.appBar,
                                border: Border.all(color: Colors.white),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      (isRevealed[row][col] && cellValue != '0')
                                          ? cellValue
                                          : '',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: cellColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // place flag
                                  if (isFlagged[row][col] &&
                                      !isRevealed[row][col])
                                    Center(
                                      child: Draggable(
                                        data: true,
                                        child: Icon(Icons.flag,
                                            size: 30,
                                            color: ColorChanger.flagC),
                                        feedback: Icon(Icons.flag,
                                            size: 30,
                                            color: ColorChanger.flagC
                                                .withOpacity(0.7)),
                                        childWhenDragging: Container(),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: rows * columns,
                  ),
                 
                ),
              ],
            ),
          ),
          if (isGameOver) gameOver(), // show game over widget
        ],
      ),
    );
  }
}

// about page
class aboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            TextChanger.mainText,
            style: GoogleFonts.roadRage(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: ColorChanger.appBar),
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorChanger.mainBG,
        ),
        // about page's body
        child: Center(
          child: SizedBox(
            width: 350.0,
            height: 450.0,
            child: Card(
              elevation: 2.0, // Hodnota stínu
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: ColorChanger.appBar,
              child: Container(
                constraints:
                    const BoxConstraints(minHeight: 200.0, minWidth: 200.0),
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const Alignment(15, 0),
                        child: SizedBox(
                          width: 300,
                          height: 70,
                          child: Text(
                            TextChanger.mainAbout,
                            style: GoogleFonts.roadRage(
                                color: Colors.white,
                                fontSize: 60.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Text(TextChanger.author,
                            style: GoogleFonts.roadRage(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.normal)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
