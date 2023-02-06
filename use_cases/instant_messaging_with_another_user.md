## Instant Messaging with Another User (done by Shrey Makhesana)

### Actor (User)
Student/Faculty with a valid Seneca College account that is linked to the College's Microsoft services.

### Pre-conditions
The application is running, and the user has a valid authenticated account.
The user should be logged in the application.

### Main Flow
1. The User clicks on the ***Messaging*** button on the landing page of the application
2. The User search the recipient of the message through the search bar on the top
3. The User selects the recipient from the list of other users.
4. The User composes the text/emojis or upload a files of size upto 10mb on to the compose area
5. The User clicks on the ***Send*** button
6. The message/file is send to the server through a ***API call***
7. At Back-end, it creates ***Temporary Data Structure*** to store the message/file until it is updated in the databases 
8. When the database is updated it triggers an ***API call*** which send a notification to the recipient that they have received a new message 

### Alternate Flows
- The User already have the recipient in the chat list:
  1. the user skips the step 2 of the ***Main Flow***
- The User cannot find the recipient in the list:
  1. The Front-end pop up an error saying that "The User that they are trying to find is not in the system. Try with a different name."
  2. The User either try again of search for someone else
- The file is too large to send:
  1. The Front-end pop up an error saying that "The file is to large to share."

### Postconditions
User will successfully send a text/emojis or files of size upto 10mb to other users.
