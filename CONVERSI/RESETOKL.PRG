FUNCTION resetokl
PARAMETERS ar_name
PRIVATE ar_name, _alen, the_cmd

************************************************************
*  resetokl(<expC>)                                        *
*  Version # 2.0  FP          Date: 05-14-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1991                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note:  Resets ON KEY LABELs that were stored to an      *
*  array using OKLS.  The function returns the number of   *
*  ON KEY LABELS restored.                                 *
************************************************************

IF parameters() = 0 .or. type('ar_name') # 'C'
  = poperror('Lousy parameter passed to RESETOKL.  You '+;
             'will have to do better next time.')
  RETURN(0)
ENDIF

IF type(ar_name+'[1,1]') = 'U'  &&  if not an array
  RETURN(0)
ENDIF

_alen = alen(&ar_name,1)      &&  how many OKLs? 

FOR i = 1 TO _alen            && reset 'em
  the_cmd = &ar_name[i,2]
  ON KEY LABEL &ar_name[i,1] &the_cmd
ENDFOR

RETURN(_alen)