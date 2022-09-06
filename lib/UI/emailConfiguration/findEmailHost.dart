int findAtTheRate(String text) {
  int i = 0;
  for (i = 0; i < text.length; i++) {
    if (text[i] == '@') break;
  }
  return i;
}

// if you accept only String then pass haveNumber(string , 1)
// if you accept String and number both then pass haveNumber(string , 2)
bool HaveNumber(String text, int choice) {
  bool flag = true;
  if (choice == 1) {
    flag = !(text.contains(RegExp(r'[0-9]')));
  }
  if (choice == 2) {
    flag = !(text.contains(RegExp(r'[!@#$%^&*(),.?"{}|<>"?]')));
    return flag;
  }
  return flag;
}
