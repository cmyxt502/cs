//Computes RAM[0] / RAM[1] and places the round off result in RAM[2]
//x in RAM[0], y in RAM[1] and store the result z in RAM[2]

//  z = 0
//LOOP:
//  x = x - y
//  if y < 0 goto STOP
//  z = z + 1
//  goto LOOP
//STOP:
//  if 2 * x + y < 0
//    goto F1
//  else
//    goto F2
//F1:
//  R2 = z
//F2:
//  z = z + 1
//  R2 = z
//END:
//  goto END

@z
M=0     //z = 0
@0
D=M
@x
M=D     //x = RAM[0]
@1
D=M
@INVALID
D;JEQ   //if y = 0 goto INVALID
@y
M=D     //y = RAM[1]

@x
D=M
@NAGETIVEx
D;JLT
@PROCESSy
0;JMP
(NAGETIVEx)
D=!D
@x
M=D+1

(PROCESSy)
@y
D=M
@NAGETIVEy
D;JLT
@ELSE1
0;JMP
(NAGETIVEy)
D=!D
@y
M=D+1

@0
D=M
@ELSE1
D;JGE   //if R0 >= 0 goto ELSE1
@1
D=M
@ELSE1
D;JGE   //if R1 >= 0 goto ELSE1
@sign
M=0
@LOOP
0;JMP

(ELSE1)
@0
D=M
@ELSE2
D;JLT   //if R0 < 0 goto ELSE2
@1
D=M
@ELSE2
D;JLT   //if R1 < 0 goto ELSE2
@sign
M=0
@LOOP
0;JMP

(ELSE2)
@sign
M=1

(LOOP)

@y
D=M
@x
M=M-D   //x = x - y
D=M
@STOP
D;JLT   //if y < 0 goto STOP
@z
M=M+1   //z = z + 1
@LOOP
0;JMP   //goto LOOP

(STOP)
@x
D=M
D=D+M
@y
D=D+M
@F1
D;JLT   //if 2 * x + y < 0 goto F1
@F2
0;JMP   //else goto F2

(F1)
@z
D=M
@2
M=D     //R2 = z
@END
0;JMP

(F2)
@z
M=M+1   //z = z + 1
D=M
@2
M=D     //R2 = z
@END
0;JMP

(INVALID)
@2
M=0

(END)
@END
0;JMP   //goto END