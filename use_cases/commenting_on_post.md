## Commenting on Post (done by Matthew Maghakian)

### Actor (User)
Student/Faculty with a valid Seneca College account that is linked to the College's Microsoft services.

### Pre-conditions
The application is running, and the user has successfully logged into the system with a valid authenticated account.

### Main Flow
1. The User clicks on the **Programs** button on the landing page of the application.
2. The System's api will fetch the list of accessible programs for the user's account, and display it.
4. The User selects the program feed they would like to access.
5. The User locates a post they would like to comment on, and navigate to the **Add Comment** button for it.
6. The System prompts a text field modal for the user to compose their message within.
7. The User composes their message.
8. The User clicks the **Post** button, and the comment modal disappears from the User's screen.
9. The System persists the new comment in its database and updates the post, allowing all users to interract.

### Alternate Flows
- If the user instead selects the **Cancel** button rather than posting:
  1. The system will close the comment modal and will not save the user's text, no further action is taken by the system.
- If the database, or the user's internet experience a connection issue:
  1. The system will alert the user with an error message in the comment modal.
- If the message is too long, or uses unsopported characters/language:
  1. The system will alert the user with an appropriate format error message in the comment modal.

### Postconditions
After the User successfully posts their comment, it will be stored in the database and appear in the comment section of the post it was made for.
The post's comment count will be updated.
