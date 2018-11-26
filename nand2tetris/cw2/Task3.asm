//Computes RAM[0] / RAM[1] and places the round off result in RAM[2]
//x in RAM[0], y in RAM[1] and store the result z in RAM[2]. If y == 0 then RAM[3] = -1, else RAM[3] = 1

//  z = 0
//  x = R0
//  if R1 == 0 goto INVALID
//  y = R1
//  if x < 0 goto NAGETIVEx
//  goto PROCESSy
//NAGETIVEx:
//  x = -x
//PROCESSy:
//  if y < 0 goto NAGETIVEy
//  goto ELSE1
//NAGETIVEy:
//  y = -y
//
//  if R0 >= 0 goto ELSE1
//  if R1 >= 0 goto ELSE1
//  sign = 0
//  goto LOOP
//ELSE1:
//  if R0 < 0 goto ELSE2
//  if R1 < 0 goto ELSE2
//  sign = 0
//  goto LOOP
//ELSE2:
//  sign = 1
//LOOP:
//  x = x - y
//  if y < 0 goto STOP
//  z = z + 1
//  goto LOOP
//STOP:
//  if 2 * x + y < 0
//    goto F1
//  if 2 * x + y == 0
//    goto F2
//  else
//    goto F3
//F1:
//  goto SIGN
//F2:
//  if sign == 1 then goto F1
//  z = z + 1
//  goto SIGN
//F3:
//  z = z + 1
//  goto SIGN
//SIGN:
//  if sign == 0
//    goto END
//  else
//    z = -z
//    goto END
//INVALID:
//  M = -1
//  goto ENDLOOP
//END:
//  R2 = z
//  R3 = 1
//  goto ENDLOOP
//ENDLOOP:
//  goto ENDLOOP

@z
M=0     //z = 0
@0
D=M
@x
M=D     //x = RAM[0]
@1
D=M
@INVALID
D;JEQ   //if y == 0 goto INVALID
@y
M=D     //y = RAM[1]

@x
D=M
@NAGETIVEx
D;JLT	//if x < 0 goto NAGETIVEx
@PROCESSy
0;JMP	//goto PROCESSy
(NAGETIVEx)
D=!D
@x
M=D+1	//x = -x

(PROCESSy)
@y
D=M
@NAGETIVEy
D;JLT	//if y < 0 goto NAGETIVEy
@ELSE1
0;JMP	//goto ELSE1
(NAGETIVEy)
D=!D
@y
M=D+1	//y = -y

@0
D=M
@ELSE1
D;JGE   //if R0 >= 0 goto ELSE1
@1
D=M
@ELSE1
D;JGE   //if R1 >= 0 goto ELSE1
@sign
M=0		//sign = 0
@LOOP
0;JMP	//goto LOOP

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
M=0		//sign = 0
@LOOP
0;JMP	//goto LOOP

(ELSE2)
@sign
M=1		//sign = 1

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
D;JEQ	//if 2 * x + y = 0 goto F2
@F3
0;JMP   //else goto F3

(F1)
@SIGN
0;JMP	//goto SIGN

(F2)
@sign
D=M
@F1
D-1;JEQ	//if the result is nagetive and 2 * x + y = 0, z = z; else z = z + 1
@z
M=M+1   //z = z + 1
@SIGN
0;JMP	//goto SIGN

(F3)
@z
M=M+1   //z = z + 1
@SIGN
0;JMP	//goto SIGN

(SIGN)
@sign
D=M
@END
D;JEQ	//if sign == 0 (result is possitive) then goto END
@z
M=-M 	//else z = -z
@END
0;JMP 	//goto END

(INVALID)
@3
M=-1	//R3 = -1 (because y == 0)
@ENDLOOP
0;JMP   //goto ENDLOOP

(END)
@z
D=M
@2
M=D 	//R2 = z
@3
M=1		//R3 = 1 (because y <> 0)
@ENDLOOP
0;JMP   //goto ENDLOOP

(ENDLOOP)
@ENDLOOP
0;JMP   //goto ENDLOOP