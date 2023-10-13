import 'dart:io';

class Students {
  late List<Map<String, String>> people;

  Students(List<Map<String, String>> people) {
    this.people = people;
  }

  void output() {
    people.forEach((item) {
      print(
          'First: ${item['first']}, Last: ${item['last']}, Email: ${item['email']}');
    });
  }

  void sort(value) {
    switch (value) {
      case 'first':
        people.sort((a, b) => a['first']!.compareTo(b['first']!));
        break;
      case 'last':
        people.sort((a, b) => a['last']!.compareTo(b['last']!));
        break;
      case 'email':
        people.sort((a, b) => a['email']!.compareTo(b['email']!));
        break;
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(value) {
    people.removeWhere((element) {
      if (value != null) {
        return element['first']?.contains(value) == true ||
            element['last']?.contains(value) == true ||
            element['email']?.contains(value) == true;
      } else {
        return false;
      }
    });
  }
}

class Printing {
  Printing();

  void printTitle(String customTitle) {
    var countEquals = 70;
    for (var i = 0; i < countEquals; i++) {
      stdout.write('=');
    }
    print('');
    var equalsForTitle = countEquals - customTitle.length - 2;
    var equalsEachSide = (equalsForTitle / 2).floor();

    for (var j = 0; j < equalsEachSide; j++) {
      stdout.write('=');
    }

    stdout.write(' $customTitle ');

    for (var j = 0; j < equalsEachSide; j++) {
      stdout.write('=');
    }
    if (equalsForTitle % 2 == 1) {
      stdout.write('=');
    }
    print('');
    for (var i = 0; i < countEquals; i++) {
      stdout.write('=');
    }
    print('');
  }
}
