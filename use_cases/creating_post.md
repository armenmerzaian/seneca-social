## Creating A Post (done by Matthew Maghakian)

### Actor (User)
Student/Faculty with a valid Seneca College account that is linked to the College's Microsoft services.

### Pre-conditions
The application is running, and the user has successfully logged into the system with a valid authenticated account.

### Main Flow
1. The User clicks on the **Programs** button on the landing page of the application.
2. The User selects the program feed they would like to post to from a list of accessible programs.
3. The User selects the **Create Post** button on the main [program_name] feed page of the application.
4. The User composes the post including all formatting and media attachments necessary. The maximum size of these media attachments is 10mb.
5. The User presses the **Submit** button on the page.
6. The Server saves the post as a file through a backend API call.
7. The Server updates the database, and adds the file to the selected program's feed. The post will now appear whenever a user views that program's feed.
8. The Server sends notifications through an API call to all Users with notifications active for the application.
9. The User will get a Success Message.
10. The User will see their new post at the top of their feed.

### Alternate Flows
- The user's post is too large of a file size / goes over the maximum characters (not yet determined):
  1. The system will alert the user of the post restrictions and ask them to edit their post before returning them to the composition page.
- The user adds an image or gif too large or in an unsupported format:
  1. The system will alert the user of the media restrictions and remove the media from the composition of the post.
- The user uses profane language in their post:
  1. The system will alert the user of the media/language restrictions and demand they make changes before being allowed to post.
- The user clicks **delete message**:
  1. The composed post is removed and the user is returned to the previous page.
- The user does not **submit**, and does not **delete**
  1. The user is returned to the previous page.
  2. The system alerts the user that their post was saved as a draft, and a temporary file is created allowing the user to re-open a new post starting where they left off.
  
### Postconditions
After the user submits their post, it will be stored in the application server and displayed in the program's feed for all of it's users.
