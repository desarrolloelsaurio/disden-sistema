FUNCTION poperror
PARAMETERS err_mess
PRIVATE cur_color, cur_curs, bord_str, err_mess, say_mess 
PRIVATE num_lines, start_line, cur_width, i, rvalue
PRIVATE cur_win

************************************************************
*  poperror(<expC>)                                        *
*  Version # 2.0  FP          Date: 07-20-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Procedure pops up an error in lower right corner  *
*  of screen and waits for a keypress to go back to screen.*
*  Modified 7-20-91 to include PUSH/POP key.               *
************************************************************

PUSH KEY CLEAR
= beep(1)

cur_win = woutput()
cur_width = set('memowidth')  &&  save the old setting
SET MEMOWIDTH TO 48

num_lines = memlines(err_mess) &&  how long is message?
start_line = 20 - num_lines    &&  starting row for box

DEFINE WINDOW poperr from start_line,14 TO 23,65 DOUBLE ;
              SHADOW COLOR SCHEME 19

ACTIVATE WINDOW poperr

***  paint the message on the screen line by line

IF num_lines = 1
  @ 0,01 SAY padc(err_mess,48)
  i = 1
ELSE

  FOR i = 0 TO num_lines-1
    say_mess = mline(err_mess,i+1)
    @ i,01 SAY ltrim(say_mess) &&  say message line
  ENDFOR

ENDIF

***  draw a line across the bottom of the message and
***  paint "press any key..."

@ i,00 SAY replicate(chr(196),50)      &&  draw line

@ i+1,01 SAY 'Toque una Tecla para Continuar '

rvalue = inkey(0,'hm')        &&  hide the cursor

IF wexist('poperr')
  RELEASE WINDOW poperr
ENDIF
IF empty(cur_win)
  ACTIVATE SCREEN
ENDIF
SET MEMOWIDTH TO cur_width
POP KEY
RETURN rvalue