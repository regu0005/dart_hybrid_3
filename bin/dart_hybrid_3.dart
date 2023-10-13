import 'package:dart_hybrid_3/dart_hybrid_3.dart';
import 'dart:convert';

void main(List<String> arguments) {
  Printing print = Printing();

  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  final parsedJson = jsonDecode(json) as List;

  List<Map<String, String>> peopleData = parsedJson.map((item) {
    return {
      'first': item['first'].toString(),
      'last': item['last'].toString(),
      'email': item['email'].toString(),
    };
  }).toList();

  Students student = Students(peopleData);

  // Simple Output
  print.printTitle("Output");
  student.output();

  // Sort by 'option' first, last, or email
  var sortOption = "email";
  print.printTitle("Sort by $sortOption");
  student.sort(sortOption);
  student.output();

  // Add a new person
  student.plus({
    'first': 'Gustavo',
    'last': 'Reguerin',
    'email': 'reguerin@gmail.com',
  });
  print.printTitle("Add person");
  student.output();

  // Remove person
  student.remove('Gustavo');
  print.printTitle("Remove person");
  student.output();
}
