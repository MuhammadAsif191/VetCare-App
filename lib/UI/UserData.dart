class UserData {
  String Name = 'name', Email = 'email', Password = 'password';
  void setName(String name) {
    Name = name;
  }

  void setEmail(String email) {
    Email = email;
  }

  void setPassword(String password) {
    Password = password;
  }

  String getEmail() {
    return Email;
  }

  //   For Data FireBase setting "mail already used or not"
  bool findMail(String email) {
    return true;
  }

  // For Data FireBase setting  "login acount"
  bool signin(String email, String password) {
    return true;
  }

  // For Data FireBAse Setting "Signup acount for user"
  bool signUp() {
    return true;
  }

  // For Data FireBAse Setting "Signup acount for user"
  int forgetPass(String email) {
    return 0000;
  }

  String getUserName() {
    return 'Sheraz Khalid';
  }

  int Complaints() {
    return 2;
  }

  int ComplaintStatus() {
    return 3;
  }

  int ViewDoctor() {
    return 4;
  }

  int PostFeedback() {
    return 6;
  }

  int ViewCureDetails() {
    return 0;
  }

  int ViewReport() {
    return 5;
  }

  void Display() {
    print(Name);
    print(Email);
    print(Password);
  }
}
