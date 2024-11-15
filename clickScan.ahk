; Clickscan presents a red button on the screen that when clicked sends a sequence of keystrokes to the last active application.
; The sequence is intended to move the focus from one selectable item to the next. A second click on the big red button sends a keystroke that activates the focused item.
; Open Clickscan and press the ` key to see its controls and to access the help file for more info.
; This version - 9/24/2021 - now includes ~1 as a hotkey sequence which has thw same effect as clicking the big red button.
; This change permits the use of Bluetooth switches and interfaces indended for iPads to be used on Windows to simulate mouse clicks, and to
; genreate two key sequences for auto-scanning.
; More new changes - 11/5/2024 - A new mode called "Drag Mode" makes it easier for users who may have difficulty with mouse 
; drag operations. Check drag mode and the ClickScan backgound turns grey. Also, some of the other settings are hidden
; because they are not used. Use the corner buttons to activate ClickScan. Click the red button to start Drage Mode. 
; The background turns yellow indicating that the user should select the start point of the drag operation.
; After choosing the start point the background turns purple-pink. The user then selects the drag end point and ClickScan
; performs the drag. This method does not always work in the Edge and Chrome browsers - try Firefox instead.
; You can suspend drag mode by clicking the red button - the backgound turns grey.
; Also added - 11/5/2024 - the ability to use other switch interface inputs as alternate triggers including joystick buttons. ; Alternate triggers will do the same thing as clicking the red button when ClickScan is active. Just select an 
; "Alternate" trigger from the dropdown menu. Triggers are not stored between user sessions, and the "none" option 
; turns these triggers off. You can use the alternate trigger to activate/suspend Drag Mode.
;
relLoc := A_workingDir . "\"  ;used to trim picture file locations to a relative path
CoordMode,Mouse,Screen
custom := "hello"
; specialMode = 0
suspended = 0
csTitle = ClickScan -->
csAltTrigger = none
csOldAltTrigger = none
csStatus = ON
csTitleBar =%csTitle% %csStatus% 
minWidth = 150
maxWidth = 340
minHeight = 150
maxHeight = 180
csHilight = {Tab}
csSelect = {Space}
csScanRate = 4
scanning = 0
masking = 0
csMaskTime = 0
iniH := "Main"
iniF := "cs.ini"
csXloc = 0 ; coodinate used to position the clickScan window
csYloc = 0 ; coodinate used to position the clickScan window
csClickY = 0;
csClickX = 0;
ctX1 = 0 ; x coordinate for first target
ctY1 = 0
ctX2 = 0 ;x coodinate 2nd target
ctY2 = 0
posIx = 0 ; values = 0, 1, 3 --an Index used to capture coordinates where alt-1 records first click target, alt-2 the second.
posX = 0 ; currently not used
posY = 0
dragX = 0 ; X coordinate used to start dragging item
dragY = 0
dropX = 0 ; x coordinate used to drop item
dropY = 0
xpos = 0 ; x coordinate of the clickScan red button
ypos = 0
UseTargets = 0
UseDragDrop = 0
DragStatus = 0 ; 0=Dragmode Off, 1=Waiting for 1st mouseDown (what to drag), 2=waiting for 2nd mouseDown (destination)
DragInit = 0
bgBlue = 0x00CCDD
bgLime = 0x00FF7F
bgGrey = 0xC5C8C9
bgYellow = 0xFCF11C
bgPink = 0xFBACFC


helpTitle = ClickScan Help
helpText = ClickScan can generate a "scan sequence" to help  single switch scanners navigate some applications and/or some web pages. For example, many web pages and browsers will respond to the Tab key by moving the focus highlight to the next click-able item. The Space key can be used to select the highlighted item in the same way as clicking on it would.`n`n If your switch user has an adapted mouse (where the switch input activates a left click,) a facilitator should hover the mouse cursor over the ClickScan red button. When the switch user presses their switch, a scan sequence begins with a series of Tabs sent to the most recently active window for highlighting items at the rate set by the Scan Rate menu. A second switch activation teminates the sequence sending the Space character to select the highlighted item. `n`n The Mask time defines an interval after a switch activation when additional, perhaps inadvertant, switch activations are ignored. `n`n When a scan sequence has started the background of the ClickScan window turns a light green color. The background color returns to blue when the scan sequence has concluded. `n`n Settting the scan rate to 0 will cause ClickScan to send just the highlight key with each click of the ClickScan button instead of a scan sequence. `n `n ClickScan can also be triggered by the ~1 key sequence which is a commonly used method for switch access on iPads. Set your Bluetooth switch interface to send ~1 to wirelessly activate ClickScan! `n `n Checking the "Target Mode" box allows you to provide your user with a timed cause/effect experience that works well with media players. You can define targets like the "Play" and "Pause" buttons in the media player that will be activated as a sequence when you user activates the ClickScan button. The time between the Play activation and the Pause activation is defined by the Scan Rate menu. You identify the position of the first target (the Play button) by hovering the mouse cursor over it and using the Alt-1 key combo to record its position (Hold the Alt key, press the 1 key.) The second target position (the Pause button) is recorded using the Alt-2 key combo. If the Scan Rate is set to 0 (zero) then only the first target is clicked. ClickScan takes care of moving mouse cursor and clicking the targets you recorded. If you user is using an adapted mouse it will wait for your user to release their switch before initiating the sequence. If you are using a Bluetooth switch interface Target mode is activated as soon as the uses presses their switch. `n `n ClickScan now offers assistance for users who have difficulty with mouse drag operations with "Drag Mode". Drag Mode allows the user to select a start point followed by selecting an end point and ClickScan will drag from the start to the end automatically. Check the Drag Mode box. The ClickScan background turns grey indicating that DragMode is suspended. To use DragMode, activate ClickScan (the ` key) and click the red button. The ClickScan background turns yellow. Select a start point. The ClickScan background turns pink. Select an end point and ClickScan will perform the drag from start to end. Notr that choosing Drag Mode will hide some options that is does not support. You can set a Masktime to make establishing the start point more reliable. `n `n There is also a new option to use an alternate trigger to click the red button using almost any switch interface, including ones that issue joystick button presses. Just select any of the choices on the Alternate Trigger dropdown menu. Note that "none" disables any alternate triggers, and that up, down, right, left refer to arrow keys. You can use the Alternate Trigger to activate/suspend Drag Mode.


goSub, iniSetup


Gui, 1:+LastFound +AlwaysOnTop +Border +ToolWindow +E0x08000000
Gui, 1:Add, Picture, x5 y4 w140 h120 border gcsClicked, media-record.png
Gui, 1:Add, DropDownList, x240 y4 w90 vcsHilight gsetVars, %csHilight%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|{click 2}
Gui, 1:Add, DropDownList, x240 y24 w90  vcsSelect gsetVars, %csSelect%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|{click 2}
Gui, 1:Add, DropDownList, x240 y44 w90 vcsScanRate gsetVars		, %csScanRate%||0|0.5|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|30|45|60|90|120
Gui, 1:Add, DropDownList, x240 y64 w90 vcsMaskTime gsetVars		, %csMaskTime%||0|0.1|0.2|0.3|0.4|0.5|1|2|3|4
Gui, 1:Add, Button, x240 y84 w44 gSetLocUL, Upper Left
Gui, 1:Add, Button, x285 y84 w44 gSetLocUR, Upper Right
Gui, 1:Add, Button, x240 y116 w44 gSetLocLL, Lower Left
Gui, 1:Add, Button, x285 y116 w44 gSetLocLR, Lower Right
Gui, 1:Add, Text, x150 y5 w85 h30 , Scan Highlight:
Gui, 1:Add, Text, x150 y25 w85 h30 , Scan Select:
Gui, 1:Add, Text, x150 y45 w85 h30 , Scan Rate:
Gui, 1:Add, Text, x150 y65 w85 h30 , Mask Time:
Gui, 1:Add, Button, x150 y85 w80 gshowHelp, Help
Gui, 1:Add, Checkbox, x150 y108 vUseTargets Checked%UseTargets% gSetVars, Target Mode
Gui, 1:Add, Checkbox, x150 y128 vUseDragDrop Checked%UseDragDrop% gSetVars, Drag Mode
Gui, 1:Add, Text, x150 y150 w85 h30 , Alternate Trigger:
Gui, 1:Add, DropDownList, x240 y150 w90  vcsAltTrigger gsetVars, %csAltTrigger%||0|1|2|3|Space|Enter|Tab|+Tab|BackSpace|Right|Left|Up|Down|LButton|RButton|MButton|Joy1|Joy2|Joy3|Joy4|Joy5|Joy6|Joy7|Joy8|none
Gui, 1:Add, Text, x5 y130 w140 , Press `` (backtick) for settings
Gui, 1:Color, %bgBlue%
Gui, 1:Show, x%csXloc% y%csYloc% h%minHeight% w%minWidth% NoActivate, %csTitleBar%
if (UseDragDrop)
	{
		goSub, csSetStatus
	}
Return

Relocate:
gosub, saveIniSetup
gosub, RelocateAndActivate
Return


:*:~1::
   Gosub, csClicked
   return
		
`::
 Suspend
 RelocateAndActivate: ; move the clickscan window to either show or hide controls
 if (suspended) {
    Suspend, Off
	suspended = 0
	csStatus = ON
	csTitleBar =%csTitle% %csStatus% 
	Gui, 1:Show, x%csXloc% y%csYloc% h%minHeight% w%minWidth% NoActivate, %csTitleBar%
	}
	else {
	Suspend, On
	suspended = 1
	csStatus = OFF
	csTitleBar =%csTitle%  %csStatus% 
	Gui, 1:Show, xCenter yCenter h%maxHeight% w%maxWidth% NoActivate, %csTitleBar%
	}
return

!1:: ; record the first target location for "Target Mode"
suspend, permit
posIx := 1
MouseGetPos, ctX%posIx%, ctY%posIx% 
Gosub, saveIniSetup
return

!2:: ; record the second location for "Target Mode"
suspend, permit
posIx := 2
MouseGetPos, ctX%posIx%, ctY%posIx% 
Gosub, saveIniSetup
return
					
~LButton::
 if !(masking)
 {
 if (UseDragDrop)
	{
		soundBeep
		switch DragStatus
		{
			case 0: return
			case 1: if (DragInit)
			{
				DragInit = 0
				return
			}
				MouseGetPos, dragX, dragY
				Gui, 1:Color, %bgPink%
				DragStatus = 2
				goSub, SetMasking
				return
			case 2: MouseGetPos, dropX, dropY
					
					DragStatus = 3
					
		}
	}
	
	keyWait, LButton
	
	if (DragStatus = 3)
	{
		MouseMove, dragX, dragY, 2
		MouseClickDrag, Left, dragX, dragY, dropX, dropY, 10, 
		Click, Up
		Gui, 1:Color, %bgYellow%
		DragStatus = 1
	}
}
Return

SetMasking:
	masking := 1
	 mt := 1000 * csMaskTime
	 SetTimer, ResetMask, %mt%
return 

SetVars:
Gui,Submit,NoHide
gosub, csSetStatus
if !(csAltTrigger = "none")
	{
		if !(csOldAltTrigger = "none")
			{
				
				Hotkey, %csOldAltTrigger%,,Off
			}
		HotKey, %csAltTrigger%, csClicked,On
		csOldAltTrigger := csAltTrigger
	} else {
		if !(csOldAltTrigger = "none")
			{
				
				Hotkey, %csOldAltTrigger%,,Off
			}
		
		csOldAltTrigger = none
	}
	

	

gosub, saveIniSetup
return

csSetStatus:                
if (UseDragDrop)            
	{
		DragStatus := 0
		Gui, 1:Color, %bgGrey%
		GuiControlShowHide("csHilight|csScanRate|csSelect|UseTargets","Hide")
		return
	}
Gui, 1:Color, %bgBlue%
GuiControlShowHide("csHilight|csScanRate|csSelect|UseTargets","Show")

return

csClicked: ; handle big red button interactions
MouseGetPos, xpos, ypos
 if !(masking)
  {
  if (UseDragDrop)
	{
		if (DragStatus = 0)
		{
			
			Gui, 1:Color, %bgYellow%
			DragStatus = 1
			
			DragInit = 1
		
			return
		}
		else
		{
			Gui, 1:Color, %bgGrey%
			DragStatus = 0
			
			return
		}
	}
  if (UseTargets)
   {
      
      keyWait, LButton
	  click %ctX1%, %ctY1%
	  masking := 1
	  mt := 1000 * csMaskTime
	  SetTimer, ResetMask, %mt%
	  if (csScanRate != 0)
	    {
		  Gui, 1:Color, %bgLime%
          dt := 1000 * csScanRate
	      SetTimer, SelectItem, %dt%
		}
	  MouseMove, %xpos%, %ypos%
	  Return
	}
 if (csScanRate == 0)
   {
     Gosub, HiliteNext
	 Return
	} 
  If (scanning)
      {
        scanning := 0
        SetTimer, HiliteNext, off
		 masking := 1
			 mt := 1000 * csMaskTime
			 SetTimer, ResetMask, %mt%
		Gui, 1:Color, 0x00CCDD
        goSub, SelectItem
		MouseMove, %xpos%, %ypos%
       }
     else
       {
         scanning := 1
		     masking := 1
			 mt := 1000 * csMaskTime
			 SetTimer, ResetMask, %mt%
			 Gui, 1:Color, 0x00FF7F
         goSub, HiliteNext
         dt := 1000 * csScanRate
         SetTimer, HiliteNext, %dt%
		 
       }
 }
return

ResetMask:
  masking := 0
  SetTimer, ResetMask, off
Return

HiliteNext:
Send %csHilight%
MouseMove, %xpos%, %ypos%
return

SelectItem:
If (UseTargets)
	{
	 SetTimer, SelectItem, Off
	 Gui, 1:Color, 0x00CCDD
	 click %ctX2%, %ctY2%
	 MouseMove %xpos%, %ypos%
	 Return
	}

Send %csSelect%
return

SetLocUL: ; get corner coodinates for locating the Clickscan window in active mode
csXloc = 0
csYloc = 0
gosub, Relocate
return

SetLocUR:
csXloc := A_ScreenWidth - (minWidth + 80)
csYloc = 0
gosub, Relocate
return

SetLocLL:
csXloc = 0
csYloc := A_ScreenHeight - (minHeight + 80)
gosub, Relocate
return

SetLocLR:
csXloc := A_ScreenWidth - (minWidth + 80)
csYloc := A_ScreenHeight - (minHeight + 80)
gosub, Relocate
return


iniGet(iniKey,inF,inS)
{
  
  iniRead, iniVar,%inF%,%inS%,%iniKey%
  if (iniVar == "ERROR")
   {
     msgBox Initalization error - %iniKey%, or %inF%, or %inS%, not found or misspelled
     
   }
  else
   {
     return iniVar
   }
}

iniSetup: ; establish startup conditions
  csScanRate := iniGet("ScanRate",iniF,iniH)
  csHilight := iniGet("Hilight",iniF,iniH)
  csSelect := iniGet("Select",iniF,iniH)
  csXloc := iniGet("Xlocation",iniF,iniH)
  csYloc := iniGet("Ylocation",iniF,iniH)
  csMaskTime := iniGet("MaskTime",iniF,iniH)
  UseTargets := iniGet("UseTargets",iniF,iniH)
  UseDragDrop := iniGet("UseDragDrop",iniF,iniH)
  ctX1 := iniGet("ctX1",iniF,iniH)
  ctY1 := iniGet("ctY1",iniF,iniH)
  ctX2 := iniGet("ctX2",iniF,iniH)
  ctY2 := iniGet("ctY2",iniF,iniH)
return

saveIniSetup: ; save all changes to any settings
  iniWrite, %csScanRate%, %iniF%, %iniH%, ScanRate
  iniWrite, %csHilight%, %iniF%, %iniH%, Hilight
  iniWrite, %csSelect%, %iniF%, %iniH%, Select
  iniWrite, %csXloc%, %iniF%, %iniH%, Xlocation
  iniWrite, %csYloc%, %iniF%, %iniH%, Ylocation
  iniWrite, %csMaskTime%, %iniF%, %iniH%, MaskTime
  iniWrite, %UseTargets%, %iniF%, %iniH%, UseTargets
  iniWrite, %UseDragDrop%, %iniF%, %iniH%, UseDragDrop
  iniWrite, %ctX1%, %iniF%, %iniH%, ctX1
  iniWrite, %ctY1%, %iniF%, %iniH%, ctY1
  iniWrite, %ctX2%, %iniF%, %iniH%, ctX2
  iniWrite, %ctY2%, %iniF%, %iniH%, ctY2
return

showHelp:
 msgBox,4096,%helpTitle%,%helpText%
return


GuiControlShowHide(controls,state){

	Loop,Parse,controls,|

	GuiControl, %state%,%A_LoopField%

}

GuiClose:
ExitApp