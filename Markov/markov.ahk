;OPTIMIZATIONS START
#NoEnv
Process, Priority, , H
SetBatchLines, -1
ListLines Off
#KeyHistory 0
SendMode Input
SetTitleMatchMode 2
SetTitleMatchMode Fast
SetKeyDelay, -1, -1, Play
SetMouseDelay, -1
SetWinDelay, 0
SetControlDelay, 0	
SetDefaultMouseSpeed, 0
;OPTIMIZATIONS END

SetWorkingDir %A_ScriptDir%
Array := []
Lastword := ""
Wabbit := ""


Loop, Read, ChatData.txt
{
	LineWords := StrSplit(A_LoopReadLine, " ")
	Prevword := ""
	For k, v in LineWords
	{
		if(RegExMatch(v,"[a-zA-Z0-9_/?!@#$%^&*.,':]")){
			if not Array.HasKey(Prevword . " " . v){
				Array[Prevword . " " . v] := 1
			}
			else{
				Array[Prevword . " " . v] := Array[Prevword . " " . v] + 1
			}
		}
	Prevword := v
	}
}
Numpad7::

while 1==1 {

AryCount := 0
Cheese := 0
Value := 0
SubAry := []

For ka, va in Array
{
	Wago := StrSplit(ka, " ")
	Ag := Wago[2]
	if (Wago[1] == Lastword && Wago[1] != Wago[2]){
		SubAry[Ag] := va
		Value := Value + va
		AryCount := AryCount + 1
	}
}
if (AryCount == 0){
Lastword := ""
sendraw, %Wabbit% 
Wabbit := ""
break
}

while Cheese == 0 {
For ks, vs in SubAry
{	
	Angus := Value-((Value/100)*vs)
	Random, Addword, vs, Value +0.0
	if (Addword > Value-((Value/100)*vs)){
		Wabbit := Wabbit . ks . " "
		Cheese := 1
		Lastword := ks
		Apap := []
		SubAry := []
		break
	}
}
}
Cheese := 0

}

return

Numpad4::
InputBox, Sentencestarter , Custom sentence starter, enter a word,,250,100
if !ErrorLevel
Lastword := Sentencestarter
Wabbit := Wabbit . Sentencestarter . " "
return
