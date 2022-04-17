B4R=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=3.9
@EndOfDesignText@

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'Public variables can be accessed from all modules.
	Public const COMMON_CATHODE As UInt = 0
	Public const COMMON_ANODE 	As UInt = 1
	Private a, b, c, d, e, f, g, p As Pin
	Private Pins() As Pin = Array As Pin(a, b, c, d, e, f, g, p)
	Private Value As Boolean
End Sub

Public Sub Begin (HardwareConfig As UInt, PinA As Byte, PinB As Byte, PinC As Byte, PinD As Byte, PinE As Byte, PinF As Byte, PinG As Byte, PinP As Byte)
	a.Initialize(PinA, a.MODE_OUTPUT)
	b.Initialize(PinB, b.MODE_OUTPUT)
	c.Initialize(PinC, c.MODE_OUTPUT)
	d.Initialize(PinD, d.MODE_OUTPUT)
	e.Initialize(PinE, e.MODE_OUTPUT)
	f.Initialize(PinF, f.MODE_OUTPUT)
	g.Initialize(PinG, g.MODE_OUTPUT)
	p.Initialize(PinP, p.MODE_OUTPUT)
	
	Select Case HardwareConfig
		Case COMMON_ANODE
			Value = False
		Case COMMON_CATHODE
			Value = True
	End Select
	blank
End Sub

Public Sub setSegments (segA As Boolean, segB As Boolean, segC As Boolean, segD As Boolean, segE As Boolean, segF As Boolean, segG As Boolean, decP As Boolean)
	a.DigitalWrite(IIf(segA, Value, Not(Value)))
	b.DigitalWrite(IIf(segB, Value, Not(Value)))
	c.DigitalWrite(IIf(segC, Value, Not(Value)))
	d.DigitalWrite(IIf(segD, Value, Not(Value)))
	e.DigitalWrite(IIf(segE, Value, Not(Value)))
	f.DigitalWrite(IIf(segF, Value, Not(Value)))
	g.DigitalWrite(IIf(segG, Value, Not(Value)))
	p.DigitalWrite(IIf(decP, Value, Not(Value)))
End Sub

Public Sub setNumber (Number As Int)
	Dim On As Boolean = Value
	Dim Off As Boolean = Not(Value)
	'refreshDisplay
	Select Case Number
		Case 0
			a.DigitalWrite(On)
			b.DigitalWrite(On)
			c.DigitalWrite(On)
			d.DigitalWrite(On)
			e.DigitalWrite(On)
			f.DigitalWrite(On)
			g.DigitalWrite(Off)
		Case 1
			a.DigitalWrite(Off)
			b.DigitalWrite(On)
			c.DigitalWrite(On)
			d.DigitalWrite(Off)
			e.DigitalWrite(Off)
			f.DigitalWrite(Off)
			g.DigitalWrite(Off)
		Case 2
			a.DigitalWrite(On)
			b.DigitalWrite(On)
			c.DigitalWrite(Off)
			d.DigitalWrite(On)
			e.DigitalWrite(On)
			f.DigitalWrite(Off)
			g.DigitalWrite(On)
		Case 3
			a.DigitalWrite(On)
			b.DigitalWrite(On)
			c.DigitalWrite(On)
			d.DigitalWrite(On)
			e.DigitalWrite(Off)
			f.DigitalWrite(Off)
			g.DigitalWrite(On)
		Case 4
			a.DigitalWrite(Off)
			b.DigitalWrite(On)
			c.DigitalWrite(On)
			d.DigitalWrite(Off)
			e.DigitalWrite(Off)
			f.DigitalWrite(On)
			g.DigitalWrite(On)
		Case 5
			a.DigitalWrite(On)
			b.DigitalWrite(Off)
			c.DigitalWrite(On)
			d.DigitalWrite(On)
			e.DigitalWrite(Off)
			f.DigitalWrite(On)
			g.DigitalWrite(On)
		Case 6
			a.DigitalWrite(On)
			b.DigitalWrite(Off)
			c.DigitalWrite(On)
			d.DigitalWrite(On)
			e.DigitalWrite(On)
			f.DigitalWrite(On)
			g.DigitalWrite(On)
		Case 7
			a.DigitalWrite(On)
			b.DigitalWrite(On)
			c.DigitalWrite(On)
			d.DigitalWrite(Off)
			e.DigitalWrite(Off)
			f.DigitalWrite(Off)
			g.DigitalWrite(Off)
		Case 8
			a.DigitalWrite(On)
			b.DigitalWrite(On)
			c.DigitalWrite(On)
			d.DigitalWrite(On)
			e.DigitalWrite(On)
			f.DigitalWrite(On)
			g.DigitalWrite(On)
		Case 9
			a.DigitalWrite(On)
			b.DigitalWrite(On)
			c.DigitalWrite(On)
			d.DigitalWrite(On)
			e.DigitalWrite(Off)
			f.DigitalWrite(On)
			g.DigitalWrite(On)
		Case Else 'Error = E
			a.DigitalWrite(On)
			b.DigitalWrite(Off)
			c.DigitalWrite(Off)
			d.DigitalWrite(On)
			e.DigitalWrite(On)
			f.DigitalWrite(On)
			g.DigitalWrite(On)
	End Select
End Sub

Public Sub setDecimalPoint (Show As Boolean)
	Dim On As Boolean = Value
	Dim Off As Boolean = Not(Value)
	If Not(Show) Then
		Log("setDecimalPoint = False")
		On = Not(On)
		Off = Not(Off)
	End If
	p.DigitalWrite(On)
End Sub

Public Sub refreshDisplay
	Log("refreshDisplay")
	For Each pn As Pin In Pins
		pn.DigitalWrite(Value)
	Next
End Sub

Public Sub blank
	Log("blank")
	For Each pn As Pin In Pins
		pn.DigitalWrite(Not(Value))
	Next
End Sub