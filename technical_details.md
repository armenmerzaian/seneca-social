## Back-End

The Back-End web server will be built with Google's [Firebase](https://firebase.google.com/). As an IaaS, the platform allows backend development to be streamlined by providing authentication, databases, file storage and more with a developer friendly and scalable toolset. The web server will handle authentication with the help of [Microsoft identity platform](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-v2-protocols) and the [OAuth 2.0](https://oauth.net/2/) protocol. OAuth uses [JSON Web Tokens (JWT)](https://jwt.io/) under the hood for authetication. Finally, Firestore NoSQL will be used for handling all user generated data.

## Front-End

The Front-End application will be built using the [Flutter SDK](https://flutter.dev/) framekwork built for the [Dart](https://dart.dev/) programming language. Flutter supports widgets for modularity, and [Get Widget](https://www.getwidget.dev/) provides a beautiful and complete open source UI library.


## Developing Tools

Back-End is developed using [Visual Studio Code](https://code.visualstudio.com/) editor and [Thunder Client](https://www.thunderclient.com/) extension for testing API calls.
Front-End is developed using [IntelliJ IDEA 13](https://www.jetbrains.com/idea/) or similarily [Andoid Studio](https://developer.android.com/studio), both cross platform IDEs which have fully native support for the Flutter SDK. 
