FUNCTION ar_rest
PARAMETERS ar_name, keep_ar
PRIVATE ar_name, t_name, as_arlen, ar_arwid

************************************************************
*  ar_rest(<expC>[,<expL>])                                *
*  Version # 2.0  FP          Date: 01-22-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function checks to see if the passed character    *
*  string is a memory file on disk.  If it is, it restores *
*  ADDITIVE from that memory file.  If it is not a valid   *
*  file, the function pops a message and returns FALSE.    *
*  Modified 11-26-90 to use a low-level file function to   *
*  determine the array length and width.                   *
*  Modified 1-22-91 to check that the array being restored *
*  is an array and to get rid of macro expansion.          *
************************************************************

IF parameters() = 1
  keep_ar = .f.
ENDIF

IF type('ar_name') # 'C'        &&  bad parameter

  = poperror('Parameter passed AR_REST is not a '+;
             'character string.  Function cannot restore '+;
             'your array.')

  RETURN(.f.)                 &&  no restore

ENDIF

IF len(ar_name) > 8           &&  to long
  = poperror('Array name is longer than the legal DOS '+;
             'eight characters.  No array file will be '+;
             'restored.')
  RETURN(.f.)

ELSE 
  t_name = upper(ar_name) + '.PTA'

  IF !file(t_name)

    = poperror('No file named "' + t_name + '" was '+;
               'found on disk!  File cannot be restored.')
    RETURN(.f.)

  ELSE                        &&  everything fits!

***  first find out the array dimensions

    f_handle = fopen(t_name)

    IF f_handle = -1
      = poperror('Problem opening ' + t_name + ;
                 '.  Array cannot be restored.')
      RETURN(.f.)

    ELSE                      &&  check for array!
      = fseek(f_handle,11)    &&  move to memvar type
      ar_data = fread(f_handle,1)  &&  get the type

      IF ar_data # 'A'        &&  not have an array
        = poperror('Data in the memory file is not an '+;
                   'array.  AR_REST will return FALSE.')
        = fclose(f_handle)
        RETURN(.f.)
      ELSE
        = fseek(f_handle,32)  &&  go to the dim. figures
        ar_data = fread(f_handle,4)  &&  and get them

***  array length is the ascii value of the 32nd byte
***  plus the ascii value of the 33rd byte times 256

        ar_len = asc(substr(ar_data,1,1))  + ;
                 256 * asc(substr(ar_data,2,1))

***  array width is the ascii value of the 34th byte
***  plus the ascii value of the 35th byte times 256

        ar_wid = asc(substr(ar_data,3,1))  + ;
                 256 * asc(substr(ar_data,4,1))

***  if there is no width (one-dimensional array), make
***  the width 1

        ar_wid = iif(ar_wid = 0,1,ar_wid)
        = fclose(f_handle)
      ENDIF

    ENDIF
  ENDIF
ENDIF
IF type(ar_name) = 'U'
  PUBLIC (ar_name)
ENDIF

***  next dimension the array even if it already exists
new_arr = ar_name + '[ar_len,ar_wid]'
DECLARE (new_arr)

***  now restore the array
RESTORE FROM (t_name) ADDITIVE
IF !keep_ar              &&  do not save disk file
  ERASE (t_name)
ENDIF

RETURN .t.