# User Notification

## Demo Description
Updating User's Location in both foreground and background at every 6 seconds . 

Will send User Notifications [.alert, .badge, .sound] after turing off the screen.

- import: UserNotifications

- User Notification Authorizaziont: UNUserNotificationCenter.current( ).requestAuthorization( optins: [.alert, .badge, .sound] )

- Setting Notification Content: UNMutableNotificationContent( )
- Adding Content to the Request: UNNotificationRequest( identifier: content: trigger: )
- Adding Request: UNUserNotificationCenter.current( ).add(request)

- Post User Notification 
