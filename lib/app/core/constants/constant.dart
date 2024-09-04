import '../../data/models/quiz_model.dart';

class Constants {
  static const String appTitle = "Lunga's Solution";
  static const String houses = 'Houses';
  static const String spells = 'Spells';
  static const String elixirs = 'Elixirs';
  static const String favorites = 'Favorites';
  static const String quiz = 'Quiz';
  static const String trivia = 'Trivia';
  static const String search = 'Search';
  static const String searchHouses = 'Search houses';
  static const String searchSpell = 'Search spells';
  static const String searchExilirs = 'Search exilirs';


  static const String elixirsTitle = 'Elixirs';
  static const String houseTitle = 'Houses';
  static const String spellTitle = 'Spells';
  static const String spellDetailsTitle = 'Spells Details';
  static const String bookmarkedSpells = 'bookmarkedSpells';


  static const String nameOption = 'Name';
  static const String founderOption = 'Founder';
  static const String houseColorsOption = 'House Colors';
  static const String animalOption = 'Animal';
  static const String elementOption = 'Element';
  static const String commonRoomOption = 'Common Room';
  static const String ghostOption = 'Ghost';
  static const String traitOption = 'Traits';
  static const String notableOption = 'Notable Members (Heads):';


  static const String errorLoadSpells = 'Failed to load spells';
  static const String errorNotFoundSpells = 'Spell not found.';

  static final  List<String> triviaFacts = [
    "The Hogwarts motto, 'Draco dormiens nunquam titillandus,' means 'Never tickle a sleeping dragon.'",
    "Dumbledore is an old English word for 'bumblebee.'",
    "The number 7 is considered the most magical number in the Wizarding World.",
    "The Sorting Hat originally belonged to Godric Gryffindor.",
    "The Elder Wand is one of the three Deathly Hallows.",
  ];

  static final List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      question: "Who is the founder of Gryffindor?",
      options: ["Godric Gryffindor", "Salazar Slytherin", "Rowena Ravenclaw", "Helga Hufflepuff"],
      correctAnswer: "Godric Gryffindor",
    ),
    QuizQuestion(
      question: "What is the name of Harry Potter's owl?",
      options: ["Hedwig", "Errol", "Pigwidgeon", "Fawkes"],
      correctAnswer: "Hedwig",
    ),
    QuizQuestion(
      question: "Which spell is used to disarm an opponent?",
      options: ["Expelliarmus", "Stupefy", "Lumos", "Alohomora"],
      correctAnswer: "Expelliarmus",
    ),
    QuizQuestion(
      question: "What position does Harry play on his Quidditch team?",
      options: ["Seeker", "Chaser", "Beater", "Keeper"],
      correctAnswer: "Seeker",
    ),
  ];

}
