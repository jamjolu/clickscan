# clickscan
ClickScan - A Windows utility to enhance a switch adapted mouse to provide auto-scan and other features. ClickScan sends a sequence of keystrokes to an application to help users to navigate and make choice on some websites and in some applications.

ClickScan presents itself as small window with a red button that hovers over other applications. When a user clicks the red button 
ClickScan starts sending a user-defined sequence of keystrokes to the most recently active application. Upon a second click ClickScan concludes the sequence and sends a second user-defined keystroke to the active application. In the case of a web browser a sequence of Tab keys will move the focus through the various buttons and links on a webpage. The Enter key will then select the focussed item. ClickScan lets you define the keystrokes needed for moving the focus and for making selections. It also lets you define the rate at which the focus moving kestroke is issued (a scan rate.) It also supports a mode where two targets can be defined. When the user clicks the red button the first target is clicked. Then after a user-defined interval a second target is clicked. This mode can be used as to create motivating cause and effect activities encouraging switch interaction an build motor skills.

ClickScan was created using AutoHotKey. This repository contains:
1. cs.ini -- The setup file for ClickScan. This file must reside in the same folder as ClickScan.exe (or ClickScan.ahk.)
2. ClickScan.ahk -- The AutoHotKey source file.
3. ClickScan.exe -- The compiled AutoHotKey executable (compiled using Ahk2Exe.exe.)
4. cs.ico -- An icon for ClickScan included in the compile process.
5. media-record.png -- A red button picture used to for ClickScan's activation button. This file must reside in the same folder as ClickScan.exe or ClickScan.ahk.
