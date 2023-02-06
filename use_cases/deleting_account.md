## Deleting an Account (done by Armen Merzaian)

### Actor (User)
Student/Faculty with a valid Seneca College account that has already been initialized in the Database.

### Pre-conditions
The application is running, and the user has a valid authentication account.
The system is able to query user data, and use CRUD operations.

### Main Flow
1. The User clicks on the **Settings** wheel beside their User Profile link.
2. The app will call the system and request the profile data of the user to display on the user's profile page.
3. The User will locate and click the red **Delete Account** button at the bottom of the settings page.
4. The app will warn the user with an alert modal, and request confirmation to delete the account.
5. The user will confirm the delete request.
6. The app will redirect the user to the app's landing page and call the system to find and delete the user account.

### Alternate Flows
- If the user decides that they don't want to delete their account when asked to confirm: 
  1. The system will close the warning modal, and no futher action is taken by the system.
- If the database throws an error while trying to delete the account:
  1. The database will reject the request with a 400 or 412 error code.
  2. The system will display an error modal, with an interpretation of the error, and request that the user contact system support via email.  

### Postconditions
After a User has succesfully deleted their account, the system will no longer have their profile data persisted. 
