## Create chat group of multiple users (done by Shrey Makhesana)

### Actor (User)
Student/Faculty with a valid Seneca College account that is linked to the College's Microsoft services.

### Pre-conditions
The application is running, and the user has a valid authenticated account. The user should be logged in the application. The user has loaded the messages screen on the application.

### Main Flow
1. User clicks ***more option*** button on the screen
2. The System will load the options in floting menu format on the front-end side
3. Users selects ***create a new group*** option
4. System loads the creates group UI in the front-end and on the back-end, system will fetch the list of users who is friend of the logged in users on the platform (except admin, who has access to all users list)
5. Here User will select the other users that he/she want to add in a group and click on the ***Next*** button
6. System on back-end side creates an object which stores this list of user with a unique ***Group ID*** and on the front-end the page of giving name and group profile image is loaded
7. Here user provide name and profile image of the group and then click on ***Finish***
8. System will update the their group object in back-end and successfully create a group and in front-end, system will load the chat page of the group

### Alternate Flows
- User looses it internet connection at any step:
  1. The system will show a pop up that will say that "Your internet connection is lost in cyber space." and in back-end any unsaved action will be reverted
- User select only one user to create a group with:
  1. The system will show a pop up that will say that "Sorry! you have to select more that 1 of your friends to create a group." and the step-4 will load again

### Postconditions
The User will be able to create group with multiple users.
