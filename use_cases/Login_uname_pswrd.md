## Login via Username & Password (done by Matthew Maghakian)

### Actor (User)
Student/Faculty with a valid Seneca College account that has already been initialized in the Database.

### Pre-conditions
The application is running, and the user has a valid authentication account.
The system is able to query user data, and use CRUD operations.

### Main Flow
1. The User clicks **"Login with Username"** on the landing page (not logged in)
2. The System redirects the user to a form page for logging in with a username and password field.
3. The User fills in the fields for the form successfully, and submits using the button; **Login**.
4. The System checks and validates that the user has filled both fields.
5. The System API fetches the user's username and hashed password. It will authenticate using a comparisson of the entered information, and return true.
6. The System authenticates and authorizes the user that is now logged in.
7. The System API fetches the user's profile picture and name to be displayed in the account section.
7. The User is alterted that they have been successfully logged in.


### Alternate Flows
- The user does not provide a correct username and/or password:
  1. The system will alert the user that the information entered is incorrect.
  2. The **Forgot your password**, and **Forgot your username** buttons will be highlighted on the page.
- If the user submits too many incorrect attempts in a short time:
  1. The system will require a captcha test for further login attempts:
- If the user exceeds the login attempt limit: 
  1. The System will deny requests from the user for a set period of time.
  2. The System will alert the user that they must wait **x** amount of time to attempt again.

### Postconditions
After a User has succesfully authenticated, the system will grant them access to the full features of the application.