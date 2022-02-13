class Users {
  String email;
  String password;
  String _status;
  var abc = "";
  var dce;

  Users(String email, String password) {
    this.email = email;
    this.password = password;
  }

  Users.withoutInfo();

  var users = {"samet": "1234"}; //database

  String get getstatus {
    var message = "";
    if (true == users.containsKey(this.email) &&
        true == users.containsValue(this.password)) {
      message = "Login successful";
    } else {
      message = "Invalid email or password";
    }
    return message;
  }
}
