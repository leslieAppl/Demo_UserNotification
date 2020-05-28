# User Notification

## Demo Description
Updating User's Location in arround every 5 seconds in both foreground and background. 

When turn off the screen sending User Notifications [.alert, .badge, .sound] in arround every 5 seconds.

- import: UserNotifications

- User Notification Authorizazion: UNUserNotificationCenter.current( ).requestAuthorization( optins: [.alert, .badge, .sound] )

- Setting Notification Content: UNMutableNotificationContent( )
- Adding Content to the Request: UNNotificationRequest( identifier: content: trigger: )
- Adding Request: UNUserNotificationCenter.current( ).add(request)

- Post User Notification 
