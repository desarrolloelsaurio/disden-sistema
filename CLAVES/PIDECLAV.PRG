function pideclav
para quenro

STORE FOPEN('\\willy\archivos\sistemas\ventas\ventasa\pases.dat') TO file_handle
for i = 1 to quenro
	quees = FGETS(file_handle)
next
= FCLOSE(file_handle)	

lacla = password(len(quees)+1,1,"clave:" )
return UPPER(quees)==alltrim(upper(lacla))

FUNCTION password
PARAMETERS pw_len,pw_lower, message
PRIVATE pw_len, pass_str, key, cur_curs, params

************************************************************
*  password([<expN1>],[<expN2>])                           *
*  Note: Displays a password entry box on the screen and   *
*  echoes stars as the user enters his or her password.    *
*  Returns the password string.                            *
*  Modified 7-20-91 to clear ON KEY LABELs with PUSH KEY   *
*  CLEAR/POP KEY.                                          *
*  Modified 8-29-91 to use WOUTPUT to control windows.     *
************************************************************

*-------------------------------------------------------------------------
* Modified for ALTCS system, made Oct-3-92 by A.L.T.C.S.
* MOdified for windows 11/05/94
*-------------------------------------------------------------------------

PUSH KEY CLEAR

params = parameters()

do case
  case params = 0           &&  if no parameters passed
       pw_len = 10           &&  use password length of 10
     message = "Please enter your System Password"
  case params = 1
     message = "Please enter your System Password"
  case params = 2
     message = "Please enter your System Password"
  
endcase

PASS_STR = ''
key = 0

cur_curs = set('cursor') = 'ON'   &&  current cursor state
SET CURSOR on

  DEFINE WINDOW pass_win AT  0.000, 0.000  ;
     SIZE 7,60 FONT "Courier New", 10 ;
     TITLE "" NOCLOSE SYSTEM COLOR RGB(,,,192,192,192)
     
  MOVE WINDOW pass_win CENTER

  ACTIVATE WINDOW pass_win

   @ 0.517,3.967 SAY message FONT "MS Sans Serif", 18 STYLE "BIT" ;
     COLOR RGB(224,224,224,224,224,224)
  @ 0.407,3.633 SAY message FONT "MS Sans Serif", 18 STYLE "BIT" ;
     COLOR RGB(32,32,32,32,32,32)
  @ 0.462,3.800 SAY message FONT "MS Sans Serif", 18 STYLE "BIT" ;
     COLOR RGB(128,128,128,,,,)

**  DO 3DBOX WITH 3.0,22 ,2,19,   -1.8,   255,255,255,   96,96,96

  private nxxx123
  m.nxxx123 = space(10)
  

s1 = seconds()

do while .t.  && loop for fewest possible characters

  DO WHILE key # 13             &&  accept until car_return

      SET COLOR OF NORMAL TO 
       @ 3.2,22.5 SAY replicate(chr(95),len(pass_str)) FONT "Courier New", 18 STYLE "B"


      SET COLOR OF NORMAL TO x
       m.key = inkey(20)   &&-- 20 seconds per character
     
       DO CASE
        case m.key = 0  && e.g. time ran out
           pass_str = ''
           RELEASE WINDOW pass_win
           IF !cur_curs             &&  if cursor was off
                SET CURSOR OFF       &&  set it back on
           ENDIF

           POP KEY

           RETURN(pass_str)
  
         CASE isalpha(chr(m.key)) .or. ;
              (m.key >= 32 .and. m.key <= 64)
              pass_str = pass_str + chr(m.key)

         CASE m.key = 19 .or. m.key = 127 .or. m.key = 7
              @ row(),col()-1 SAY chr(95) FONT "Courier New", 18 STYLE "B"
              @ row(),col()-1 SAY chr(95) FONT "Courier New", 18 STYLE "B"
              pass_str = substr(pass_str,1,len(pass_str)-1)

       ENDCASE

       IF len(pass_str) >= pw_len
         m.key = 13
       ENDIF

  ENDDO

  if params < 2
     exit
  endif
  
  if len(pass_str) = 0
     EXIT
  endif
  
  if len(pass_str) < pw_lower
     wait 'La clave debe tener por lo menos '+ alltrim(Str(pw_lower,2)) + ' caracteres!' windows
     pass_str = ''
     key = 0
  else
     exit
  endif
enddo

RELEASE WINDOW pass_win

IF !cur_curs             &&  if cursor was off
 SET CURSOR OFF         &&  set it back on
ENDIF

POP KEY

RETURN(pass_str) &&-- password
