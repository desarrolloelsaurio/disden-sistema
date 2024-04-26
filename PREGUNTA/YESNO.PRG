FUNCTION yesno
PARAMETERS s_row, s_col, bx_mess
PRIVATE s_row, s_col, bx_mess, num_lines, cur_width, e_mess
PRIVATE i, m_col, yes_on, _temp, cur_win, rvalue

************************************************************
*  yesno([<expN1>,[<expN2,]][<expC>])                      *
*                                                          *
*  Version # 2.2 FP           Date: 08-29-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990,91                                   *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function creates a dialog box in the middle of    *
*  the screen, paints the message passed in <expC> and     *
*  puts up two choices, "Yes" and "No", with "Yes" being   *
*  the default.  Function returns logical TRUE if the      *
*  user selects "Yes", and FALSE if they select "No".  The *
*  function returns TRUE if the user presses Ctrl + Enter  *
*  no matter what prompt is currently selected.            *
*  Modified 10-16-90 to make the mouse work properly.      *
*  Function now uses no READ and no menu to get response.  *
*  Modified 11-29-90 to add row and column movement.       *
*  Modified 1-21-91 to take out macro expansion.           *
*  Modified 7-20-91 to clear ON KEY LABELs with PUSH KEY   *
*  CLEAR/POP KEY.                                          *
*  Modified 8-29-91 to use WOUTPUT to control windows.     *
************************************************************

PUSH KEY CLEAR
rvalue = .f.
e_mess = 'Invalid parameters passed to the function '+;
         'YESNO.  Function will return FALSE.'
cur_win = woutput()

DO CASE

  CASE parameters() = 0       &&  no parameter passed
    s_row = 9
    s_col = 16
    bx_mess = 'Your choice.....'

  CASE parameters() = 1

    IF type('s_row') = 'C'
      bx_mess = s_row
      s_row = 9
      s_col = 16
    ELSE

      IF type('s_row') = 'N'
         s_col = 16
         bx_mess = 'Your choice.....'
      ELSE
        = poperror(e_mess)
        POP KEY
        RETURN(.f.)
      ENDIF

    ENDIF

  CASE parameters() = 2

    IF type('s_row') = 'N' .and. type('s_col') = 'C'
      bx_mess = s_col
      s_col = 16
    ELSE

      IF type('s_row') = 'N' .and. type('s_col') = 'N'
         bx_mess = 'Your choice.....'
      ELSE
        = poperror(e_mess)
        POP KEY
        RETURN(.f.)
      ENDIF

    ENDIF

  CASE parameters() = 3

      IF type('s_row') # 'N' .or. type('s_col') # 'N' .or. ;
         type('bx_mess') # 'C'
        = poperror(e_mess)
        POP KEY
        RETURN(.f.)
      ENDIF

  OTHERWISE                   &&  real bad parameters
    = poperror(e_mess)
    POP KEY
    RETURN(.f.)
ENDCASE

cur_width  = set('memowidth')

***  paint the message that is to appear at the top
***  of the dialog box.

IF len(bx_mess) <= 40         &&  if message is one line
  num_lines = 1
ELSE                          &&  if message is 2+ lines
  SET MEMOWIDTH TO 40
  num_lines = memlines(bx_mess)
ENDIF

optcolor = scheme(2,6)        &&  for the option choices
hotcolor = scheme(2,7)        &&  for the hotkeys

***  make sure that everything fits on the screen!

s_row = iif(s_row+5+num_lines<25,s_row,24-5-num_lines)
s_col = iif(s_col<33,s_col,32)

DEFINE WINDOW yesno FROM s_row,s_col TO ;
              s_row+5+num_lines,s_col+47 ;
              DOUBLE COLOR SCHEME 1
ACTIVATE WINDOW yesno

IF num_lines = 1
  @ 01,03 SAY padc(bx_mess,40)
  i = 3
ELSE

  FOR i = 1 to num_lines
    @ i,03 SAY mline(bx_mess,i)
  ENDFOR

  i = i + 1
ENDIF

@ i,07 SAY  chr(174) + '  Yes  '+ chr(175)
@ i,29 SAY '<  No  >'
SET COLOR OF NORMAL TO (hotcolor)
@ i,10 SAY 'Y'
@ i,32 SAY 'N'
SAVE SCREEN TO _temp

yes_on = .t.                  &&  starting condition
key = 0

DO WHILE .t.

  DO CASE

    CASE key = 151            &&  if mouse button pressed
      m_col = mcol()

      DO CASE

        CASE mrow() # i       &&  not on right row
          LOOP

        CASE between(m_col,7,15)      && hit on yes
           rvalue = .t.
           EXIT

        CASE between(m_col,29,36)     &&  hit on no
           rvalue = .f.
           EXIT

      ENDCASE

***  test for right or left arrow keys and repaint

    CASE key = 4 .or. key = 19
      yes_on = iif(yes_on,.f.,.t.)

    CASE key = 13             &&  Enter key pressed
      rvalue = iif(yes_on,.t.,.f.)
      EXIT

***  test for 'y', 'Y', and Ctrl + Enter

    CASE key =  89 .or. key = 121 .or. key = 10
      rvalue = .t.
      EXIT

    CASE key =  78 .OR. key = 110   && 'N' or 'n'
      rvalue = .f.
      EXIT

  ENDCASE  

  IF yes_on
    SET COLOR OF NORMAL TO (optcolor)
    @ i,08 SAY  '  Yes  '
  ELSE
    SET COLOR OF NORMAL TO (optcolor)
    @ i,30 SAY '  No  '
  ENDIF

  key = inkey(0,'hm')         &&  wait for key or mouse

  RESTORE SCREEN FROM _temp  

ENDDO

IF key = 151                  &&  mouse hit
  RESTORE SCREEN FROM _temp
  SET COLOR OF NORMAL TO (optcolor)

  IF rvalue
    @ i,07 SAY  chr(174) + '  Yes  '+ chr(175)
  ELSE
    @ i,29 SAY '<  No  >'
  ENDIF

  = inkey(.3,'H')
ENDIF

SET MEMOWIDTH TO cur_width    &&  reset memowidth
SET COLOR OF NORMAL TO 
RELEASE WINDOW yesno

IF empty(cur_win)
  ACTIVATE SCREEN
ENDIF

POP KEY

RETURN(rvalue)