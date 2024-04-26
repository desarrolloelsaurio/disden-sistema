PROCEDURE new_usEr
PRIVATE l_name, f_name, c_a, c_b, c_c, choice,ESGOYO,ch1
ESGOYO=(GETENV("USERNAME")="GOYO")

f_name = space(20)
l_name = space(20)
ch1=' '

IF ESGOYO
DEFINE WINDOW sec_win FROM 08,15 TO 18,65 PANEL ;
              COLOR SCHEME 21
ELSE
DEFINE WINDOW sec_win FROM 08,15 TO 17,65 PANEL ;
              COLOR SCHEME 21
ENDIF

ACTIVATE WINDOW sec_win

@ 02,10 SAY 'Login Nuevos Usuarios'
@ 04,05 SAY 'Nombre         :'
@ 05,05 SAY 'Apellido       :'
IF ESGOYO
@ 06,05 SAY 'Cod. Acceso    :'
ENDIF

@ 04,22 GET f_name pict '@!'
@ 05,22 GET l_name pict '@!'
if esgoyo
   @ 06,22 get ch1 pict '9'
else
ch1='1'
endif
READ
if last() # 27 .and. !empty(f_name) .and. !empty(l_name)
do WHILE .t.

  DO WHILE .t.
    c_b = password(6)
    = popmess(15,22,'Escriba Palabra Clave nuevamente.')
    c_c = password(6)

    IF c_c = c_b
      EXIT
    ELSE
      = beep(1)
      choice = popmenu(0,0,'La Palabra Clave escrita '+;
                      'es diferencta a la '+;
                      'que eligi¢...',;
                      'Reintenta','Sale')

      IF choice = 2
        CLEAR
        CLOSE ALL
        QUIT
      ENDIF

    ENDIF

  ENDDO

  c_b = encrypt(c_b,2)

  GO top
  LOCATE FOR codeb = c_b

  IF eof()                    &&  if password is unique
    EXIT
  ELSE
    = poperror('Password not acceptable to system. '+;
               'Type a different code.')
  ENDIF

ENDDO

c_a = subst(l_name + f_name,1,4) + ch1

APPEND BLANK
a=recno()
REPLACE last_name WITH code(l_name,a)
REPLACE first_name WITH code(f_name,a+1)
REPLACE codea WITH code(c_a,a+2)
REPLACE codeb WITH c_b

user_no = recno()
access = 1
rvalue = l_name + ' / ' + f_name
endif
DEACTIVATE WINDOW sec_win
RELEASE WINDOWS sec_win

RETURN
