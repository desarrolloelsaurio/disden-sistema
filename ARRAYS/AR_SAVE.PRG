FUNCTION ar_save
PARAMETERS ar_name
PRIVATE ar_name, t_name, a_len, a_wid, a_count
PRIVATE as_arlen, as_arwid

************************************************************
*  ar_save(<expC>)                                         *
*  Version # 2.0  FP          Date: 01-18-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function checks to see if the passed character    *
*  string is an array.  If it is, it saves it to a DBF     *
*  file and returns TRUE.  If it is not an array, it pops  *
*  a message and returns FALSE.                            *
*  Modified 11-15-90 to save to a single file rather than  *
*  two.  Elimates the need for AR_LEN and AR_WID.          *
*  Modified 1-18-91 to use indirect referencing.           *
************************************************************

IF type('ar_name') # 'C'        &&  bad parameter

  = poperror('Parameter passed AR_SAVE is not a '+;
             'character string.  Function cannot save '+;
             'your array.')

  RETURN(.f.)                 &&  no save

ENDIF

t_name = ar_name = '[1,1]'

IF type('t_name') = 'U'
  = poperror('Name passed AR_SAVE is not an array.  No '+;
             'save will be performed.')
  RETURN(.f.)
ENDIF

IF len(ar_name) > 8        &&  not a legal DOS name
  = poperror('Array name is longer than the legal DOS '+;
             'eight characters.  No save will be made.')
  RETURN(.f.)
ENDIF

***  now save the array to its own mem file

t_name = ar_name + '.PTA'
SAVE ALL LIKE (ar_name) TO (t_name)

RETURN(.t.)