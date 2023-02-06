# Seneca Social Connection Platform
## 1. Introduction
We are creating a *Social Connection* platform for Seneca Students and Alumni. 
On our platform we will recommend students to *connect with other students from their program*. 
Students will also be able to search, discover, and connect with students from *other program and other campuses*. 
Users will be able to create and share posts and events on our platform. 
Students will be redirected to respective services provided by Seneca.
Students can access information about events hosted by Seneca College using the school's RSS feeds.

*May 19th, 2022*

*Current Version: 1.0*

*Project Manager: Armen Merzaian*

## 2. Overview 
Our Team is developing a platform for students and alumni where they can connect and express with other students from their or different program and campuses, and also provide information and access to events and services provides by Seneca.


## 3. Milestones
1. Research and list a stack of technologies to use for Front-End, Back-End, Databases, Hosting, and Tooling: [Technical Details](https://github.com/CAPSTONE-2022-2023/Group_12/blob/main/technical_details.md)
2. Application front-end designed with reusable components following modern design practices. Application back-end designed for scaling data with low time complexity
3. With the application front-end UI a text/emojis messages or files of size upto 10mb will be routed from back-end server to other users front-end UI
4. Front-end will have an option to create a instant messaging group with other users, in which the back-end will create a data structure where important information about the group will be stored
5. Back-end will allow creation of posts, Front-end will have all posts and events displayed for respective programs in chronological order. Back-end will support the storage and archiving of these posts, along with API calls on the front-end for searching
6. Front-end personal feed will display latest posts on landing page using back-end api calls to all programs available to user
7. Front-end will have the button to report a post, comment on profile page and will be flagged for the admin team to review. These flagged objects can be deleted back-end if necessary.
8. Front-end will have the option for users to reset their password by SMS verification. The new password will be updated in the back-end.

## 4. Deliverables
1. Back-end server is able to recieve and respond to test calls for data. Front-end UI supports navigation, profile building, and infinite scrolling
2. Back-end server is able to authenticate and connect with the front-end via api endpoints, front-end can successfully communicate with backend
3. User will be able to send text/emojis messages or files of size upto 10mb from the front-end UI to another users
4. User will be able to make group of multiple users from the front-end
5. User will be able to make Posts on their program's feed. User will be able to make, interract, and signup for Events
6. Front-end will support a personal feed using back-end to call latest available posts
7. User will be able to report a post, comment or profile that they deem to be inappropriate, offensive or invasive.
8. User will be able to reset their password if they forget after verifying their identity through SMS and entering the valid authentication code.

## 5. Risks, Assumptions, and Constraints

### 5.1 Risks
1. Making an unexpectedly high amount of API calls to our database, which can dramatically affect operating costs and performace.
2. Third party reliance for authentication could lead to users being unable to authenticate and access their account.
3. Untested features may lead to negative user experiences or security vulnerabilities. 
4. The Team may forego maintaining once the project completes.
5. Seneca College may insitude a sanction on the project, preventing development from progressing.
6. Inadequate project management can lead to low productiviy, untested new features, and a lack of issue handling.

### 5.2 Assumptions
1. The hosting and domain services are reliable all the time
2. Seneca College does not insitude any sanctions on our project
3. Our group maintain a healthy communication so we never have any hiccups in our timeline

### 5.3 Constraints
1. The site will not have overly promotional content and will be strictly used for users sharing and communicating with others.
2. No paywall will be created for users to restrict access to certain features.
