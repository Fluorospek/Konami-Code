class Escalade {
  List<String> _correctanswer = [
    'up',
    'up',
    'down',
    'down',
    'left',
    'right',
    'left',
    'right',
    'B',
    'A'
  ];

  bool checkanswer(List<String> userinput) {
    if (_correctanswer == userinput)
      return true;
    else
      return false;
  }
}
