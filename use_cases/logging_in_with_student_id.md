## Logging in With Student ID/Account (done by Armen Merzaian)

### Actor (User)
Student/Faculty with a valid Seneca College account that is linked to the College's Microsoft services.

### Pre-conditions
The application is running, and the user has a valid authentication account.
No additional account creation is required because all authentication will go through Microsoft Identity Platform

### Main Flow
1. The User clicks on the **Login** button on the landing page of the application.
2. The system calls on Microsoft Identity api (with a application id and a redirect URI) to display a login form with the College's logo and branding.
3. The User enters their correct information and clicks **Login**.
4. The system and api will fetch and authenticate the User's identity, and return the user's username, email, and authentication token(s).
5. The system will display the routes and pages that are authentication only allowing the user to access the full features of the application.
6. The User has full access to the app and its features.

### Alternate Flows
- If any connection issues arise, preventing the login request to be sent before it times out: 
  1. The system will add an error message to the modal, warning the user that due to a connection error, they can not be logged in.
- If the User enter's the wrong login information:
  1. The authentication request will be sent using Microsoft Identity Platform which will reject the request with a 400, 401, 403 error code.
  2. The login form provided by Microsoft Identity Platform API will display a login error and prompt to retry.  
- If the User is logging in for the first time:
  1. Once authentication has been granted the system will create a new user object with the full name, and email address of the User and persist this in storage.

### Postconditions
After a User has succesfully authenticated, the system will grant them access to the full features of the application. 
