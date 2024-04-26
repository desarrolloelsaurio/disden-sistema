FUNCTION strtolog
PARAMETERS str_val
PRIVATE str_val, choice, rvalue

************************************************************
*  strtolog(<expC>)                                        *
*  Version # 1.0  FP          Date: 02-06-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts 'YyTt' to logical TRUE and      *
*  'NnFf' to logical FALSE.  Any other character values    *
*  will result in a popup choice asking the user what to   *
*  store the value as.  If the choice is to abort, the     *
*  function sends back a null value.                       *
************************************************************

rvalue = .f.

IF type('str_val') = 'C'      &&  character data

  str_val = alltrim(upper(str_val))  &&  convert and trim

  DO CASE

    CASE str_val == 'Y' .or. str_val == 'T'
      rvalue = .t.

    CASE str_val == 'N' .or. str_val == 'F'

    OTHERWISE
      = beep()
      choice = popmenu(1,1,'Invalid character string '+;
                       'passed to the function '+;
                       'STRTOLOG.  String passed was "'+;
                        str_val + '".   Your choice...',;
                       'T -- store as true',;
                       'F -- store as false',;
                       'A -- abort')

      DO CASE

        CASE choice = 1
          rvalue = .t.

        CASE choice = 2
          rvalue = .f.

        CASE choice = 3
          rvalue = ''

      ENDCASE

  ENDCASE

ELSE                          &&  if not character data

  = poperror('Parameter passed to the function '+;
             'STRTOLOG is not character data.  '+;
             'Function will return FALSE anyway.')
    rvalue = .f.
ENDIF

RETURN(rvalue)