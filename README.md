# JMOCNP
![alt text](https://github.com/J216/simple_tag_replace/raw/master/jsi-logo-256.png "JSI Logo")
MOC is a music player for Linux that allows you to play your music from the console, using notify-send I have created a script that can watch what is currently playing and create an on screen notification of the artist and title and station, this is not perfect, but it works well if you are listening to somaFM or other stations with similar formatting of URL and current song info. If it doesn't work for you comment and I will see if I can make changes to help you get what you want out of this.

# Description
This is a bash script for showing what is currently playing in Music On Console(MOC)

Requirements:
```bash
sudo apt-get install recode notify-send moc
```
EXAMPLE USAGE:
```bash
./jmocnp                # check currently playing easily, good for adding a button to check anytime
./jmocnp -l > /dev/null # silentmode to monitor for new song, leave running
```
# Screenshot of the notification
![alt text](https://raw.githubusercontent.com/J216/jmocnp/master/jmocnp-screenshot.png "JSI Logo")

# Check out the demo on YouTube
[![JMOCNP - Now Playing Notifications for Music On Console(MOC)](https://raw.githubusercontent.com/J216/jmocnp/master/jmocnp-youtube.png)](http://www.youtube.com/watch?v=WL3fZLfNSwY "JMOCNP - Now Playing Notifications for Music On Console(MOC)")
