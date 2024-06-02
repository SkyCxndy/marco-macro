
#Requires Autohotkey v2
;AutoGUI creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;EasyAutoGUI-AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

if A_LineFile = A_ScriptFullPath && !A_IsCompiled
{
	myGui := Constructor()
	myGui.Show("w452 h197")
}

Constructor()
{	
	TraySetIcon("shell32.dll","77")
	myGui := Gui()
	ButtonF1Start := myGui.Add("Button", "x8 y176 w65 h18", "F1: Start")
	myGui.Add("Text", "x0 y24 w442 h5 +0x10")
	myGui.Add("Text", "x8 y32 w433 h23 +0x200 +Center +Border", "Main")
	Tab := myGui.Add("Tab3", "x0 y0 w452 h172", ["Macro", "Settings"])
	Tab.UseTab(1)
	CheckBox1 := myGui.Add("CheckBox", "x8 y56 w120 h23", "Collect Items")
	ButtonF2End := myGui.Add("Button", "x88 y176 w65 h18", "F2: End")
	Tab.UseTab()
	ButtonF1Start.OnEvent("Click", OnEventHandler)
	CheckBox1.OnEvent("Click", OnEventHandler)
	ButtonF2End.OnEvent("Click", OnEventHandler)
	myGui.OnEvent('Close', (*) => ExitApp())
	myGui.Title := "Marco Macro V0.1"
	
	OnEventHandler(*)
	{
		ToolTip("Click! This is a sample action.`n"
		. "Active GUI element values include:`n"  
		. "ButtonF1Start => " ButtonF1Start.Text "`n" 
		. "CheckBox1 => " CheckBox1.Value "`n" 
		. "ButtonF2End => " ButtonF2End.Text "`n", 77, 277)
		SetTimer () => ToolTip(), -3000 ; tooltip timer
	}
	
	return myGui
}