; =================================================================================================
; Developer: Abrucci
; You may use, distribute and modify this code under the
; terms of the GNU GPLv3 license!
; 
; You can check the GNU GPLv3 License under https://www.gnu.org/licenses/gpl-3.0.de.html
; =================================================================================================
global version := "1.4.9"
global sampdll_base_address := 0

; =================================================================================================
; | Check Folders and Files
; =================================================================================================
if(FileExist(A_ScriptDir "\updater.bat"))
	FileDelete, % A_ScriptDir "\updater.bat"
	
RegRead, gta_folder, HKCU, Software\SAMP, gta_sa_exe
global gta_folder := StrReplace(gta_folder, "gta_sa.exe")
if(!FileExist(gta_folder)){
	Msgbox,, Muchbinder, % "Der GTA Ordner konnte nicht ermittelt werden.`nStelle sicher, dass das Spiel mindestens einmal gestartet wurde."
	ExitApp
}
	
If(!FileExist(A_AppData "\Muchbinder"))
	FileCreateDir, % A_AppData "\Muchbinder"

If(!FileExist(A_AppData "\Muchbinder\logo.ico"))
	UrlDownloadToFile, https://download.nes-interfaces.de/logo.ico, % A_AppData "\Muchbinder\logo.ico"

Menu, Tray, Icon, % A_AppData "\Muchbinder\logo.ico"

If(!FileExist(A_AppData "\Muchbinder\Overlay.dll"))
	UrlDownloadToFile, https://download.nes-interfaces.de/Overlay.asi, % A_AppData "\Muchbinder\Overlay.dll"

If(!FileExist(A_AppData "\Muchbinder\hitsound.wav"))
	UrlDownloadToFile, https://download.nes-interfaces.de/hitsound.wav, % A_AppData "\Muchbinder\hitsound.wav"

; =================================================================================================
; | Admin Permission
; =================================================================================================
if (!A_IsAdmin) {
	Run *RunAs "%A_ScriptFullPath%",, UseErrorLevel
	if (ErrorLevel) {
		MsgBox, 262453, Muchbinder (SA:MPcac 0.3.7-R1), % "Der Binder muss als Administrator gestartet werden, damit er auf das Spiel zugreifen kann."
		IfMsgBox, Retry
			Reload
		else
			ExitApp
	}
	return
}

; =================================================================================================
; | Tray Settings                                                                                 |
; =================================================================================================
Menu, Tray, NoStandard
Menu, Tray, Add, Muchbinder v%version%, RunWeb
Menu, Tray, Add
Menu, Tray, Add, Anmelden, Login
Menu, Tray, Add
Menu, Tray, Add, SA:MP Connect, RunSamp
Menu, Tray, Add, TS Connect, RunTs
Menu, Tray, Add, Forum aufrufen, RunBoard
Menu, Tray, Add
Menu, Tray, Add, Neustarten, RestartBinder
Menu, Tray, Add, Beenden, GuiClose

; =================================================================================================
; | Environment Vars
; =================================================================================================
GroupAdd, GTASA, ahk_class Grand theft auto San Andreas ahk_exe gta_sa.exe
Listlines Off
SetBatchlines -1

#IfWinActive, ahk_group GTASA
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#SingleInstance Force
OnExit, GuiClose
ListLines Off
SendMode Input

#Include API.ahk

; =================================================================================================
; | Klassen
; =================================================================================================
class textlabel{
	ident := -1
	text := "NOTEXT"
	color := "0xFFFF90FF"
	xPos := 0
	yPos := 0
	zPos := 0
	drawDistance := 15
	testLOS := 1
	playerID := 0xFFFF
	vehicleID := 0xFFFF

	create(){
		if(This.ident == -1)
			This.ident := createTextLabel(This.text, This.color, This.xPos, This.yPos, This.zPos, This.drawDistance, This.testLOS, This.playerID, This.vehicleID)
		Else
			ChatMessage("3DTextlabel " This.text " existiert bereits!")
	}

	delete(){
		This.ident := deleteTextLabel(This.ident)
	}

	update(labeltext){
		updateTextLabel(This.ident, labeltext)
	}
}

class overlay{
	ident := -1
	text := "NOTEXT"
	font := "Arial"
	size := 9
	bold := 1
	italic := 0
	xpos := 500
	ypos := 500
	xtmp := 0
	ytmp := 0
	color := "000000"
	color2 := "FFFFFF"
	color3 := "FFFFFF"
	color4 := "FFFFFF"
	color5 := "FFFFFF"
	color6 := "FFFFFF"
	shadow := 1
	enabled := 0
	shown := 1
	auto := 0
	state := 0
	interval := 0
	min := 0
	label := 0
	share := 0
	blip := 0

	create(){
		if(This.ident == -1)
			This.ident := TextCreate(This.font, This.size, This.bold, This.italic, This.xpos, This.ypos, 0xFF "" This.color, This.text, This.shadow, 1)
	}
	
	delete(){
		TextDestroy(This.ident)
	}
	
	update(labeltext){
		if(This.ident != -1){
			TextSetString(This.ident, labeltext)
			This.text := labeltext
		}
	}
	
	changeSize(fontsize){
		if(This.ident != -1){
			TextUpdate(This.ident, This.font, fontsize, 1, 0)
			This.size := fontsize
		}
	}
	
	changeColor(fontcolor){
		if(This.ident != -1){
			TextSetColor(This.ident, fontcolor)
			This.color := fontcolor
		}
	}
	
	move(xpos, ypos){
		if(This.ident != -1){
			TextSetPos(This.ident, xpos, ypos)
			This.xpos := xpos
			This.ypos := ypos
		}
	}
	
	hide(){
		if(This.ident != -1){
			TextSetShown(This.ident, false)
			This.shown := 0
		}
	}
	
	show(){
		if(This.ident != -1){
			TextSetShown(This.ident, true)
			This.shown := 1
		}
	}
}

class SocketIO{
	__New()
	{
		static wb
		
		Gui, +hWndhOld
		Gui, New, +hWndhWnd
		
		this.hWnd := hWnd
		
		Gui, Add, ActiveX, vWB, Shell.Explorer
		Gui, %hOld%: Default
		
		WB.Navigate("about:<!DOCTYPE html><meta http-equiv='X-UA-Compatible' content='IE=edge'><head><script src='https://nes-interfaces.de/assets/js/socket.io.js'></script></head><body></body>")
		
		while (WB.ReadyState < 4)
			sleep, 50
		
		this.document := WB.document
		this.document.parentWindow.ahk_savews := this._SaveWS.Bind(this)
		this.document.parentWindow.ahk_event := this._Event.Bind(this)
		
		Script := this.document.createElement("script")
		Script.text:= "var sock = null;`n"
					. "function sockConnect(){ if(sock) {sock.close(); sock = null;} sock = io.connect('http://127.0.0.1', {reconnect: true, secure: true}); sock.on('response', function(data){ ahk_event(data.type, data.text); }); sock.on('disconnect', function(){ ahk_event('Disconnect', 'disconnected'); }); ahk_event('Connect', 'connected');}"
					. "function sockEmit(type, content){ if(sock) sock.emit(type, content); }`n"
		this.document.body.appendChild(Script)
		this.Connect()
	}
	
	Connect() {
		this.document.parentWindow.sockConnect()
	}
	
	_Event(EventName, Event)
	{
		this["On" EventName](Event)
	}
	
	Send(Type, Content) {
		this.document.parentWindow.sockEmit(Type, Content)
	}
	
	Close() {
		this.document.parentWindow.sock.close()
	}
	
	Disconnect() {
		if this.hWnd
		{
			this.Close()
			this.wb.quit
			this.hWnd := False
		}
	}
}

class socketClass extends SocketIO {
	;Authentication Socket Funktionen
	OnConnect() {
		global
		RegRead, playername, HKCU, Software\SAMP, PlayerName
		RegRead, playerpass, HKCU, Software\SAMP, PlayerPass

		version := version
		this.Send("auth", playername ";;;" playerpass ";;;" version)
	}
	
	OnConnectError(data) {
		global loginerror := 1
		
		if(WinActive("ahk_exe gta_sa.exe"))
			ChatMessage(data)
		Else
			TrayTip, Staatsbinder, %data%, 2000
	}

	OnConnected(data) {
		global
		dataSplit := StrSplit(data, ";;;")
		
		playerid 				:= dataSplit[1]
		playername 				:= dataSplit[2]
		factionid 				:= dataSplit[3]
		frang 					:= StrSplit(dataSplit[4], ".")
		factionrang 			:= frang[1]
		factionurang 			:= frang[2]
		factionleader 			:= dataSplit[5]
		admin 					:= dataSplit[6]

		Menu, Tray, DeleteAll
		Menu, Tray, NoStandard
		Menu, Tray, Add, Staatsbinder v%version%, EmptyFunc
		Menu, Tray, Add
		Menu, Tray, Add, Angemeldet als %playername%, EmptyFunc
		Menu, Tray, Add, Konfiguration, RunWeb
		Menu, Tray, Add
		Menu, Tray, Add, SA:MP Connect, RunSamp
		Menu, Tray, Add, TS Connect, RunTs
		Menu, Tray, Add, Forum aufrufen, RunBoard
		Menu, Tray, Add
		Menu, Tray, Add, Neustarten, RestartBinder
		Menu, Tray, Add, Beenden, GuiClose

		if(WinActive("ahk_exe gta_sa.exe"))
			ChatMessage("Die Verbindung zum Server wurde {00FF00}hergestellt{FFFFFF}.")
	}

	OnDisconnect() {
		ChatMessage("Die Verbindung zum Server wurde {FF0000}getrennt{FFFFFF}. Die Verbindung sollte in kürze wieder aufgebaut werden.")
	}
	
	OnUpdate() {
		UpdateBinder()
	}
	
	OnInitialized() {
		if(loaded == 0)
			SetTimer, monitorGTA, 5000
	}
	
	;Sonstige Socket Funktionen
	OnUpdateOverlay(data){
		global
		dataSplit := StrSplit(data, ";;;")
		
		switch dataSplit[1]
		{
			case "ausdauer":
				ov["ausdauer"].enabled := dataSplit[2]
				ov["ausdauer"].text := "Ausdauer: 100%"
				ov["ausdauer"].color := dataSplit[3]
				ov["ausdauer"].size := dataSplit[4]
				ov["ausdauer"].xpos := dataSplit[5]
				ov["ausdauer"].ypos := dataSplit[6]
				return
			case "ped":
				ov["ped"].enabled := dataSplit[2]
				ov["ped"].text := "PED Slots: 0"
				ov["ped"].color := dataSplit[3]
				ov["ped"].size := dataSplit[4]
				ov["ped"].xpos := dataSplit[5]
				ov["ped"].ypos := dataSplit[6]
				return
			case "use":
				ov["use"].enabled := dataSplit[2]
				ov["use"].text := "Timer: 0"
				ov["use"].color := dataSplit[3]
				ov["use"].size := dataSplit[4]
				ov["use"].xpos := dataSplit[5]
				ov["use"].ypos := dataSplit[6]
				return
			case "inv":
				ov["inv"].enabled := dataSplit[2]
				ov["inv"].text := "=== Inventar ==="
				ov["inv"].color := dataSplit[3]
				ov["inv"].color2 := dataSplit[4]
				ov["inv"].color3 := dataSplit[5]
				ov["inv"].color4 := dataSplit[6]
				ov["inv"].color5 := dataSplit[7]
				ov["inv"].color6 := dataSplit[8]
				ov["inv"].size := dataSplit[9]
				ov["inv"].xpos := dataSplit[10]
				ov["inv"].ypos := dataSplit[11]
				return
			case "wanted":
				ov["wanted"].enabled := dataSplit[2]
				ov["wanted"].text := "=== Gesuchte Spieler ==="
				ov["wanted"].color := dataSplit[3]
				ov["wanted"].size := dataSplit[4]
				ov["wanted"].xpos := dataSplit[5]
				ov["wanted"].ypos := dataSplit[6]
				ov["wanted"].min := dataSplit[7]
				ov["wanted"].auto := dataSplit[8]
				ov["wanted"].interval := dataSplit[9]
				ov["wanted"].label := dataSplit[10]
				return
			case "fraktion":
				ov["fraktion"].enabled := dataSplit[2]
				ov["fraktion"].text := "=== Fraktion ==="
				ov["fraktion"].color := dataSplit[3]
				ov["fraktion"].size := dataSplit[4]
				ov["fraktion"].xpos := dataSplit[5]
				ov["fraktion"].ypos := dataSplit[6]
				ov["fraktion"].share := dataSplit[7]
				ov["fraktion"].blip := dataSplit[8]
				return
			case "group":
				ov["group"].enabled := dataSplit[2]
				ov["group"].text := "=== Gruppierung ==="
				ov["group"].color := dataSplit[3]
				ov["group"].size := dataSplit[4]
				ov["group"].xpos := dataSplit[5]
				ov["group"].ypos := dataSplit[6]
				ov["group"].share := dataSplit[7]
				ov["group"].blip := dataSplit[8]
				return
			case "note":
				ov["note"].enabled := dataSplit[2]
				ov["note"].text := "=== Notizen ==="
				ov["note"].color := dataSplit[3]
				ov["note"].size := dataSplit[4]
				ov["note"].xpos := dataSplit[5]
				ov["note"].ypos := dataSplit[6]
				return
			case "enemie":
				ov["enemie"].enabled := dataSplit[2]
				ov["enemie"].text := "=== Gegner ==="
				ov["enemie"].color := dataSplit[3]
				ov["enemie"].size := dataSplit[4]
				ov["enemie"].xpos := dataSplit[5]
				ov["enemie"].ypos := dataSplit[6]
				return
		}
	}
}

; =================================================================================================
; | Globals                                                                                       |
; =================================================================================================
global loginerror								:= 0
global loaded									:= 0
global keybinds									:= 0

;Playerdaten
global playername								:= ""
global playerid									:= -1
global factionid								:= 0
global factionrang								:= 0
global factionurang								:= 0
global factionleader							:= 0
global admin									:= 0

global ov										:= []
	   ov["loaded"]								:= 0
	   ov["move"]								:= 0
	   ov["ausdauer"]							:= new overlay
	   ov["ped"]								:= new overlay
	   ov["use"]								:= new overlay
	   ov["inv"]								:= new overlay
	   ov["wanted"]								:= new overlay
	   ov["fraktion"]							:= new overlay
	   ov["group"]							  	:= new overlay
	   ov["note"]								:= new overlay
	   ov["enemie"]								:= new overlay

global timer									:= []
	   timer["friedhof"]						:= 0
	   timer["donut"]							:= 0
	   timer["brownie"]							:= 0
	   timer["green"]							:= 0
	   timer["gold"]							:= 0
	   timer["lsd"]								:= 0
	   timer["vs"]								:= 0
	   timer["respawn"]							:= 0

global inventar									:= []
	   inventar["donut"]						:= 0
	   inventar["brownie"]						:= 0
	   inventar["green"]						:= 0
	   inventar["gold"]							:= 0
	   inventar["lsd"]							:= 0

global wantedTrigger							:= []
global wantedAmount								:= []
global wantedReason								:= []
global wantedPlayers							:= []
global wantedPlayersGPS							:= []
global wantedPlayersAmount						:= []

; =================================================================================================
; | Binder Init                                                                                   |
; =================================================================================================
if(!WinActive("ahk_exe gta_sa.exe"))
	TrayTip, Staatsbinder, Der Keybinder wurde geladen., 2000
else
	ChatMessage("Der Keybinder wurde {00ff00}geladen{ffffff}.")

GoTo, Login
return

; =================================================================================================
; | GUI Functions                                                                                 |
; =================================================================================================
GuiClose:
	CloseApp()
return

RestartBinder:
	RestartApp()
return

EmptyFunc:
return

RunWeb:
	Run, https://nes-interfaces.de
return

RunBoard:
	Run, https://forum.nes-newlife.de
return

RunTs:
	Run, ts3server://ts.nes-newlife.de:9987
return

RunSamp:
	RegRead, GTA_SA_EXE, HKEY_CURRENT_USER, Software\SAMP, GTA_SA_EXE
	SplitPath, GTA_SA_EXE,, path
	Run, %path%\samp.exe samp.nes-newlife.de:7777
	TrayTip, Staatsbinder, Verbindung zum SA:MP Server wird aufgebaut..., 3000, 1
return

Login:
	RegRead, playername, HKCU, Software\SAMP, PlayerName
	RegRead, playerpass, HKCU, Software\SAMP, PlayerPass
	
	if(playername == ""){
		Msgbox,, Staatsbinder, Spielername nicht gefunden!`nBitte SA:MP starten und Name eingeben.`nDanach SA:MP wieder schließen und erneut versuchen.
		return
	}
	
	if(playerpass == "" || loginerror == 1){
		Inputbox, playerpass, Staatsbinder, Bitte gib dein Passwort ein:, hide, 200, 130
		if ErrorLevel
			return
		
		RegWrite, REG_SZ, HKCU, Software\SAMP, PlayerPass, %playerpass%
	}
	
	global Socket := new socketClass()
return

; =================================================================================================
; | Static Keybinds
; =================================================================================================
F12::
	if(!WinActive("ahk_exe gta_sa.exe") || loaded == 0)
		return
		
	if(keybinds == 0){
		keybinds := 1
		ChatMessage("Die Keybinds wurden {00ff00}aktiviert{ffffff}!")
	} else {
		keybinds := 0
		ChatMessage("Die Keybinds wurden {ff0000}deaktiviert{ffffff}!")
	}
return

~LButton::
	If (A_TimeSincePriorHotkey<400) and (A_TimeSincePriorHotkey<>-1)
		if(isDialogOpen())
			OnDialogResponse(true)
return

#If WinActive("ahk_exe gta_sa.exe")
*NumpadEnter::
*Enter::
	if(IsChatOpen())
	{
		checkSendCMDNOP()
		clip := ClipboardAll
		Clipboard := ""
		SendInput, {Right}A{BackSpace}^A^C{Enter}
	
		Loop, 100 {
			sleep, 5
			
			if (Clipboard != "")
				break
		}
	
		chatText := Clipboard
		Clipboard := clip
	
		if (chatText == -1 || chatText == "")
			return
	
		if (SubStr(chatText, 1, 1) == "/") {
			if (!OnPlayerCommand(chatText))
				SendChat(chatText)
		}
	}
	else if(isDialogOpen())
		OnDialogResponse(true)
	else
	{
		SendInput, {enter down}
		Sleep, 25
		SendInput, {enter up}
	}
return

; =================================================================================================
; | Commands
; =================================================================================================
CMD_Reload(){
	ChatMessage("Der Keybinder wird neu gestartet. Dies kann einen Moment dauern.")
	RestartApp()
	return true
}
; =================================================================================================
; | Functions
; =================================================================================================
CloseApp(){
	DestroyAllVisual()
	unpatchSendCMD()
	Sleep, 1000
	ExitApp
}

RestartApp(){
	DestroyAllVisual()
	unpatchSendCMD()
	Sleep, 1000
	Reload
}

OnDialogResponse(response) {
	global
	caption := getDialogCaption()
	
	if (response) 
	{
		SendInput, {Enter}
	}
	else 
	{
		SendInput, {Esc}
	}
}

OnPlayerCommand(command) {
	RegExMatch(command, "/(\S*)(\s*)(.*)", var)

	if (!CMD_%var1%(var3) && !InStr("/q/quit/save/rs/interior/fpslimit/headmove/timestamp/dl/nametagstatus/mem/audiomsg/fontsize/ctd/rcon/", "/" . var1 . "/"))
		return false
	
	return true
}

UpdateBinder(){
	if(WinActive("ahk_exe gta_sa.exe")){
		ChatMessage("Es ist eine neue Binderversion verfügbar. Drücke innerhalb der nächsten 10 Sekunden F2 um das Update zu starten!")
		KeyWait, F2, D T10
		If ErrorLevel
			Return
	} else {
		Msgbox, 4, Muchbinder, Eine neue Version des Binders wurde gefunden.`nSoll das Update jetzt installiert werden?
		IfMsgBox No
			Return
	}
	
	UpdateBinderRun()
}

UpdateBinderRun(){
	Sleep, 2000
	downloadFile("https://download.nes-interfaces.de/Muchbinder.exe", A_WorkingDir "\", A_ScriptName ".new")
	BatchFile=
	(
		@echo off
		ping -n 4 download.nes-interfaces.de >nul
		Del "%A_ScriptName%"
		Rename "%A_ScriptName%.new" "%A_ScriptName%"
		cd "%A_WorkingDir%"
		"%A_ScriptName%"
		exit
	)
	FileAppend, %BatchFile%, updater.bat
	Run *RunAs updater.bat
	ExitApp
}

createOverlays(){
	global
	DestroyAllVisual()

	if(ov["ausdauer"].enabled == 1)
		ov["ausdauer"].create()
		
	if(ov["ped"].enabled == 1)
		ov["ped"].create()
		
	if(ov["use"].enabled == 1)
		ov["use"].create()
		
	if(ov["inv"].enabled == 1)
		ov["inv"].create()
		
	if(ov["wanted"].enabled == 1)
		ov["wanted"].create()
		
	if(ov["fraktion"].enabled == 1)
		ov["fraktion"].create()
		
	if(ov["group"].enabled == 1)
		ov["group"].create()
		
	if(ov["note"].enabled == 1)
		ov["note"].create()
		
	if(ov["enemie"].enabled == 1)
		ov["enemie"].create()
		
	ov["loaded"] := 1
	return
}

initOverlays(){
	if(ov["loaded"]	 == 0){
		createOverlays()
		return
	}
	
	if(ov["ausdauer"].enabled == 1){
		if(isPlayerInAnyVehicle()){
			ov["ausdauer"].update("DL: " getVehicleHealth())
		}
		else {
			ov["ausdauer"].update("Ausdauer: " getSprintInfo() "%")
		}
	}
	
	if(ov["ped"].enabled == 1){
		pedSlots := 0
		For index, value in GetStreamedInPlayersInfo(){
			pedSlots++
		}
		ov["ped"].update("PED Slots: " pedSlots)
	}
	
	if(ov["use"].enabled == 1){
		useString := ""
		
		if(timer["respawn"] > 0)
			useString := useString "Respawn: " timer["respawn"] "`n"
		
		if(timer["friedhof"] > 0)
			useString := "Friedhof: " timer["friedhof"] "`n"
		
		if(timer["donut"] > 0)
			useString := useString "Donut: " timer["donut"] "`n"
			
		if(timer["brownie"] > 0)
			useString := useString "Brownie: " timer["brownie"] "`n"
			
		if(timer["green"] > 0)
			useString := useString "Green: " timer["green"] "`n"
		
		if(timer["gold"] > 0)
			useString := useString "Gold: " timer["gold"] "`n"
		
		if(timer["lsd"] > 0)
			if(timer["lsd"] - 30 >= 0)
				useString := useString "LSD: " timer["lsd"] " (NW: " timer["lsd"] - 30 ")`n"
			else
				useString := useString "LSD: " timer["lsd"] "`n"
				
		ov["use"].update(useString)
	}
	
	if(ov["inv"].enabled == 1){
		if(ov["inv"].state == 0){
			updateInventory()
			return
		}
		
		invString := "=== Inventar ==={FFFFFF}`n"
		
		if(inventar["donut"] > 0)
			invString := invString "{" ov["inv"].color2 "}" "Donuts: " inventar["donut"] "{FFFFFF}`n"
			
		if(inventar["brownie"] > 0)
			invString := invString "{" ov["inv"].color3 "}" "Brownies: " inventar["brownie"] "{FFFFFF}`n"
			
		if(inventar["green"] > 0)
			invString := invString "{" ov["inv"].color4 "}" "Green: " inventar["green"] "{FFFFFF}`n"
			
		if(inventar["gold"] > 0)
			invString := invString "{" ov["inv"].color5 "}" "Gold: " inventar["gold"] "{FFFFFF}`n"
			
		if(inventar["lsd"] > 0)
			invString := invString "{" ov["inv"].color6 "}" "LSD: " inventar["lsd"] "{FFFFFF}`n"
			
		ov["inv"].update(invString)
	}
	
	if(ov["wanted"].enabled == 1){
		if(ov["wanted"].state == 0){
			updateWanted()
			return
		}
		ov["wanted"].update(ov["wanted"].text)
	}
	
	if(ov["fraktion"].enabled == 1){
		ov["fraktion"].update(ov["fraktion"].text)
	}
	
	if(ov["group"].enabled == 1){
		ov["group"].update(ov["group"].text)
	}
	
	if(ov["note"].enabled == 1){
		ov["note"].update(ov["note"].text)
	}
	
	if(ov["enemie"].enabled == 1){
		ov["enemie"].update(ov["enemie"].text)
	}
	
	return
}

updateInventory(){
	global
	SendChat("/oldstats")
	Sleep, 200
	
	Loop, 7 {
		GetChatLine(A_Index, chat)
		donutInfoCount := RegExMatch(chat, "Donuts\:\[(\d+)\]", donutInfo)
		brownieInfoCount := RegExMatch(chat, "Brownies\:\[(\d+)\]", brownieInfo)
		greenInfoCount := RegExMatch(chat, "Green\:\[(\d+)\]", greenInfo)
		goldInfoCount := RegExMatch(chat, "Gold\:\[(\d+)\]", goldInfo)
		lsdInfoCount := RegExMatch(chat, "LSD\:\[(\d+)\]", lsdInfo)
		
		if(donutInfoCount != 0)
			inventar["donut"] := donutInfo1

		if(brownieInfoCount != 0)
			inventar["brownie"] := brownieInfo1
			
		if(greenInfoCount != 0)
			inventar["green"] := greenInfo1
			
		if(goldInfoCount != 0)
			inventar["gold"] := goldInfo1
			
		if(lsdInfoCount != 0)
			inventar["lsd"] := lsdInfo1
	}
	
	ov["inv"].state := 1
	return
}

updateWanted(){
	global
	
	if(ov["wanted"]_Enabled == 0){
		ChatMessage("Das Wanted Overlay ist nicht aktiviert.")
		return
	}
	
	removePlayerTextLabels()
	
	wantedPlayers := []
	wantedPlayersAmount := []
	wantedPlayersGPS := []
	
	;GPS Stuff GPS Member Online:
	tmpLines:= []
	tmpIndex:= 0
	tmpMsg:= ""
	
	SendChat("/gpsinfo")
	Sleep, 200
	
	while(!InStr(tmpMsg, "GPS Member Online:")){
		GetChatLine(tmpIndex, tmpMsg)

		if(!InStr(tmpMsg, "GPS Member Online:"))
			tmpLines.Push(tmpMsg)
		
		tmpIndex++
		
		if(tmpIndex > 15)
			return
	}
	tmpIndex++
	tmpLinesCount := tmpLines.MaxIndex()

	if(tmpLinesCount){
		Loop, %tmpLinesCount% {
			tmpLine := tmpLines[A_Index]
			RegExMatch(tmpLine, "GPS: (.*) \(Nr", tmpLine)
			if(GetPlayerIdByName(tmpLine1) != -1)
				wantedGPS.Push(tmpLine1)
		}
	}
	
	;Wanted Stuff	
	if(ov["wanted"].min >= 15)
		SendChat("/wanted 8")
	else
		SendChat("/wanted 9")
	Sleep, 200
	
	tmpLines := []
	tmpIndex := 0
	tmpMsg := ""
	
	while(!InStr(tmpMsg, "Alle gesuchten Personen:")){
		GetChatLine(tmpIndex, tmpMsg)
		tmpLines.push(tmpMsg)
		tmpIndex++
		
		if(tmpIndex > 15)
			return
	}
	
	tmpLinesCount := tmpLines.MaxIndex()
	
	if(tmpLinesCount){
		tmpLines := ReverseArray(tmpLines)
		
		Loop, %tmpLinesCount% {
			tmpLine := tmpLines[A_Index]
			tmpLine := RegExReplace(tmpLine, "(.*)(\[\d+\:\d+\:\d+\]) ")
			
			if(!InStr(tmpLine, "Alle gesuchten Personen:")){
				if(InStr(tmpLine, ", ")){
					tmpLineSplit := StrSplit(tmpLine, ", ")
					
					For, index, value in tmpLineSplit {
						tmpLineSplitParts := StrSplit(value, ": ")
						tmpID := GetPlayerIdByName(tmpLineSplitParts[1])
						
						if(tmpID == -1)
							continue
						
						wantedPlayers.Push(tmpLineSplitParts[1])						
						
						if(StrLen(tmpLineSplitParts[2]) >= 3)
							tmpLineSplitParts[2]:= SubStr(tmpLineSplitParts[2], 1, -1)

						wantedPlayersAmount.Push(tmpLineSplitParts[2])
						
						if(ov["wanted"].label == 1){
							wantedLabel := new textlabel
							wantedLabel.text := "Wantedlevel " tmpLineSplitParts[2]
							wantedLabel.playerID := tmpID
							wantedLabel.create()
						}
					}
				} 
				else {
					tmpLineSplit:= SubStr(tmpLine, 1, -2)
					tmpLineSplitParts:= StrSplit(tmpLineSplit, ": ")
					
					if(GetPlayerIdByName(tmpLineSplitParts[1]) == -1)
						continue
							
					wantedPlayers.Push(tmpLineSplitParts[1])
					
					if(StrLen(tmpLineSplitParts[2]) >= 3)
						tmpLineSplitParts[2]:= SubStr(tmpLineSplitParts[2], -1)
					
					wantedPlayersAmount.Push(tmpLineSplitParts[2])
				}
			}
		}
	}
	
	wpCount := wantedPlayers.MaxIndex()
	ovString := "=== Gesuchte Spieler ==="
	
	Loop, %wpCount% {
		if(wantedAmount[A_Index] >= ov["wanted"].min) {
			ovString := ovString "`n  {FFFFFF}" wantedPlayers[A_Index] ": " wantedPlayersAmount[A_Index] "" (hasValue(wantedGPS, wantedPlayers[A_Index]) ? " {808080}**" : "")
		}
	}

	ov["wanted"].text := ovString
	ov["wanted"].state := 1
}

; =================================================================================================
; | Timer
; =================================================================================================
monitorGTA:
	if(WinExist("ahk_exe gta_sa.exe") && WinActive("ahk_exe gta_sa.exe")){
		if(FileExist(gta_folder "samp.dat") && sampdll_base_address == 0)
			FileReadline, sampdll_base_address, %gta_folder%samp.dat, 1
			
		if(sampdll_base_address != 0 && isPlayerSpawned()){
			if(!isDialogOpen && !isInMenu()){				
				loaded := 1
				keybinds := 1
				
				ChatMessage("Der Keybinder wurde {00ff00}geladen{ffffff}.")
				
				SetTimer, monitorGTA, off
				SetTimer, monitorSAMP, 5000
				SetTimer, updateOverlays, 500
			}
		}
	}
return

monitorSAMP:
	if(!WinExist("ahk_exe gta_sa.exe")){
		DestroyAllVisual()
		loaded := 0
		keybinds := 0
		SetTimer, monitorSAMP, Off
		SetTimer, monitorGTA, 5000
	}
return

updateOverlays:
	if(WinActive("ahk_exe gta_sa.exe")){
		initOverlays()
	}
return