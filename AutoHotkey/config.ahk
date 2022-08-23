;#Warn  ; Recommended for catching common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
ListLines Off
SetBatchLines -1
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#KeyHistory 0
#WinActivateForce

Process, Priority,, H

SetWinDelay -1
SetControlDelay -1

; On Startup
Run, powershell %A_ScriptDir%\startup.ps1,, Hide  ; Runs starup script to update packages and run window manager
Run, python3 %A_ScriptDir%/config.py GoToWorkspace1,, Hide ; Start windows on workspace 1

; Go to Workspace
#1:: Run, python3 %A_ScriptDir%/config.py GoToWorkspace1,, Hide
#2:: Run, python3 %A_ScriptDir%/config.py GoToWorkspace2,, Hide
#3:: Run, python3 %A_ScriptDir%/config.py GoToWorkspace3,, Hide
#4:: Run, python3 %A_ScriptDir%/config.py GoToWorkspace4,, Hide
#5:: Run, python3 %A_ScriptDir%/config.py GoToWorkspace5,, Hide
#6:: Run, python3 %A_ScriptDir%/config.py GoToWorkspace6,, Hide
#7:: Run, python3 %A_ScriptDir%/config.py GoToWorkspace7,, Hide
#8:: Run, python3 %A_ScriptDir%/config.py GoToWorkspace8,, Hide
#9:: Run, python3 %A_ScriptDir%/config.py GoToWorkspace9,, Hide

; Move Window to Workspace
#+1:: Run, python3 %A_ScriptDir%/config.py MoveWinToWorkspace1,, Hide
#+2:: Run, python3 %A_ScriptDir%/config.py MoveWinToWorkspace2,, Hide
#+3:: Run, python3 %A_ScriptDir%/config.py MoveWinToWorkspace3,, Hide
#+4:: Run, python3 %A_ScriptDir%/config.py MoveWinToWorkspace4,, Hide
#+5:: Run, python3 %A_ScriptDir%/config.py MoveWinToWorkspace5,, Hide
#+6:: Run, python3 %A_ScriptDir%/config.py MoveWinToWorkspace6,, Hide
#+7:: Run, python3 %A_ScriptDir%/config.py MoveWinToWorkspace7,, Hide
#+8:: Run, python3 %A_ScriptDir%/config.py MoveWinToWorkspace8,, Hide
#+9:: Run, python3 %A_ScriptDir%/config.py MoveWinToWorkspace9,, Hide

; Pinning and unpinning windows
#p:: Run, python3 %A_ScriptDir%/config.py PinWindow,, Hide
#u:: Run, python3 %A_ScriptDir%/config.py UnpinWindow,, Hide

; Open terminal
^!t:: Run, shell:appsFolder\Microsoft.WindowsTerminal_8wekyb3d8bbwe!App

; Close current window
#q:: Send !{f4} ; Simulates the keypress alt+f4

; Disables windows keys :)
~LWin::Send {Blind}{vkE8}

;;; Functions ;;;


; Writes to screen what workspace is currently active
PrintWorkspaceName() {
	; SessionId := getSessionId()
	; if (SessionId) {
	; 	RegRead, CurrentDesktopId, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\%SessionId%\VirtualDesktops, CurrentVirtualDesktop
	; 	; RegRead, all, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs ; Read ;ist of all desktops
	; 	SplashTextOn,,, % CurrentDesktopId
	; 	; SplashTextOn,,, % VD.getCurrentDesktopNum()
	; 	Sleep 700
	; 	SplashTextOff
	; }
}

; This functions finds out ID of current session.
getSessionId() {
	ProcessId := DllCall("GetCurrentProcessId", "UInt")
	if ErrorLevel {
		OutputDebug, Error getting current process id: %ErrorLevel%
		return
	}
	OutputDebug, Current Process Id: %ProcessId%
	SessionId := ""
	DllCall("ProcessIdToSessionId", "UInt", ProcessId, "UInt*", SessionId)
	if ErrorLevel {
		OutputDebug, Error getting session id: %ErrorLevel%
		return
	}
	OutputDebug, Current Session Id: %SessionId%
	return SessionId
}

