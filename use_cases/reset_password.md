# Reset Password (done by Jacky Dai)

## Actor(User)

Student/Faculty with a valid Seneca College account that is linked to the College's Microsoft services.

## Preconditions

1. User must have account in the system.
2. User must have email address on file in the system.

## Main Flow

1. User hits the reset password button on the login view.
2. The system loads a new page to ask the user for their school email.
3. The user enters email and hits the submit button.
4. The system will send the verification code via text to the user and will load a page for the user to enter the code.
5. The user enters the verification code.
6. The system will load a new page asking for the new password and the confirmation of the new password.
7. The user enters the new password twice.
8. The database updates with the new password and the system will send an email to the user that the password had been updated.

## Alternate Flows

- The user enters an email not in the database.
 1. After step 3, the system will ask again for a valid email.
 2. After five attempts, the system will stop and show a new page telling the user to contact the account services.
- The user enteres an invalid verification code.
 1. After step 5, the system will ask again for the verification code, it will also give the user the option to resend a new code.
 2. After five attempts, the system will stop and timeout the user from resetting the password for 15 minutes.
- The user enters a new password with invalid characters or insufficient characters.
 1. After step 7, the system will ask the user to enter a new password that is within 6-12 characters and contains one capital letter, lowercase letter and symbol.

## Post Conditions

After the user has successfully reset the password, the database gets uploaded with the new information and the user will receive an email that their password has been updated.
