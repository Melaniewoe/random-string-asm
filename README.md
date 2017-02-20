# random-string-asm

(UserInt) procedure that asks for an unsigned integer input (N) from a user. The procedure will pass this integer back to 
the calling program as an argument (this means in a register).    
 
(RandStr) procedure that generates a string of length (L = 10), containing  random capital letters. When calling the 
procedure, pass the value of L in EBX, and pass the offset of an array of bytes which will hold the string in EAX. 
