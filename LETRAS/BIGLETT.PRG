FUNCTION biglett
PARAMETERS srow, scol, p_str, iscenter
PRIVATE srow, scol, p_str, iscenter, _lett, w_cols, w_rows
PRIVATE spacer
************************************************************
*  biglett(<expN1>,<expN2>,<expC>[,<expL>])                *
*  Version # 2.0  FP          Date: 01-29-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1991                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Function puts BIG LETTERS on the screen or in a window. *
************************************************************
#DEFINE C219        CHR(219)
#DEFINE C219_2      REPL(CHR(219),2)
#DEFINE C219_3      REPL(CHR(219),3)
#DEFINE C219_5      REPL(CHR(219),5)
#DEFINE C219_6      REPL(CHR(219),6)
#DEFINE C219_7      REPL(CHR(219),7)
#DEFINE C219_8      REPL(CHR(219),8)
#DEFINE C220        CHR(220)
#DEFINE C221        CHR(221)
#DEFINE C222        CHR(222)
#DEFINE C223        chr(223)
C220_3=C220+C220+C220
C222_219=C222+C219
C219_221=C219+C221

IF parameters() = 3           &&  no centering parameter
  iscenter = .t.              &&  center it
ENDIF

p_str = upper(p_str)          &&  convert to uppercase

***  get the window rows and columns

w_rows = wrows(woutput())
w_cols = wcols(woutput())

***  get the length of the string

spacer = 0

FOR i = 1 to len(p_str)
  _lett = substr(p_str,i,1)

  DO CASE

    CASE _lett $ 'ABCDGHKNOQRUV'
      spacer = spacer + 10

    CASE _lett $ 'EFLPSTZ234567890'
      spacer = spacer + 9

    CASE _lett $ 'JXY?'
      spacer = spacer + 8

    CASE _lett $ 'I1'
      spacer = spacer + 7

    CASE _lett $ 'MW'
      spacer = spacer + 11

    CASE _lett $ ' -'          &&  a space or dash
      spacer = spacer + 5

    CASE _lett $ '.,!'         &&  period or comma
      spacer = spacer + 3

  ENDCASE

ENDFOR
***  GET the centering column

IF iscenter
   scol = int((w_cols-spacer+1)/2)
ENDIF

***  make sure that the row coordinate will be on the screen

srow = iif(w_rows-srow<7,w_rows-7,srow)
***  now print the message!! ®TS2,4,6,8,10¯®RM200¯

FOR i = 1 to len(p_str)
  _lett = substr(p_str,i,1)

  DO CASE

    CASE _lett = 'A'
      spacer = 10
      @ srow,scol+1 say c219_6 + C219
      @ srow+1,scol say C222_219
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol say C222_219
      @ srow+2,scol+7 say C219_221
      @ srow+3,scol say C222_219 + C220 + C220_3 + C220 + C219_221
      @ srow+4,scol say C222_219
      @ srow+4,scol+7 say C219_221
      @ srow+5,scol say C222_219
      @ srow+5,scol+7 say C219_221
      @ srow+6,scol say C219 + C219_221
      @ srow+6,scol+6 say C222+ c219_2

    CASE _lett = 'B'
      spacer = 10
      @ srow,scol say C219_8 + C221
      @ srow+1,scol say C222_219
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol say C222_219
      @ srow+2,scol+7 say C219_221
      @ srow+3,scol say C222 + c219_7
      @ srow+4,scol say C222_219
      @ srow+4,scol+7 say C219_221
      @ srow+5,scol say C222_219
      @ srow+5,scol+7 say C219_221
      @ srow+6,scol say C219_8 + C221

    CASE _lett = 'C'
      spacer = 10
      @ srow,scol say C219_8 + C221
      @ srow+1,scol say C219_221
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol say C219_221
      @ srow+3,scol say C219_221
      @ srow+4,scol say C219_221
      @ srow+5,scol say C219_221
      @ srow+5,scol+7 say C219_221
      @ srow+6,scol say C219_8 + C221

    CASE _lett = 'D'
      spacer = 10
      @ srow,scol say C219_8
      @ srow+1,scol say C222_219
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol say C222_219
      @ srow+2,scol+7 say C219_221
      @ srow+3,scol say C222_219
      @ srow+3,scol+7 say C219_221
      @ srow+4,scol say C222_219
      @ srow+4,scol+7 say C219_221
      @ srow+5,scol say C222_219
      @ srow+5,scol+7 say C219_221
      @ srow+6,scol say C219_8

    CASE _lett = 'E'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222 + C219_6
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C219_8

    CASE _lett = 'F'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222 + C219_6
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say c219_2+ C221

    CASE _lett = 'G'
      spacer = 10
      @ srow,scol say C219_8 + C221
      @ srow+1,scol say C222_219
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222_219
      @ srow+4,scol say C222_219
      @ srow+4,scol+6 say c223 + C219_221
      @ srow+5,scol say C222_219
      @ srow+5,scol+7 say C219_221
      @ srow+6,scol say C219_8 + C221

    CASE _lett = 'H'
      spacer = 10
      @ srow,scol say c219_2+ C221
      @ srow,scol+6 say C222_219 + C219
      @ srow+1,scol say C222_219
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol say C222_219
      @ srow+2,scol+7 say C219_221
      @ srow+3,scol say C222 + c219_7 + c221
      @ srow+4,scol say C222_219
      @ srow+4,scol+7 say C219_221
      @ srow+5,scol say C222_219
      @ srow+5,scol+7 say C219_221
      @ srow+6,scol say C219 + C219_221
      @ srow+6,scol+6 say C222_219 + C219

    CASE _lett = 'I'
      spacer = 7
      @ srow,scol say C222 + C219_5
      @ srow+1,scol+2 say C222_219
      @ srow+2,scol+2 say C222_219
      @ srow+3,scol+2 say C222_219
      @ srow+4,scol+2 say C222_219
      @ srow+5,scol+2 say C222_219
      @ srow+6,scol say C222 + C219_5

    CASE _lett = 'J'
      spacer = 8
      @ srow,scol+ 4 say C222_219 + C219
      @ srow+1,scol+5 say C219_221
      @ srow+2,scol+5 say C219_221
      @ srow+3,scol+5 say C219_221
      @ srow+4,scol say C219 + C219_221
      @ srow+4,scol+5 say C219_221
      @ srow+5,scol say C222_219
      @ srow+5,scol+5 say C219_221
      @ srow+6,scol say C222 + C219_5 +;
												C221

    CASE _lett = 'K'
      spacer = 10
      @ srow,scol say C219 + C219_221
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222_219
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C219 + C219_221
      @ srow,scol+7 say c219_2
      @ srow+1,scol+5 say C220 + C219 + c223
      @ srow+2,scol+3 say C220 + C219 + c223
      @ srow+3,scol+2 say C219 + c223
      @ srow+4,scol+2 say c223 + C219 + C220
      @ srow+5,scol+4 say c223 + C219 + C220
      @ srow+6,scol+6 say c223 + c219_2

    CASE _lett = 'L'
      spacer = 9
      @ srow,scol say C219 + C219_221
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222_219
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C219_8

    CASE _lett = 'M'
      spacer = 11
      @ srow,scol say C219 + C219_221
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222_219
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C219 + C219_221
      @ srow,scol+8 say C219 + C219_221
      @ srow+1,scol+8 say C222_219
      @ srow+2,scol+8 say C222_219
      @ srow+3,scol+8 say C222_219
      @ srow+4,scol+8 say C222_219
      @ srow+5,scol+8 say C222_219
      @ srow+6,scol+8 say C219 + C219_221
      @ srow,scol+2 say C219_221
      @ srow+1,scol+2 say C222_219
      @ srow+2,scol+3 say C219_221
      @ srow+3,scol+3 say C222_219 + C219 +;
													C221
      @ srow+2,scol+5 say C222_219
      @ srow+1,scol+6 say C222_219
      @ srow,scol+7 say c219_2

    CASE _lett = 'N'
      spacer = 10
      @ srow,scol say C219 + C219_221
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222_219
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C219 + C219_221
      @ srow+1,scol+2 say C219_221
      @ srow+2,scol+3 say C219_221
      @ srow+3,scol+4 say C219_221
      @ srow+4,scol+5 say C219_221
      @ srow+5,scol+6 say c219_2
      @ srow,scol+7 say C219 + C219_221
      @ srow+1,scol+7 say C222_219
      @ srow+2,scol+7 say C222_219
      @ srow+3,scol+7 say C222_219
      @ srow+4,scol+7 say C222_219
      @ srow+5,scol+8 say C219
      @ srow+6,scol+7 say C219 + C219_221

    CASE _lett = 'O'
      spacer = 10
      @ srow,scol say C222 + c219_7 + ;
											C221
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222_219
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C222 + c219_7 +;
												C221
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol+7 say C219_221
      @ srow+3,scol+7 say C219_221
      @ srow+4,scol+7 say C219_221
      @ srow+5,scol+7 say C219_221

    CASE _lett = 'P'
      spacer = 9
      @ srow,scol say C222 + c219_7 + ;
											C221
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222 + c219_7 + ;
												C221
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C219 + C219_221
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol+7 say C219_221
      @ srow+3,scol+7 say C219_221

    CASE _lett = 'Q'
      spacer = 10
      @ srow,scol say C222 + c219_7 + ;
											C221
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222_219
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C222 + c219_7 + ;
												c223
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol+7 say C219_221
      @ srow+3,scol+7 say C219_221
      @ srow+4,scol+7 say C219_221
      @ srow+5,scol+6 say c223 + C219_221

    CASE _lett = 'R'
      spacer = 10
      @ srow,scol say C222 + c219_7 +;
											C221
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222 + c219_7 +;
												C221
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C219 + C219_221
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol+7 say C219_221
      @ srow+3,scol+7 say C219_221
      @ srow+4,scol+2 say c223 + c219_2 +;
													c223
      @ srow+5,scol+4 say c223 + C219 + C220
      @ srow+6,scol+6 say c223 + C219_221

    CASE _lett = 'S'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol say C219_221
      @ srow+2,scol say C219_221
      @ srow+3,scol say C219_8
      @ srow+6,scol say C219_8
      @ srow+1,scol+7 say c223
      @ srow+4,scol+6 say C222_219
      @ srow+5,scol say C220
      @ srow+5,scol+6 say C222_219

    CASE _lett = 'T'
      spacer = 9
      @ srow,scol say C219_8 + C221
      @ srow+1,scol+3 say C222_219
      @ srow+2,scol+3 say C222_219
      @ srow+3,scol+3 say C222_219
      @ srow+4,scol+3 say C222_219
      @ srow+5,scol+3 say C222_219
      @ srow+6,scol+3 say C219 + C219_221

    CASE _lett = 'U'
      spacer = 10
      @ srow,scol say C219 + C219_221
      @ srow,scol+6 say C222_219 + C219
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222_219
      @ srow+4,scol say C222_219
      @ srow+5,scol say C222_219
      @ srow+6,scol say C222 + c219_7 +;
												C221
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol+7 say C219_221
      @ srow+3,scol+7 say C219_221
      @ srow+4,scol+7 say C219_221
      @ srow+5,scol+7 say C219_221

    CASE _lett = 'V'
      spacer = 10
      @ srow,scol say C219 + C219_221
      @ srow,scol+6 say C222_219 + C219
      @ srow+1,scol say C222_219
      @ srow+2,scol+1 say C219_221
      @ srow+3,scol+1 say C222_219
      @ srow+4,scol+2 say C219_221
      @ srow+5,scol+2 say C222_219
      @ srow+6,scol+3 say C219_3
      @ srow+1,scol+7 say C219_221
      @ srow+2,scol+6 say C222_219
      @ srow+3,scol+6 say C219_221
      @ srow+4,scol+5 say C222_219
      @ srow+5,scol+5 say C219_221

    CASE _lett = 'W'
      spacer = 11
      @ srow,scol say C219 + C219_221
      @ srow+1,scol say C222_219
      @ srow+2,scol say C222_219
      @ srow+3,scol say C222_219
      @ srow+4,scol+1 say C219_221
      @ srow+5,scol+1 say C222_219
      @ srow+6,scol+2 say C219 + C219_221
      @ srow+5,scol+4 say C219 + C219_221
      @ srow+6,scol+6 say C219 + C219_221
      @ srow,scol+8 say C219 + C219_221
      @ srow+1,scol+8 say C222_219
      @ srow+2,scol+8 say C222_219
      @ srow+3,scol+8 say C222_219
      @ srow+4,scol+8 say C219_221
      @ srow+5,scol+7 say C222_219

    CASE _lett = 'X'
      spacer = 8
      @ srow,scol say C219_221
      @ srow+1,scol+1 say C219_221
      @ srow+2,scol+2 say C219_221
      @ srow+3,scol+3 say C219_221
      @ srow+4,scol+4 say C219_221
      @ srow+5,scol+5 say C219_221
      @ srow+6,scol+6 say C219_221
      @ srow,scol+6 say C219_221
      @ srow+1,scol+5 say C219_221
      @ srow+2,scol+4 say C219_221
      @ srow+3,scol+3 say C219_221
      @ srow+4,scol+2 say C219_221
      @ srow+5,scol+1 say C219_221
      @ srow+6,scol+0 say C219_221

    CASE _lett = 'Y'
      spacer = 8
      @ srow,scol say C219_221
      @ srow+1,scol+1 say C219_221
      @ srow+2,scol+2 say C219_221
      @ srow,scol+6 say C219_221
      @ srow+1,scol+5 say C219_221
      @ srow+2,scol+4 say C219_221
      @ srow+3,scol+2 say C222_219 + C219
      @ srow+4,scol+3 say C219_221
      @ srow+5,scol+3 say C219_221
      @ srow+6,scol+2 say C222_219 + C219

    CASE _lett = 'Z'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol say c223
      @ srow+5,scol+7 say C220
      @ srow+6,scol say C219_8
      @ srow+1,scol+6 say c219_2
      @ srow+2,scol+4 say C222_219 + C221
      @ srow+3,scol+3 say c219_2
      @ srow+4,scol+1 say C222_219 + C221
      @ srow+5,scol say c219_2

    CASE _lett = '1'
      spacer = 7
      @ srow,scol+1 say C220 + c219_2
      @ srow+1,scol+2 say C222_219
      @ srow+2,scol+2 say C222_219
      @ srow+3,scol+2 say C222_219
      @ srow+4,scol+2 say C222_219
      @ srow+5,scol+2 say C222_219
      @ srow+6,scol say C222 + C219_5

    CASE _lett = '2'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+4,scol say C219_221
      @ srow+5,scol say C219_221
      @ srow+3,scol say C219_8
      @ srow+6,scol say C219_8
      @ srow+2,scol+6 say C222_219
      @ srow+1,scol+6 say C222_219

    CASE _lett = '3'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol+6 say C222_219
      @ srow+2,scol+6 say C222_219
      @ srow+3,scol+1 say C222 + C219_6
      @ srow+4,scol+6 say C222_219
      @ srow+5,scol+6 say C222_219
      @ srow+6,scol say C219_8

    CASE _lett = '4'
      spacer = 9
      @ srow,scol say C222_219
      @ srow,scol+6 say C222_219
      @ srow+1,scol say C222_219
      @ srow+1,scol+6 say C222_219
      @ srow+2,scol say C222_219
      @ srow+2,scol+6 say C222_219
      @ srow+3,scol say C222 + c219_7
      @ srow+4,scol+6 say C222_219
      @ srow+5,scol+6 say C222_219
      @ srow+6,scol+6 say C222_219

    CASE _lett = '5'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol say C219_221
      @ srow+2,scol say C219_221
      @ srow+3,scol say C219_8
      @ srow+6,scol say C219_8
      @ srow+4,scol+6 say C222_219
      @ srow+5,scol+6 say C222_219

    CASE _lett = '6'
      spacer = 9
      @ srow,scol say C219_221
      @ srow+1,scol say C219_221
      @ srow+2,scol say C219_221
      @ srow+3,scol say C219_8
      @ srow+4,scol say C219_221
      @ srow+5,scol say C219_221
      @ srow+6,scol say C219_8
      @ srow+4,scol+6 say C222_219
      @ srow+5,scol+6 say C222_219

    CASE _lett = '7'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol+6 say C222_219
      @ srow+2,scol+6 say C222_219
      @ srow+3,scol+6 say C222_219
      @ srow+4,scol+6 say C222_219
      @ srow+5,scol+6 say C222_219
      @ srow+6,scol+6 say C222_219

    CASE _lett = '8'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol say C219_221
      @ srow+2,scol say C219_221
      @ srow+3,scol say C219_8
      @ srow+4,scol say C219_221
      @ srow+5,scol say C219_221
      @ srow+6,scol say C219_8
      @ srow+1,scol+6 say C222_219
      @ srow+2,scol+6 say C222_219
      @ srow+4,scol+6 say C222_219
      @ srow+5,scol+6 say C222_219

    CASE _lett = '9'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol say C219_221
      @ srow+2,scol say C219_221
      @ srow+3,scol say C219_8
      @ srow+1,scol+6 say C222_219
      @ srow+2,scol+6 say C222_219
      @ srow+4,scol+6 say C222_219
      @ srow+5,scol+6 say C222_219
      @ srow+6,scol+6 say C222_219

    CASE _lett = '0'
      spacer = 9
      @ srow,scol say C219_8
      @ srow+1,scol say C219_221
      @ srow+2,scol say C219_221
      @ srow+3,scol say C219_221
      @ srow+4,scol say C219_221
      @ srow+5,scol say C219_221
      @ srow+6,scol say C219_8
      @ srow+1,scol+6 say C222_219
      @ srow+2,scol+6 say C222_219
      @ srow+3,scol+6 say C222_219
      @ srow+4,scol+6 say C222_219
      @ srow+5,scol+6 say C222_219

    CASE _lett = ' '
      spacer = 5

    CASE _lett = '.'
      spacer = 3
      @ srow+6,scol say c219_2

    CASE _lett = ','
      spacer = 3
      @ srow+6,scol say c223 + C219

    CASE _lett = '!'
      spacer = 3
      @ srow,scol say c219_2
      @ srow+1,scol say c219_2
      @ srow+2,scol say c219_2
      @ srow+3,scol say c219_2
      @ srow+4,scol say c219_2
      @ srow+6,scol say c219_2

    CASE _lett = '?'
      spacer = 8
      @ srow,scol say C222 + C219_6 + ;
											C221
      @ srow+3,scol+3 say C219 + C219_3 + ;
												C221
      @ srow+4,scol+3 say c219_2
      @ srow+6,scol+3 say c219_2
      @ srow+1,scol+6 say C219_221
      @ srow+2,scol+6 say C219_221

    CASE _lett = '-'
      spacer = 6
      @ srow+3,scol SAY C222 + C219_3

  ENDCASE

  scol = scol + spacer

ENDFOR

RETURN('')
