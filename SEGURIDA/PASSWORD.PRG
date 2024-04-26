FUNCTION password
PARAMETERS pw_len
PRIVATE pw_len, pass_str, key, cur_curs
PUSH KEY CLEAR
IF parameters() = 0           &&  if no parameters passed
  pw_len = 6                  &&  use password length of 6
ENDIF
pass_str = ''
key = 0
cur_curs = set('cursor') = 'ON'   &&  current cursor state
SET CURSOR on
=MOVEWIN(10,20,18,60,'PASS_WIN','SU PASSWORD',.F.,.F.,'FONT "ARIAL",8')
cur_win = woutput()
@ 02,0 SAY PADC('Escriba Palabra Clave',WCOLS())
@ 03,0 SAY PADC('(' + ltrim(str(pw_len)) + ' Letras.)',WCOLS())
@ 05,15 SAY ''
DO WHILE key # 13             &&  accept until car_return
  SET COLOR OF NORMAL TO x
  m.key = inkey(0)
  DO CASE
    CASE isalpha(chr(m.key)) .or. ;
         (m.key >= 32 .and. m.key <= 64)
      pass_str = pass_str + chr(m.key)
    CASE m.key = 19 .or. m.key = 127 .or. m.key = 7
      @ row(),col()-1 SAY ' ' 
      @ row(),col()-1 SAY '' 
      pass_str = substr(pass_str,1,len(pass_str)-1)
  ENDCASE
  IF len(pass_str) >= pw_len
    m.key = 13
  ENDIF
  SET COLOR OF NORMAL TO
  @ 05,15 SAY space(pw_len) 
  @ 05,15 SAY replicate('*',len(pass_str)) 
ENDDO
RELEASE WINDOW pass_win
IF empty(cur_win)
  ACTIVATE SCREEN
ENDIF
IF !cur_curs             &&  if cursor was off
  SET CURSOR OFF              &&  set it back on
ENDIF
POP KEY
RETURN pass_str
