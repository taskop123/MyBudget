class Constants {

  // Titles
  static const applicationTitle = "MyBudget";
  static const loginTitle = "Sign In";
  static const registrationTitle = "Sign up";
  static const settingsTitle = "Settings";
  static const privacyPolicyTitle = "Privacy Policy";
  static const contactTitle = "Contact";
  static const notificationTitle = 'my.budget';

  // Routes
  static const loginRoute = '/login';
  static const registerRoute = '/register';

  // Config
  static const databaseUrl = 'https://my-budget-6f1a1-default-rtdb.europe-west1.firebasedatabase.app/';

  // Form
  static const usernamePlaceholder = 'Enter your username';
  static const emailPlaceholder = 'Enter your email address';
  static const passwordPlaceholder = 'Enter your password';
  static const emailValidation = 'Please enter a valid email address.';
  static const usernameValidation = 'Please enter a valid username.';
  static const passwordValidation = 'Please enter a valid password.';

  // Images
  static const logoUrl = 'assets/images/logo.jpg';
  static const launcherUrl = '@mipmap/ic_launcher';

  // Buttons
  static const loginButtonPlaceholder = "Already have an account?";
  static const registerButtonPlaceholder = "Don't have an account?";

  // Validation
  static const loginSuccessMessage = "Login has been successful";
  static const registerSuccessMessage = "Registration has been successful";
  static const loginErrorMessage = "Error happened when trying to sign in the user:";
  static const registerErrorMessage = "Error happened when trying to sign up the user:";
  static RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_.-]*$');
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp passwordRegex = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');

  // notifications
  static const channelId = 'channel id';
  static const channelName = 'channel name';
  static const channelDescription = 'channel description';

}