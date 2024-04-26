FUNCTION segurida
PARAMETERS dbf_file
PRIVATE dbf_file, cur_buff, cur_comp, cur_win, rvalue

rvalue = ''

cur_buff = select()
cur_win = woutput()


IF !file(dbf_file)
  DO mak_pass                 &&  make new password table
ELSE
  DO chk_pass                 &&  check password from table
ENDIF

USE                           &&  close down password table

RELEASE WINDOW pass_win       &&  get rid of unneeded window

SELECT(cur_buff)

IF empty(cur_win)
  ACTIVATE SCREEN
ENDIF

RETURN rvalue

PROCEDURE chk_pass
PRIVATE password, pass_count

SELECT 0

USE (dbf_file) ALIAS password
pass_count = 1

DO WHILE .t.

  ***  get the password from user

  password = encrypt(password(6),2)
  GO top
  LOCATE FOR codeb = password

  DO CASE

    CASE !eof()          &&  password found
      user_no = recno()
      access = val(subst(decode(codea,USER_NO+2),5,1))
      rvalue = decode(last_name,USER_NO) + ' / ' + ;
               decode(first_name,USER_NO+1)

      EXIT

    CASE eof() .AND. pass_count < 3
      = popmess('Palabra Clave Incorrecta. Reintente.')

    CASE eof() .AND. pass_count = 3
      = poperror('Acceso Denegado')
      rvalue = ''
      EXIT

  ENDCASE

  pass_count = pass_count + 1  &&  keep track of # of tries

ENDDO

RETURN

********

PROCEDURE mak_pass
PRIVATE acc_cod

CLEAR
= poperror('Data security table not found!  '+;
           'Creating a new data file.  Notify '+;
           'system administrator at once.')

DEFINE WINDOW mak_pass FROM 05,10 TO 15,65 DOUBLE
ACTIVATE WINDOW mak_pass
@ 02,05 SAY 'Creating a new data file.  If this system is'
@ 03,05 SAY 'currently in use all users will have to re-'
@ 04,05 SAY 'enter their names and passwords.  The system'
@ 05,05 SAY 'administrator will also have to establish '
@ 06,05 SAY 'access levels for each user.'

@ 08,15 SAY 'Press any key to continue...'
= inkey(0,'hm')
RELEASE WINDOW mak_pass

password = password(6)

IF password # 'gdiana'        &&  super-secret master code!
  = poperror('Incorrect failsafe password.  System '+;
             'aborting.')
  CLOSE ALL
  CLEAR
  QUIT
ENDIF

***  see if the one file that we create out of nothing is
***  on the disk.  If it is not, create it.

CREATE TABLE (dbf_file) (first_name C(20), last_name c(20),;
              codea C(5), codeb N(5,0))
USE
USE (dbf_file) ALIAS password
INDE ON codeb TAG password

DO new_usr

***  set up the first user as the system administrator

acc_cod = decode(codea,9)
acc_cod = subst(acc_cod,1,4) + '9'
acc_cod = code(acc_cod,9)
REPLACE codea with acc_cod

access = 9

RETURN

********
