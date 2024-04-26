FUNCTION calendar
PARAMETERS drow, dcol, caldate, cal_stay
PRIVATE drow, dcol, caldate, cal_stay, cur_curs, cur_cent
PRIVATE cur_date, cur_esc, cur_win, date_array, ch_date
PRIVATE cxxrow, cxxcol, date_cnt, xdte, date_lne, xdone
PRIVATE s_row, s_col, xfactor, cmos, caldt, xstart
PRIVATE xend, mrow, mcol, fmouse, key, lowcolor, hicolor
************************************************************
*  calendar([[<expN1>,]<expN2>][,<expD>][,<expL>])         *
*  Version # 2.1  FP        Date: 08-29-91                 *
*  Programmed by: Frank W. Donovan, Malcolm C. Rubel       *
*  Copyright (c) 1990                                      *
*  Frank W. Donovan & Performance Dynamics Associates      *
*  All Rights Reserved                                     *
*  Note: Function pops up a calender and allows user to    *
*  move through the months and years. Returns the          *
*  highlighted date, which can be chosen by point and      *
*  shoot with either cursor keys or a mouse.  HOME and END *
*  keys change months, and PageUp and PageDown keys        *
*  change years.  You have the option of keeping the       *
*  calendar on the screen when you pass cal_stay as a      *
*  logical TRUE.  If you do this, the last date selected   *
*  is stored to the FoxPro system memory variable,         *
*  _DIARYDATE, and is used when the calendar is re_started.*
*  Modified 7-20-91 to clear and restore ON KEY LABELs     *
*  using PUSH KEY CLEAR and POP KEY.                       *
*  Modified 8-29-91 to change WONTOP to WOUTPUT.           *
************************************************************

PUSH KEY CLEAR
keyboard chr(255)             &&  preload lastkey()
pcount = parameters()
cur_curs = set('cursor') = 'ON'
cur_cent = set('century') = 'ON'
cur_esc = set('escape') = 'ON'
cur_date = set('date')
cur_win = woutput()
SET CURSOR off
SET DATE american
SET CENTURY on
SET CURSOR off
SET ESCAPE off

DO CASE

  CASE parameters() = 0
    drow = row()
    dcol = col()
    caldate = date()
    cal_stay = .f.

  CASE parameters() = 1

    DO CASE

      CASE type('drow') = 'N'
        dcol = col()
        caldate = date()
        cal_stay = .f.

      CASE type('drow') = 'D'
        caldate = drow
        cal_stay = .f.
        drow = row()
        dcol = col()

      CASE type('drow') = 'L'
        cal_stay = drow
        caldate = date()
        drow = row()
        dcol = col()

    ENDCASE

  CASE parameters() = 2

    IF type('drow') = 'N' .and. type('dcol') = 'N'
      caldate = date()
      cal_stay = .f.
    ELSE
      caldate = drow
      cal_stay = dcol
      drow = row()
      dcol = col()
    ENDIF

  CASE parameters() = 3       &&  three params passed

    IF type('caldate') = 'L'  &&  date was left out
      cal_stay = caldate      &&  move logical var
      caldate = date()        &&  load pass_date
    ELSE
      cal_stay = .f.
    ENDIF

ENDCASE

***  check to make sure that all the parameters are correct

IF type('drow') # 'N' .or. type('dcol') # 'N' .or. ;
   type('caldate') # 'D' .or. type('cal_stay') # 'L'

  = poperror('Invalid parameters passed to CALENDAR.  '+;
             'The function will return a null date.')
  RETURN({})
ENDIF

***  now get to work
***  if the diarydate has been set and the date window
***  is already there.

IF wexist('date_win')
  caldate = _diarydate
ENDIF

button_1 = '<M+>'
button_2 = '<M->'
button_3 = '<Y+>'
button_4 = '<Y->'

drow = iif(drow>13,13,drow)
dcol = iif(dcol>42,42,dcol)

STORE 0 TO cxxrow, cxxcol, date_cnt
STORE .F. TO xdone, fmouse

IF !wexist('date_win')
  DEFINE WINDOW date_win FROM drow,dcol TO  drow+11,dcol+37 ;
                         TITLE ' CALENDARIO ' PANEL SHADOW ;
                         COLOR SCHEME 21
ENDIF

lowcolor = scheme(21,1)
hicolor = scheme(21,2)

DECLARE date_array[42,3]      &&  primary working array

s_row = 3                     &&  starting row for calendar
s_col = 2                     &&  starting col for calendar

FOR i = 1 TO 42               &&  load the row and column
   date_array[i,2] = s_row    &&  coordinates
   date_array[i,3] = s_col
   s_col = s_col + 5

   IF s_col = 37
     s_col = 2
     s_row = s_row + 1
   ENDIF

ENDFOR

ACTIVATE WINDOW date_win

DO storedate WITH caldate
xdte = substr(dtoc(caldate),4,2)

IF len(ltrim(xdte)) = 1
  xdte = '0' + right(xdte,1)
ENDIF

SET COLOR OF NORMAL TO (hicolor)
@ cxxrow,cxxcol SAY xdte
@ 09,04 SAY button_1
@ 09,12 SAY button_2
@ 09,20 SAY button_3
@ 09,28 SAY button_4
SET COLOR OF NORMAL TO (lowcolor)

DO WHILE .t.
  key = inkey(0,'hm')

  DO CASE

    CASE  key = 13 .and. !fmouse
      EXIT

    CASE key = 27 .or. xdone
      EXIT

    CASE key = 5
      DO cal_curs WITH -7

    CASE key = 4
      DO cal_curs WITH 1

    CASE key = 24
      DO cal_curs WITH 7

    CASE key = 19
      DO cal_curs WITH -1

    CASE key = 151
      DO mclick

    CASE key = 1
      DO calc_date WITH -1

    CASE key = 18
      DO calc_date WITH -12

    CASE key = 6
      DO calc_date WITH 1

    CASE key = 3
      DO calc_date WITH 12

  ENDCASE

  fmouse = .f.

ENDDO

DO CASE

  CASE cal_stay .and. lastkey() = 13   &&  stay on screen
    _diarydate = caldate      &&  load the FoxPro variable

    IF !empty(cur_win)   &&  window was there before
      ACTIVATE WINDOW (cur_win)  &&  activate it
    ELSE                      &&  no active window
      ACTIVATE SCREEN
    ENDIF

  CASE !cal_stay .and. lastkey() = 13
    _diarydate = caldate
    RELEASE WINDOW date_win

  OTHERWISE                   &&  Escape key pressed
    _diarydate = date()       &&  set to system date
    caldate = date()          &&  return system date
    RELEASE WINDOW date_win

ENDCASE

IF !cur_cent
  SET CENTURY off
ENDIF

IF cur_curs
  SET CURSOR on
ENDIF

IF cur_esc
  SET ESCAPE ON
ENDIF

SET DATE (cur_date)
POP KEY

RETURN(caldate)

******

PROCEDURE mclick

fmouse = .f.
mcrow = mrow('date_win')
mccol = mcol('date_win')

IF mcrow = 9

  DO CASE

  CASE between(mccol,4,7)
      DO calc_date with 1

    CASE between(mccol,12,15)
      DO calc_date WITH - 1

    CASE between(mccol,18,23)
      DO calc_date WITH 12

    CASE between(mccol,28,32)
      DO calc_date WITH - 12

  ENDCASE

ELSE

  FOR i = 1 TO 42

    IF date_array[i,2]  = mcrow

      IF date_array[i,3]  = mccol .or.;
         date_array[i,3] + 1 = mccol

        IF !empty(date_array[i,1])
          @ cxxrow,cxxcol SAY xdte
          caldate = date_array[i,1]
          xdte = substr(dtoc(caldate),4,2)

          IF len(ltrim(xdte)) = 1
            xdte = '0' + right(xdte,1)
          ENDIF

          @ date_array[i,2],date_array[i,3] GET xdte
          cxxrow = date_array[i,2]
          cxxcol = date_array[i,3]
          xdone = .f.
          keyboard chr(13)
          EXIT

        ENDIF

      ENDIF

    ENDIF

  ENDFOR

ENDIF

RETURN

********

PROCEDURE calc_date
PARAMETERS xfactor
PRIVATE xfactor

caldate = gomonth(caldate,xfactor)
DO storedate WITH caldate

RETURN

********

PROCEDURE cal_curs
PARAMETER xstep
PRIVATE xstep, cmos

*cmos = cmonth(caldate + xstep)
cmos=qmes(caldate+xstep)
*IF !cmos$cmonth(caldate)
IF !cmos$QMES(caldate)
  caldate = caldate + xstep
  DO storedate WITH caldate
  RETURN
ENDIF

xdte = substr(dtoc(caldate),4,2)

IF len(ltrim(xdte)) = 1
  xdte = '0' + right(xdte,1)
ENDIF

@ cxxrow,cxxcol SAY xdte
caldate = caldate + xstep
date_cnt = date_cnt + xstep
xdte = substr(dtoc(caldate),4,2)

IF len(ltrim(xdte)) = 1
  xdte = '0' + right(xdte,1)
ENDIF

cxxrow = date_array[date_cnt,2]
cxxcol = date_array[date_cnt,3]

SET COLOR OF NORMAL TO (hicolor)
@ cxxrow,cxxcol SAY xdte
SET COLOR OF NORMAL TO (lowcolor)

RETURN

********

PROCEDURE storedate
PARAMETERS caldate

caldt = firstdom(caldate)
xstart = dow(caldt)
mnth = month(caldt)
xend = lastdom(caldate)

@ 00,00 CLEAR TO 08,37
*@ 00,00 SAY padc(str(year(caldate),4,0) + ' ' + cmonth(caldate),36)
@ 00,00 SAY padc(str(year(caldate),4,0) + ' ' + QMES(caldate),36)
@ 01,00 SAY  '  Dom  Lun  Mar  Mie  Jue  Via  Sab'

FOR i = 1 TO 42

  IF i < xstart .or. caldt > xend
    @ date_array[i,2],date_array[i,3] SAY '  '
    LOOP
  ELSE
    date_array[i,1] = caldt
    xdte = substr(dtoc(caldt),4,2)

    IF len(ltrim(xdte)) = 1
      xdte = '0' + right(xdte,1)
    ENDIF
    IF caldt = caldate
      cxxrow = date_array[i,2]
      cxxcol = date_array[i,3]
      date_cnt = i
      @ cxxrow,cxxcol get xdte
    ELSE
      @ date_array[i,2],date_array[i,3] SAY xdte
    ENDIF
    caldt = caldt + 1
    new_cal = .t.
  ENDIF
ENDFOR
RETURN
