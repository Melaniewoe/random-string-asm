; HW 4	(randomstring.asm)

; using procedures so that the input from the user
; determines how many times to generate a random string

INCLUDE Irvine32.inc

.data
str1 BYTE "Please enter an usigned integer: ", 0
stringLength = 10
strArr BYTE stringLength DUP (?)
inputNumber DWORD ?

.code
main PROC

	call UserInt							;user input
	call RandomString							;random string PROC
	call WaitMsg							;wait for a key to be pressed
	exit
main ENDP

UserInt PROC
	;userInt procedure that asks for an unsigened int
	mov EDX, OFFSET str1
	call WriteString						;display the string in the console window
	call readInt							;input integer to EAX
	mov inputNumber, EAX					; move user input to inputNumber
	ret
UserInt ENDP

RandomString PROC
	;generate random string
	call Randomize
	mov EBX, inputNumber				; input number into EBX
	mov ECX, EBX						; loop = user input

L1:	
	push ECX							;save userinput
	mov ECX, stringLength				;number of letters in each string
	mov ESI, OFFSET strArr				;string index

L2:	
	mov EAX,26							;value 0-25
	call RandomRange					;generate randomint
	add EAX,65							; value 65-90 (starting from A)
	mov [ESI], AL				    ; insert char into array
	inc ESI
	loop L2

	call RandomColor					; calling the randomcolor proc
	mov EDX, OFFSET strArr				;puts in the EDX to output
	call Writestring					;output to screen
	call crlf
	pop ECX								;get the loop back
	loop L1
	ret 
			
RandomString ENDP

RandomColor PROC
	push EAX
	mov EAX, 16							;0-15 (black -white)
	call RandomRange					; produce random value
	add EAX, 1							; without black
	call SetTextColor					; set text color
	pop EAX
	ret
RandomColor ENDP




exit
END main