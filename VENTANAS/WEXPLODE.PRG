FUNCTION wexplode
PARAMETERS w_name, ul_rr, ul_cc, lr_rr, lr_cc, b_type;
           b_title, c_scheme
PRIVATE w_name, ul_rr, ul_cc, lr_rr, lr_cc, b_type, ;
        b_type, c_scheme
PRIVATE mid_rr, mid_cc, rr_it, cc_it, max_it, b_start
PRIVATE rr_incr, cc_incr, i, b_incr, pcount, rvalue

************************************************************
*  wexplode(<expC1>,<expN1>,<expN2>,<expN3>,<expN4>;       *
*           [,<expC2>][,<expC3>[,<expN5>]])                *
*  Version # 2.1              Date: 08-29-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990,91                                   *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function takes window name, window coordinates,   *
*  and optionally the window type and explodes the window  *
*  up to that size.  Function returns the name of the      *
*  window that was active before the window exploded on    *
*  screen.  If no window was active, the function returns  *
*  a 0l value.                                           *
*  Modified 10-1-90 to include a color scheme choice.      *
*  Modified 1-23-91 to reduce the use of macro expansion   *
*  to a minimum.                                           *
*  Modified 8-29-91 to change WONTOP to WOUTPUT.           *
************************************************************

pcount = parameters()         &&  how many were passed
rvalue = woutput()            &&  active window

IF pcount < 5                 &&  not enough parameters 
  = poperror('Not enough parameters passed to WEXPLODE.  '+;
             'Window will not pop.')
  RETURN(rvalue)
ENDIF

IF pcount = 5
  b_type = ''
  c_scheme = 1
ENDIF 

IF pcount = 6

  IF type('b_type') = 'C'  

    IF len(b_type) = 1
      b_type = upper(b_type)
      b_title = ''
      c_scheme = 1
    ELSE
      b_title = b_type
      b_type = ''
      c_scheme = 1
    ENDIF

  ELSE

    IF type('b_type') = 'N'
      b_type = ''
      b_title = ''
      c_scheme = b_type
    ENDIF

  ENDIF

ENDIF

IF pcount = 7

  IF type('b_title') = 'N'
    c_scheme = b_title
    b_title = ''
  ENDIF

ENDIF

b_type = upper(b_type)

DO CASE

  CASE b_type = 'D'
    b_type = 'DOUBLE'

  CASE b_type = 'P'
    b_type = 'PANEL'

  OTHERWISE
    b_type = ''

ENDCASE

***  first find the screen coordinates for the middle of the 
***  box for both row and column

mid_rr = ul_rr + int((lr_rr - ul_rr)/2)
mid_cc = ul_cc + int((lr_cc - ul_cc)/2)

***  how many 'steps' will we have to take in both the x 
***  and y axes to 'grow' the box to its full size

rr_it = int((lr_rr - ul_rr)/2)
cc_it = int((lr_cc - ul_cc)/2)

***  if the box is greater than the minimum size that makes 
***  exploding worthwhile

IF rr_it >= 4 .and. cc_it >= 4

***  which is larger the x or y axis.  use the larger axis
***  to control the explosion.  

  max_it = iif(rr_it>cc_it,rr_it,cc_it)
  b_start = int(max_it/4)      &&  where to start from
  b_incr = ceiling(max_it/5)   &&  what 'grow' increment 

***  explode the window in steps

  FOR i = b_start TO max_it - 2  STEP b_incr
    rr_incr = int(rr_it*(i/max_it))
    cc_incr = int(cc_it*(i/max_it))

    DEFINE WINDOW (w_name) ;
                  FROM mid_rr-rr_incr,mid_cc-cc_incr;
                  TO mid_rr+rr_incr, mid_cc + cc_incr;
                  &b_type COLOR SCHEME c_scheme
    ACTIVATE WINDOW (w_name)

    = inkey(.01)              &&  pause just a bit

  ENDFOR

ENDIF

***  now activate the real window!

b_title = iif(empty(b_title),'','TITLE "' + b_title + '"')

DEFINE WINDOW (w_name) FROM ul_rr, ul_cc TO lr_rr,lr_cc ;
              &b_type &b_title COLOR SCHEME c_scheme
ACTIVATE WINDOW (w_name)

RETURN(rvalue)
