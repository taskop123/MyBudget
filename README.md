# MyBudget
-----------------------------------------------------------------------------------
## Cross Platform Application made by Tashko Pavlov && Nikola Stanojkovski
----------------------------------------------------------------------------------

<b>MyBudget</b> is a mobile application that tracks all financial transactions for a given user. In other words, MyBudget is an app that helps people save money by
keeping track of their expenses. <br/>

We live in a world where money is the most crucial factor for surviving. How many times have you asked yourself, "Where did all my money go?". Don’t worry, you
are not the only one, since we all have many obligations throughout the day so we can earn our salary and create a normal life for ourselves. The only thing you don’t want to do when you finish with all the work is think about the spending of your money. <br/>
For this particular reason, we created an app that will assist you in organizing and tracking your expenses, reviewing them in a sorted and grouped manner, as well as creating visualizations with that data. <br/>

The technology used to implement the system is <b>Flutter</b> as a main mobile application framework, and the <b>Firebase</b> service as a main back-end tool for authentication, non-relational database and file storage. <br/>

The folder <b>MyBudgetApplication</b> constains the fully documented code for the application.
<br/> <br/> <br/>
The application has the following 12 screens for version 1.0.1:
<br/>
- <b>Login screen</b>, authenticates a user with a valid email address and password, and then redirects him to the <b>Home screen</b> where he can see his expenses.
- <b>Registration screen</b>, creates a new user with a valid email address, username and password, and then redirects him to the <b>Login screen</b> for authentication.
- <b>Home screen</b>, displays the complete list of expenses for the currently logged in user.
- <b>Line Chart screen</b>, displays line chart statistics for the expense spendings in dollars throughout the last few months, as well as, the next couple of months.
- <b>Pie Chart screen</b>, displays pie chart statistics for expense spendings broken down into categories, allowing the user to discover which things he spends the most money on.
- <b>New Expense screen</b>, creates a new expense for the currently logged in user and adds it to the list, with a valid price in $, date and time in the device’s local format, notes about the expense, category, which can be chosen from a dropdown of constants, photo of the expense and the location where it was made.
- <b>Profile screen</b>, displays the currently logged in user’s information such as username, email address, as well as the profile picture.
- <b>Contact screen</b>, displays the contact information for the company, including the official email address, the pages across the social media such as Facebook, Instagram and LinkedIn, as well as its location.
- <b>Our Location screen</b>, displays a ‘Google Maps’ widget with directions from the user’s current location, to the company’s headquarters. Requires location permissions.
- <b>Help screen</b>, displays a visual series of steps that demonstrate how one user should use the application properly.
- <b>Camera Capture screen</b>, opens the front camera on the user's smartphone and displays a button in the bottom corner that allows him to take a picture. To gain access to the camera, the user must grant permission to the application.
- <b>Captured Image Display screen</b>, displays the picture taken in the <b>Camera Capture screen</b> with the front camera of the user’s device.
