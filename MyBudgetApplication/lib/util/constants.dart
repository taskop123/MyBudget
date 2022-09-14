import 'dart:math';

import 'package:intl/intl.dart';

/// Class for all constant variables used in our application.
/// Each of the variable names are descriptive for their purpose.
class Constants {
  /// Default values placeholders.
  static const blankString = '';
  static const keyString = 'key';
  static const zero = '0.0';
  static const statusString = 'status';
  static const okStatus = 'OK';
  static const monthPlaceholder = 'month';
  static const yearPlaceholder = 'year';
  static const dollarPlaceholder = 'USD';
  static const warningPlaceholder = 'Warning';
  static const editPlaceholder = 'edit';
  static const deletePlaceholder = 'delete';

  /// Titles for the screens in our app.
  static const applicationTitle = "MyBudget";
  static const loginTitle = "Sign In";
  static const loginGoogleTitle = "Google";
  static const registrationTitle = "Sign up";
  static const signOutTitle = "Sign Out";
  static const logoutTitle = 'Logout';
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
  static const detailsTitle = 'Expense Details';

  /// Routes for the navigation through the screens in our app.
  static const loginRoute = '/auth/login';
  static const registerRoute = '/auth/register';
  static const mainRoute = '/home';
  static const profileRoute = '/home/profile';
  static const contactRoute = '/home/contact';
  static const contactLocationRoute = '/home/contact/location';
  static const helpRoute = '/home/help';
  static const expensesListRoute = '/home/expenses/list';
  static const expensesAddRoute = '/home/expenses/add';
  static const receiptAddRoute = '/home/receipt/add';
  static const expensesDetailsRoute = '/home/expenses/details';
  static const cameraRoute = '/home/camera';
  static const displayImageRoute = '/home/camera/display';
  static const statisticsRoute = '/home/statistics';
  static const pieChartRoute = '/home/pie-chart';
  static const settingsRoute = '/home/settings';

  /// Config variables.
  static const databaseUrl =
      'https://my-budget-6f1a1-default-rtdb.europe-west1.firebasedatabase.app/';
  static const storageProfilePicturesUrl = 'profile-pictures/';

  /// Form text input placeholders
  static const usernamePlaceholder = 'Enter your username';
  static const emailPlaceholder = 'Enter your email address';
  static const passwordPlaceholder = 'Enter your password';
  static const emailValidation = 'Please enter a valid email address.';
  static const usernameValidation = 'Please enter a valid username.';
  static const passwordValidation = 'Please enter a valid password.';
  static const submitButtonPlaceholder = 'Submit';
  static const cancelButtonPlaceholder = 'Cancel';
  static const monthlyIncomePlaceholder = 'Set your monthly income';
  static const progressDialogPlaceholder = 'Uploading...';
  static const areYouSurePlaceholder =
      'Toggling this feature will make significant changes to the application flow. Are you sure you want to proceed?';
  static const snackBarPlaceholder =
      'Please allow user profile modification to change this data';
  static const snackBarValidityPlaceholder =
      'Please enter valid data in the input form';

  /// Image paths that are used in our application.
  static const logoUrl = 'assets/images/logo.jpg';
  static const googleLogoUrl = 'assets/images/google_logo.png';
  static const facebookLogoUrl = 'assets/images/facebook_logo.png';
  static const avatarUrl = 'assets/images/profile-avatar.jpg';
  static const launcherUrl = '@mipmap/ic_launcher';

  /// Buttons text placeholders.
  static const loginButtonPlaceholder = "Already have an account?";
  static const registerButtonPlaceholder = "Don't have an account?";

  /// Validation text placeholders and regular expressions.
  static const loginSuccessMessage = "Login has been successful";
  static const registerSuccessMessage = "Registration has been successful";
  static const loginErrorMessage =
      "Error happened when trying to sign in the user:";
  static const registerErrorMessage =
      "Error happened when trying to sign up the user:";
  static const dateTimeErrorMessage = 'Date and time field is Required';
  static RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_.-]*$');
  static RegExp doubleRegex = RegExp(r'\d+');
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp passwordRegex =
      RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$");
  static RegExp numbersRegex = RegExp('[^0-9.]+');
  static RegExp lettersRegex = RegExp(r'[^0-9.]');

  /// Notifications placeholders.
  static const channelId = 'channel id';
  static const channelName = 'channel name';
  static const channelDescription = 'channel description';
  static const negativeAdviceMessage =
      'Try to keep down your spending and keep track of your expenses!';
  static const positiveAdviceMessage =
      'You are on your track! You do good job keeping tracking of your expenses!';
  static const darkModeEnabled = 'isDarkMode';

  /// Location and Maps variables for the Google Maps API
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

  /// Settings variables
  static const notificationsPlaceholder = 'Notifications';
  static const monthlyNotificationsPlaceholder = 'Enable monthly notifications';
  static const yearlyNotificationsPlaceholder = 'Enable yearly notifications';
  static const updateProfilePlaceholder = 'Update profile';
  static const themeDarkPlaceholder = 'Theme Dark';

  /// Contact variables used as placeholders.
  static const contactTextPlaceholder = 'Get in touch with us:';
  static const contactEmail = 'mybudget@info.com';
  static const contactPaypal = 'https://paypal.me/mybudget';
  static const contactAddress = 'Ruger Boshkovikj 16, Skopje 1000';
  static const contactDescription =
      'This is a PDF document export of your expenses generated by the \'MyBudget\' application. It is supposed to help you document your spendings in a more conventional fashion, if you wish to do so. If you have any questions, inquiries or suggestions, we will be glad to talk to you. You can use the social media links or the official email address.';
  static const contactFacebook = 'https://www.facebook.com/MyBudget';
  static const contactInstagram = 'https://www.instagram.com/MyBudget';
  static const contactLinkedIn = 'https://www.linkedin.com/in/MyBudget';
  static const profileContentPlaceholder = 'MyBudget User';
  static const monthlyIncomeTextPlaceholder = '[Monthly Income]';
  static const monthlyPlaceholder = 'Monthly';
  static const dailyPlaceholder = 'Daily';
  static const allTimePlaceholder = 'All Time';
  static const unknownAddressPlaceholder = 'Unknown address';
  static const noExpenseNotesPlaceholder = '[No expense notes]';

  /// Help variables used as placeholders.
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

  /// Document specific constants
  static const exportTitlePlaceholder = 'EXPENSES';
  static const exportPdfPlaceholder = 'Export PDF';
  static const exportEmailPlaceholder = 'Email';
  static const exportAddressPlaceholder = 'Address';
  static const exportPaypalPlaceholder = 'Paypal';
  static const exportIncomePlaceholder = 'Monthly income';
  static const exportTotalAmountPlaceholder = 'Total amount';
  static const exportInfoPlaceholders = <String>['Contact:', 'Date:'];

  /// Visualizations specific constants
  static const marchGraphPlaceholder = 'Mar';
  static const juneGraphPlaceholder = 'Jun';
  static const septemberGraphPlaceholder = 'Sep';
  static const zeroThousandGraphPlaceholder = '0k';
  static const oneThousandGraphPlaceholder = '1k';
  static const twoThousandGraphPlaceholder = '2k';
  static const threeThousandGraphPlaceholder = '3k';
  static const fourThousandGraphPlaceholder = '4k';
  static const fiveThousandGraphPlaceholder = '5k';
  static const sixPlusThousandGraphPlaceholder = '6k+';

  /// Expenses variables used as placeholders.
  static const companyNamePlaceholder = 'Company name';
  static const companyAddressPlaceholder = 'Company address';
  static const storeAddress = 'Store address';
  static const totalPricePlaceholder = 'Total cost';
  static const totalPriceInMKDPlaceholder = 'Total in MKD';
  static const totalPriceInUSDPlaceholder = 'Total in \$';
  static const notesPlaceholder = 'Notes';
  static const dateTimePlaceholder = 'Date and Time';
  static const chooseCategoryPlaceholder = 'Choose category';
  static const categoryPlaceholder = 'Category';
  static const pricePlaceholder = 'Enter price in';
  static const locationSelectorPlaceholder = 'Select Location';
  static const unknownPlaceholder = 'Unknown';
  static const newExpensePlaceholder = 'Add/Edit Expense';
  static const newReceiptPlaceholder = 'Add Receipt Expense';
  static const expensesSpentPlaceholder = 'Spent: ';
  static const expensesTodaySpentPlaceholder = 'Today Spent: ';
  static const expensesEmptySpentPlaceholder =
      'No expenses have still been stored';
  static const expensesPieChartPlaceholder =
      'There is still no fetched data about expenses';
  static const carouselItemOneImage = 'assets/images/carousel_banner_1.png';
  static const carouselItemTwoImage = 'assets/images/carousel_banner_2.png';
  static const carouselItemThreeImage = 'assets/images/carousel_banner_3.png';

  /// Placeholder lists of UI elements and models.
  static const List<String> categories = [
    'Food',
    'Groceries',
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
  static const List<String> documentHeaders = [
    'Category',
    'Notes',
    'Date & Time',
    'Address',
    'Price'
  ];

  /// Constant list of letters and numbers used to randomly generate an id.
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  /// Generates a random id string with the specified [length].
  static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  /// Date Time Formats used to format the dates in our application.
  static final DateFormat mainDateFormat = DateFormat("yyyy-MM-dd HH:mm");
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  static final DateFormat formatWithMonthName = DateFormat("MMMM dd, yyyy");
}
