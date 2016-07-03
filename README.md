Uptime Robot - Slack to Twilio SMS
============

[Uptime Robot](uptimerobot.com) is a great monitoring service. They allow you to get notified via slack and email for free, but charge pretty heavily for SMS alerts. 

This script can be used to send you SMS alerts via [Twilio](https://www.twilio.com/). To receive 100 alerts, it will cost you 75 cents from Twilio. Uptime Robot would charge $25.

You need:

  * A [Twilio](https://www.twilio.com/) account setup, with a purchased phone number ($1.00/mo)
  * An [Uptime Robot](uptimerobot.com) account setup.
  * A [Slack](https://slack.com/) account and channel setup.



Installation (Debian/Ubuntu)
------------------------------------

1. Clone this repo into your home directory.
2. Setup your SlackBot and give him a name: https://my.slack.com/services/new/bot
3. Open `slack-uptime-robot.rb` and update these variables with your own values:

    @twilio_sid = 'TWILIO_SID'
    
    @twilio_auth_token = 'TWILIO_AUTH_TOKEN'
    
    @twilio_from_phone = '+15125557890'	
    
    @notify_phone = '+15125551234'
    
    @slack_token = 'SLACK_TOKEN'					
4.  open `ubuntu-debian/etc/init/slack-uptime-robot.conf` and update this path to the full path you are using: `exec /path/to/slack-uptime-robot/slack-uptime-robot.rb`
5. copy the file to `/etc/init/slack-uptime-robot.conf`
6. run `service slack-uptime-robot start`
7. Now, log into Slack, join the channel where you are receiving the UptimeRobot alerts, and type `hi @SLACKBOT_NAME` (replace SLACKBOT_NAME with whatever you named your robot). You should get a message saying that @SLACKBOT_NAME needs to be invited to the room, so click the link that will send him the invite.
8. Now you shoud see `joined #channel by invitation from @yourname`. Congrats, your bot is now in the room.
9. You can manually test the bot by typing `Monitor is DOWN` into slack and hitting enter. The bot should respond by saying `I've sent a text to NOTIFY_PHONE`. If so, congrats! You should receive the text.

Debugging
------------------------------------
If there's a problem, you can view the log in `/var/log/upstart/slack-uptime-robot.log`