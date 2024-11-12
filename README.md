# clickscan
![ClickScan Run Window with Red Button](https://github.com/jamjolu/clickscan/blob/master/clickScanOn.png)

ClickScan - A Windows utility that enhances a switch adapted mouse by providing auto-scan and other features especially helpful for single-switch access. ClickScan sends a sequence of keystrokes to an application helping users to navigate and make choices on websites and in some applications. ClickScan is activated by clicking the red button on its small floating window, or via the ~1 keyboard sequence. This sequence permits using switch interfaces intended for iPads that offer ~1 as an option including Pretorian's Applicator or the iSwitch 75. ClickScan is an AutoHotKey based application.

ClickScan presents itself as small window with a red button that hovers over other applications. When a user clicks the red button (or the user sends the ~1 key combo) 
ClickScan starts sending a user-defined sequence of keystrokes to the most recently active application. Upon a second click ClickScan concludes the sequence and sends a second user-defined keystroke to the active application. In the case of a web browser a sequence of Tab keys will move the focus through the various buttons and links on a webpage. The Enter key will then select the focussed item. ClickScan lets you define the keystrokes needed for moving the focus and for making selections. It also lets you define the rate at which the focus moving kestroke is issued (a scan rate.) It also supports a mode where two targets can be defined. When the user clicks the red button the first target is clicked. Then after a user-defined interval a second target is clicked. This mode can be used as to create motivating cause and effect activities encouraging switch interaction an build motor skills.

New Features! 11/5/2024
ClickScan now has a new mode called "Drag Mode" to assist users who have difficulty with mouse drag and drop operations. In this mode, when activated, the user selects a start point and then an end point. ClickScan then performs the drag operation. This does not work in browsers when using touch screen (instead of a mouse) due to AutoHotkey's lack of direct support for reacting to a Pointer Down event. However, there are a couple of Windows browsers that ClickScan's Drag Mode will work with based on Webkit or Goanna - Midori, or Pale Moon:
https://astian.org/midori-browser/windows/
https://www.palemoon.org/download.shtml

Another new feature called "Alternate Trigger" that allows almost any switch interface (like Hitch, Atech, Pretorian Applicator, etc) to activate ClickScan in the same way as clicking its red button. The Alternate Trigger dropdown includes the option for using joystick or gamepad buttons.


ClickScan does not require an installation. Just unzip the ClickScan.zip and run ClickScan.exe

ClickScan was created using AutoHotKey. This repository contains:
1. cs.ini -- The setup file for ClickScan. This file must reside in the same folder as ClickScan.exe (or ClickScan.ahk.)
2. ClickScan.ahk -- The AutoHotKey source file.
3. ClickScan.exe -- The compiled AutoHotKey executable (compiled using Ahk2Exe.exe.)
4. cs.ico -- An icon for ClickScan included in the compile process.
5. media-record.png -- A red button picture used to for ClickScan's activation button. This file must reside in the same folder as ClickScan.exe or ClickScan.ahk.
