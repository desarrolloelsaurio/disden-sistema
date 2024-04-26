FUNCTION setorder
PARAMETERS i_order
PRIVATE i_order, pcount, ndx_name, n_name, f_path, f_name
PRIVATE i, rvalue

************************************************************
*  setorder([<expN>])                                      *
*  Version # 2.0  FP         Date: 05-18-90                *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: SETORDER returns the number of currently selected *
*  index file and optionally changes the controlling index *
*  to the index number specified in the passed parameter.  *
*  Modified 5-18-90 to use the SYS(21) function.  Much     *
*  cleaner and faster.  Thank you Fox.                     *
************************************************************

IF version() < "FoxPro 1.02"
  pcount = parameters()
  ndx_name = order()          &&  current index name

  IF set('fullpath') = 'ON'   &&  if fullpath is on
    f_path = .t.
    SET FULLPATH off          &&  turn it off
  ELSE
    f_path = .f.
  ENDIF

  i = 1

  DO WHILE .t.

    IF len(ndx(i)) = 0        && no index there!
      rvalue = 0              && return zero
      EXIT                    && and exit loop

    ELSE                      && if index exists

***  trim off the drive designator and extension

      n_name = substr(ndx(i),3,at('.',ndx(i))-3)

      IF upper(alltrim(ndx_name)) == n_name
        rvalue = i
        EXIT
      ELSE
        i = i + 1
      ENDIF

    ENDIF

  ENDDO

  IF pcount = 1               &&  we want to change order
    SET ORDER TO i_order
  ENDIF

ELSE

***  this is version 1.02 way

  pcount = parameters()
  rvalue = sys(21)

  IF pcount = 1               &&  we want to change order
    SET ORDER TO i_order
  ENDIF

ENDIF

RETURN(rvalue)
