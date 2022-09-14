# MyBudget
-----------------------------------------------------------------------------------
## Cross Platform Application made by Tashko Pavlov && Nikola Stanojkovski
----------------------------------------------------------------------------------

<b>MyBudget</b> is a mobile application that tracks all financial transactions for a given user and helps people save money by keeping track of their expenses. 
<br/>

We live in a world where money is the most crucial factor for surviving. How many times have you asked yourself, "Where did all my money go?". Don’t worry, you
are not the only one, since we all have many obligations throughout the day so we can earn our salary and create a normal life for ourselves. After finishing all your work, the only thing you don't want to do is organize your financial spending. 
<br/>
For this particular reason, we created an app that will assist you in organizing and tracking your expenses, reviewing them in a sorted and grouped manner, as well as creating visualizations with that data. <br/>

The technology used to implement the system is <b>Flutter</b> as a main mobile application framework, and the <b>Firebase</b> service as a main back-end tool for authentication, non-relational database and file storage. <b>Tesseract OCR</b> is used as a neural net (LSTM) based OCR engine used for recognition of the bills through taking a picture from the user's camera.
<br/>

The folder <b>MyBudgetApplication</b> constains the fully documented code for the application.
<br/> <br/> <br/>
The application has the following 14 screens for version 2.0.0:
<br/>
- <b>Login screen</b>, authenticates a user with a valid email address and password, and then redirects him to the <b>Home screen</b> where he can see his expenses. The screen also offers the option for <b>Facebook</b> and <b>Google</b> OAuth authentication.
- <b>Registration screen</b>, creates a new user with a valid email address, username and password, and then redirects him to the <b>Login screen</b> for authentication.
- <b>Home screen</b>, displays the complete list of expenses for the currently logged in user along with the 'Edit' and 'Delete' functionality for each of them, as well as the button for adding a new expense manually or through taking a picture.
- <b>Line Chart screen</b>, displays line chart statistics for the expense spendings in dollars throughout the last few months.
- <b>Pie Chart screen</b>, displays pie chart statistics for expense spendings broken down into categories, allowing the user to discover on which things he spends the most money on.
- <b>New Expense screen</b>, creates a new expense for the currently logged in user and adds it to the list, with a valid price in $, date and time in the device’s local format, notes about the expense, category, which can be chosen from a dropdown of constants and the location where it was made.
- <b>Camera Capture screen</b>, opens the front camera on the user's smartphone and displays a button in the bottom corner that allows him to take a picture. To gain access to the camera, the user must grant permission to the application.
- <b>New Automatic Expense screen</b>, displays the expense details which were extracted from the taken picture on the <b>Camera Capture screen</b> and enables the user to modify the information, if needed.
- <b>Expense Details screen</b>, displays the information of the given expense with a valid price in $, date and time in the device’s local format, notes about the expense, category, which can be chosen from a dropdown of constants and the location where it was made.
- <b>Profile screen</b>, displays the currently logged in user’s information such as username, email address, monthly, yearly and daily spendings, a possibility for input of the monthly income, as well as the profile picture.
- <b>Contact screen</b>, displays the contact information for the company, including the official email address, the pages across the social media such as Facebook, Instagram and LinkedIn, as well as its location.
- <b>Our Location screen</b>, displays a ‘Google Maps’ widget with a marker to the company’s headquarters.
- <b>Help screen</b>, displays a visual series of steps that demonstrate how one user should use the application properly.
- <b>Settings screen</b>, displays 4 toggles which enables the user to personalize his preferences:
  - 'Enable monthly notifications' toggle
  - 'Enable yearly notifications' toggle
  - 'Update profile' toggle
  - 'Theme Dark' and 'Theme Light' toggle
