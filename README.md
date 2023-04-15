#1. Login screen with validation in Flutter and SQLite storage
This is a sample Flutter app that demonstrates how to implement a login screen with validation in Flutter. The screen has two text fields, one for the username and another for the password. The password field is obscured. The validation ensures that both fields are not empty and that the password is at least 8 characters long. If either of these conditions are not met, an error message is shown below the relevant text field. The app uses SQLite for credentials storage.

Getting Started
To run the app, clone this repository and open it in your preferred code editor. Run flutter pub get to install the required dependencies.

Open the lib/main.dart file and replace the database name with your own database name. You can also modify the validation rules by changing the validateInputs() function.

Screenshots
Screenshot 1

#2. News app in Flutter using NewsAPI and Dio library
This is a sample Flutter app that demonstrates how to implement a news app in Flutter using NewsAPI and the Dio library. The app fetches news articles from the NewsAPI and displays them in a list view. Users can tap on a news article to view its details in a separate screen.

Getting Started
To run the app, you will need to sign up for a NewsAPI key at https://newsapi.org/. Once you have your NewsAPI key, open the lib/main.dart file and replace the apiKey variable with your own API key.

Then, clone this repository and open it in your preferred code editor. Run flutter pub get to install the required dependencies.

Screenshots
Screenshot 1
Screenshot 2

#3. Chat interface in Flutter with Firebase Realtime Database
This is a sample Flutter app that demonstrates how to implement a chat interface in Flutter that supports real-time messaging using Firebase Realtime Database. The app allows users to send and receive messages in real-time.

Getting Started
To run the app, you will need to set up a Firebase project and enable Firebase Realtime Database. Follow these steps:

Create a new Firebase project in the Firebase console.
Add a new Android app to the project, and follow the instructions to download the google-services.json file.
Add a new iOS app to the project, and follow the instructions to download the GoogleService-Info.plist file.
Enable Firebase Realtime Database in the Firebase console.
Next, clone this repository and open it in your preferred code editor. Run flutter pub get to install the required dependencies.

Open the lib/main.dart file and replace the Firebase configuration with your own Firebase configuration. You can find your Firebase configuration in the Firebase console under Project settings > General > Your apps.

Firebase Realtime Database Structure
The Firebase Realtime Database structure for this chat app should look like this:

markdown
Copy code
- chats
  - {chatId}
    - messages
      - {messageId}
        - senderId
        - senderName
        - text
        - timestamp
    - users
      - {userId}
        - name
The chats node stores all the chat rooms in the app. Each chat room is identified by a unique chatId. The messages node stores all the messages in each chat room. Each message is identified by a unique messageId. The senderId and senderName properties store the ID and name of the user who sent the message. The text property