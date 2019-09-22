# jmocnp
Now Playing GUI notification for Music On Console(MOC) using notify-send, new notification every time the song changes

![alt text](https://github.com/J216/simple_tag_replace/raw/master/jsi-logo-256.png "JSI Logo")

[![JMOCNP - Now Playing Notifications for Music On Console(MOC)](https://raw.githubusercontent.com/J216/jmocnp/master/jmocnp-youtube.png)](http://www.youtube.com/watch?v=WL3fZLfNSwY "JMOCNP - Now Playing Notifications for Music On Console(MOC)")

# simple_tag_replace
This is a Python3 script for simply replacing tags in a template with user entered input

Requirements:
```bash
sudo apt-get install python3-pil python3-pil.imagetk
```

Here is an example of a template file using tags starting with `<` and closing with `>` name `template.txt`:
```bash
The quick red <noun1>
jumped over the <noun2>.
```
EXAMPLE USAGE:
```bash
python3 tagReplaceGUI.py
```
A window will open and from the file menue pick the template you want to use by click File --> Open and then selecting an apropriately formated template. Everything between `<` and `>` will be give a lable and a text input box. If the file contains html code this will cause it to recognize all tags, not just the ones you want to replace.

Here is an example of what will appear in the tkinter window from opening the above `template.txt`
* |noun1 | - - - | 
* |noun2 | - - - | 

If you fill the box like this:
* |noun1 | fox |
* |noun2 | dog |

And then click File --> Save and use the file dialog name our file `fox.txt` the output will to the file will be:
```bash
The quick red fox
jumped over the dog.
```
![alt text](https://raw.githubusercontent.com/J216/jmocnp/master/jmocnp-screenshot.png "JSI Logo")
