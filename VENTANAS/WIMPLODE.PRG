FUNCTION wimplode
PARAMETERS w_name, b_type, c_scheme
PRIVATE w_name, b_type, c_scheme
PRIVATE mid_rr, mid_cc, rr_it, cc_it, max_it, b_fin, rr_incr
PRIVATE cc_incr, b_incr, lr_rr, lr_cc, ul_rr, ul_cc, pcount
PRIVATE i, rvalue

************************************************************
*  wimplode(<expC1>[,<expC2>][,<expN>])                    *
*  Version # 2.1              Date: 08-29-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990,91                                   *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function takes window name, and optionally, the   *
*  window type, and implodes the window.  Function returns *
*  the name of the window that was active when the         *
*  function was called.                                    *
*  Modified 10-1-90 to include a color scheme choice.      *
*  Modified 1-23-91 to reduce the use of macro expansion   *
*  to a minimum.                                           *
*  Modified 8-29-91 to change WONTOP to WOUTPUT.           *
************************************************************

pcount = parameters()         &&  how many were passed
rvalue = woutput()            &&  active window

IF pcount = 1
  b_type = ''
  c_scheme = 1
ENDIF

IF pcount = 2 

  IF type('b_type') = 'C'  
    b_type = upper(b_type)
    c_scheme = 1
  ELSE

    IF type('b_type') = 'N'
      b_type = ''
      c_scheme = b_type
    ENDIF

  ENDIF

ENDIF

DO CASE

  CASE b_type = 'D'
    b_type = 'DOUBLE'

  CASE b_type = 'P'
    b_type = 'PANEL'

  OTHERWISE
    b_type = ''

ENDCASE

***  find out if the named window is the active window.  If 
***  it is not, activate it before imploding it.

IF wontop() # upper(w_name)
  ACTIVATE WINDOW (w_name)
ENDIF

***  get the row and column coordinates for the window.

ul_rr = wlrow()               &&  upper left hand corner
ul_cc = wlcol()               &&  upper left hand corner
lr_rr = ul_rr + wrows()       &&  lower right corner
lr_cc = ul_cc + wcols()       &&  lower right corner

***  first find the screen coordinates for the middle of the 
***  box for both row and column

mid_rr = ul_rr + int((lr_rr - ul_rr)/2)
mid_cc = ul_cc + int((lr_cc - ul_cc)/2)

***  how many 'steps' will we have to take in both the x 
***  and y axes to implode the box

rr_it = int((lr_rr - ul_rr)/2)
cc_it = int((lr_cc - ul_cc)/2)

***  if the box is greater than the minimum size that makes 
***  imploding worthwhile

IF rr_it >= 4 .and. cc_it >= 4

***  which is larger the x or y axis.  use the larger axis
***  to control the implosion.  

  max_it = iif(rr_it>cc_it,rr_it,cc_it)
  b_fin = int(max_it/4)        &&  where to start from
  b_incr = -(ceiling(max_it/5))  &&  what implode increment 

***  implode the window in steps

  FOR i = max_it - 2 TO b_fin  STEP b_incr
    rr_incr = int(rr_it*(i/max_it))
    cc_incr = int(cc_it*(i/max_it))

    DEFINE WINDOW (w_name) FROM mid_rr-rr_incr,mid_cc-cc_incr;
                        TO mid_rr+rr_incr, mid_cc + cc_incr;
                        &b_type COLOR SCHEME c_scheme
    ACTIVATE WINDOW (w_name)

    = inkey(.01)              &&  pause just a bit

  ENDFOR

ENDIF

***  now activate the real window!

RELEASE WINDOW (w_name)

RETURN(rvalue)