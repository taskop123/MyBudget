import 'dart:math';

import 'package:intl/intl.dart';

class Constants {
  static const blankString = '';
  static const keyString = 'key';
  static const zero = '0.0';
  static const statusString = 'status';
  static const okStatus = 'OK';

  // Titles
  static const applicationTitle = "MyBudget";
  static const loginTitle = "Sign In";
  static const registrationTitle = "Sign up";
  static const profileTitle = "Profile";
  static const settingsTitle = "Settings";
  static const privacyPolicyTitle = "Privacy Policy";
  static const contactTitle = "Contact";
  static const aboutTitle = "About";
  static const locationTitle = 'Our Location';
  static const notificationTitle = 'my.budget';
  static const homeTitle = 'Home';
  static const helpTitle = 'Help';
  static const statisticsTitle = 'Statistics';
  static const pieChartTitle = 'Pie chart';
  static const visualisationsTitle = 'Visualisations';
  static const cameraTitle = 'Take a picture';
  static const displayImageTitle = 'Display Image';

  // Routes
  static const loginRoute = '/auth/login';
  static const registerRoute = '/auth/register';
  static const mainRoute = '/home';
  static const profileRoute = '/home/profile';
  static const contactRoute = '/home/contact';
  static const contactLocationRoute = '/home/contact/location';
  static const helpRoute = '/home/help';
  static const expensesListRoute = '/home/expenses/list';
  static const expensesAddRoute = '/home/expenses/add';
  static const cameraRoute = '/home/camera';
  static const displayImageRoute = '/home/camera/display';
  static const statisticsRoute = '/home/statistics';
  static const pieChartRoute = '/home/pie-chart';

  // Config
  static const databaseUrl =
      'https://my-budget-6f1a1-default-rtdb.europe-west1.firebasedatabase.app/';
  static const storageProfilePicturesUrl = 'profile-pictures/';

  // Form
  static const usernamePlaceholder = 'Enter your username';
  static const emailPlaceholder = 'Enter your email address';
  static const passwordPlaceholder = 'Enter your password';
  static const emailValidation = 'Please enter a valid email address.';
  static const usernameValidation = 'Please enter a valid username.';
  static const passwordValidation = 'Please enter a valid password.';
  static const submitButtonPlaceholder = 'Submit';

  // Images
  static const logoUrl = 'assets/images/logo.jpg';
  static const avatarUrl = 'assets/images/profile-avatar.jpg';
  static const launcherUrl = '@mipmap/ic_launcher';

  // Buttons
  static const loginButtonPlaceholder = "Already have an account?";
  static const registerButtonPlaceholder = "Don't have an account?";

  // Validation
  static const loginSuccessMessage = "Login has been successful";
  static const registerSuccessMessage = "Registration has been successful";
  static const loginErrorMessage =
      "Error happened when trying to sign in the user:";
  static const registerErrorMessage =
      "Error happened when trying to sign up the user:";
  static const dateTimeErrorMessage = 'Date and time field is Required';
  static RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_.-]*$');
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp passwordRegex =
      RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$");
  static RegExp numbersRegex = RegExp('[^0-9.]+');

  // Notifications
  static const channelId = 'channel id';
  static const channelName = 'channel name';
  static const channelDescription = 'channel description';

  // Location and Maps
  static const googleAPIKey = 'AIzaSyBGXGVfNRITc74ApP-elhp9gPj9GasUBjI';
  static const googleAPIError =
      'Error occurred when trying to access the Google Maps API';
  static const googleAPIUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  static const routesPlaceholder = 'routes';
  static const boundsPlaceholder = 'bounds';
  static const northeastPlaceholder = 'northeast';
  static const southwestPlaceholder = 'southwest';
  static const latitudePlaceholder = 'lat';
  static const longitudePlaceholder = 'lng';
  static const distancePlaceholder = 'distance';
  static const durationPlaceholder = 'duration';
  static const textPlaceholder = 'text';
  static const legsPlaceholder = 'legs';
  static const overviewPolylinePlaceholder = 'overview_polyline';
  static const pointsPlaceholder = 'points';
  static const originPlaceholder = 'origin';
  static const destinationPlaceholder = 'destination';
  static const directionsPlaceholder = 'Directions to our location';

  // Contact
  static const contactTextPlaceholder = 'Get in touch with us:';
  static const contactEmail = 'mybudget@info.com';
  static const contactFacebook = 'https://www.facebook.com/MyBudget';
  static const contactInstagram = 'https://www.instagram.com/MyBudget';
  static const contactLinkedIn = 'https://www.linkedin.com/in/MyBudget';
  static const profileContentPlaceholder = 'MyBudget User';

  // Help
  static const stepOneTitle = 'Step 1: Authentication';
  static const stepTwoTitle = 'Step 2: Register your bill';
  static const stepThreeTitle = 'Step 3: Confirm the product listing';
  static const stepFourTitle = 'Step 4: View visualisations and statistics';
  static const stepFiveTitle = 'Thank you!';
  static const stepOneBody = 'Register into the application and sign in.';
  static const stepTwoBody =
      'Click on the bottom right `Add` icon and take a picture of your bill.';
  static const stepThreeBody =
      'Review the products of your bill and make changes if you need to. Then, confirm the bill registration.';
  static const stepFourBody =
      'Review the visualisations and statistics we are making from your bill tracking to get a better understanding of your spendings.';
  static const stepFiveBody =
      'We hope you find this application useful and it helps you not spend as much time thinking about everyday things.';
  static const stepOneImage = 'assets/images/step-1-authentication.png';
  static const stepTwoImage = 'assets/images/step-2-register-a-bill.png';
  static const stepThreeImage =
      'assets/images/step-3-confirm-product-listing.png';
  static const stepFourImage =
      'assets/images/step-4-visualisations-statistics.png';
  static const stepFiveImage = 'assets/images/step-5-thank-you.png';
  static const finishButton = 'Finish';
  static const nextButton = 'Next';
  static const backButton = 'Back';

  // Expenses
  static const notesPlaceholder = 'Notes';
  static const dateTimePlaceholder = 'Date and Time';
  static const categoryPlaceholder = 'Choose category';
  static const pricePlaceholder = 'Enter price in';
  static const locationSelectorPlaceholder = 'Select Location';
  static const unknownPlaceholder = 'Unknown';
  static const newExpensePlaceholder = 'New expense';
  static const expensesSpentPlaceholder = 'Spent: ';
  static const expensesTodaySpentPlaceholder = 'Today Spent: ';
  static const expensesEmptySpentPlaceholder = 'No expenses have still been stored';
  static const expensesPieChartPlaceholder = 'There is still no fetched data about expenses';

  static const List<String> categories = [
    'Food',
    'Clothing',
    'Fruits',
    'Shopping',
    'Transportation',
    'Home',
    'Travel',
    'Wine',
    'Bills',
    'Gift',
    'Education',
    'Vegetables',
    'Snacks',
    'Telephone',
    'Baby',
    'Sport',
    'Tax',
    'Electronics',
    'Health',
    'Entertainment',
    'Car',
    'Social',
    'Insurance',
    'Office',
    'Book',
    'Cigarette',
    'Pet',
    'Beauty',
  ];

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  static final DateFormat mainDateFormat = DateFormat("yyyy-MM-dd HH:mm");
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  static final DateFormat formatWithMonthName = DateFormat("MMMM dd, yyyy");
}
