# User Notification

## Demo Description
Notifying User current location at every 5 seconds with [.alert, .badge, .sound]. User Location works in the backgournd process.

- import: UserNotifications

- User Notification Authorizaziont: UNUserNotificationCenter.current( ).requestAuthorization( optins: [.alert, .badge, .sound] )

- Setting Notification Content: UNMutableNotificationContent( )
- Adding Content to the Request: UNNotificationRequest( identifier: content: trigger: )
- Adding Request: UNUserNotificationCenter.current( ).add(request)

- Post User Notification 
