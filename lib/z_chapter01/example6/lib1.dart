//importing lib1 brings-in all apis from lib2 as well
part 'lib2.dart';

int addition(int a, int b) => _add(a, b);

int subtraction(int a, int b) => a - b;

int _add(int a, int b) => a + b;
