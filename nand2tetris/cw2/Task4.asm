//x in RAM[0], operation code in RAM[1], y in RAM[2], '=' in RAM[3] and the result z in RAM[4]

//BEGIN:
//  GET_x:
//    if RAM[24576] - 48 < 0 goto GET_x
//    RAM[0] = RAM[24576] - 48
//
//  GET_operator:
//    if RAM[24576] - 42 < 0 goto GET_operator
//    if RAM[24576] - 47 > 0 goto GET_operator
//    RAM[1] = RAM[24576]
//
//  GET_y:
//    if RAM[24576] - 48 < 0 goto GET_y
//    RAM[2] = RAM[24576] - 48
//
//  GET_equal:
//    if RAM[24576] - 61 != 0 goto GET_equal
//    RAM[3] = 5
//
//  PLUS:
//    if RAM[1] != 43 goto MINUS
//    RAM[1] = 1
//    RAM[4] = RAM[0] + RAM[2]
//    goto END
//
//  MINUS:
//    if RAM[1] != 45 goto MULTIPLY
//    RAM[1] = 2
//    RAM[4] = RAM[0] - RAM[2]
//    goto END
//
//  MULTIPLY:
//    z = 0
//    x = RAM[0]
//    y = RAM[2]
//    if RAM[1] != 42 goto DEVIDE
//    RAM[1] = 3
//  MULTSUB:
//    if x <= 0 goto ENDMULT
//    x = x - 1
//    z = z + y
//    goto MULTSUB
//  ENDMULT:
//    RAM[4] = z
//    goto END
//
//  DEVIDE:
//    z = 0
//    x = RAM[0]
//    y = RAM[2]
//    RAM[1] = 4
//  LOOP:
//    x = x - y
//    if y < 0 goto STOP
//    z = z + 1
//    goto LOOP
//  STOP:
//    if 2 * x + y < 0
//      goto F1
//    else
//      goto F2
//  F1:
//    RAM[4] = z
//  F2:
//    z = z + 1
//    RAM[4] = z
//
//  END:
//    goto BEGIN

(BEGIN)

(GET_x)
@24576
D=M
@48
D=D-A
@GET_x
D;JLT   //loop while the input char is not a number
@0
M=D     //store input number into RAM[0]

(GET_operator)
@24576
D=M
@42
D=D-A
@GET_operator
D;JLT   //loop while the input less than '*'
@6
D=D-A
@GET_operator
D;JGE   //loop while the input greater than '/'
@48
D=D+A
@1
M=D     //store the ascii code of operator into RAM[1]

(GET_y)
@24576
D=M
@48
D=D-A
@GET_y
D;JLT   //loop while the input char is not a number
@2
M=D     //store input number into RAM[2]

(GET_equal)
@24576
D=M
@61
D=D-A
@GET_equal
D;JNE   //loop while the input char is not equal to '='
@5
D=A
@3
M=D     //RAM[3] = 5

(PLUS)
@1
D=M
@43
D=D-A
@MINUS
D;JNE   //if R1 != 43 then continue
@1
M=1     //R1 = 1
@0
D=M
@2
D=D+M
@4
M=D     //R4 (z) = R0 (x) + R2 (y)
@END
0;JMP   //goto END

(MINUS)
@1
D=M
@45
D=D-A
@MULTIPLY
D;JNE   //if R1 != 45 then continue
@2
D=A
@1
M=D     //R1 = 2
@0
D=M
@2
D=D-M
@4
M=D     //R4 (z) = R0 (x) - R2 (y)
@END
0;JMP   //goto END

(MULTIPLY)
@z
M=0     //z = 0
@0
D=M
@x
M=D     //x = RAM[0]
@2
D=M
@y
M=D     //y = RAM[2]

@1
D=M
@42
D=D-A
@DEVIDE
D;JNE   //if R1 != 42 then continue
@3
D=A
@1
M=D     //R1 = 3

(MULTSUB)
@x
D=M
@ENDMULT
D;JLE   //if x <= 0 goto ENDMULT

@x
M=M-1   //x = x - 1
@y
D=M
@z
M=M+D   //z = z + y
@MULTSUB
0;JMP   //goto MULTSUB

(ENDMULT)
@z
D=M
@4
M=D     //RAM[4] = z
@END
0;JMP   //goto END

(DEVIDE)
@z
M=0     //z = 0
@0
D=M
@x
M=D     //x = RAM[0]
@2
D=M
@y
M=D     //y = RAM[2]

@4
D=A
@1
M=D     //R1 = 4

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
@4
M=D     //R4 = z
@END
0;JMP

(F2)
@z
M=M+1   //z = z + 1
D=M
@4
M=D     //R4 = z
@END
0;JMP

(END)
@BEGIN
0;JMP   //goto BEGIN