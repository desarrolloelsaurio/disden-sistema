FUNCTION resetord
PRIVATE rvalue, i_order, i

************************************************************
*  resetord()                                              *
*  Version # 1.0  FP          Date: 02-14-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Resets index order saved with SAVEORD.  Function  *
*  releases the array and returns the number of indexes    *
*  reset.                                                  *
************************************************************

IF type('ord_arr[1]') = 'U'   &&  if array does not exist

  = poperror('The array containing the index order '+;
             'does not exist.  You must not have '+;
             'saved the index order with SAVEORD.')
  rvalue = 0

ELSE

  i_order = ''
  i = 1

  DO WHILE type('ord_arr[i]') = 'C'
    i_order = i_order + ord_arr[i] +','
    i = i + 1
  ENDDO

  rvalue = i-1

***  trim off the last comma

  i_order = substr(i_order,1,len(i_order)-1)

  SET INDEX TO &i_order       &&  set the indexes in order
  RELEASE ord_arr             &&  get rid of the array

ENDIF

RETURN(rvalue)
