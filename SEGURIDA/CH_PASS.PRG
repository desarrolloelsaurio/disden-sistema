FUNCTION ch_pass
PARAMETERS dbf_file
PRIVATE dbf_file, oldpass, newpass, new2
PRIVATE num_tries, cur_buff, cur_comp, cur_win, rvalue

************************************************************
*  ch_pass([<expC>])                                       *
*  Version # 2.2  FP          Date: 08-29-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990,91                                   *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Procedure is used to change the password of the   *
*  current system user.                                    *
*  Modified 1-22-91 to minimize macro expansion.           *
*  Modified 7-28-91 to use PUSH/POP KEY.                   *
*  Modified 8-29-91 to use WOUTPUT to control windows.     *
************************************************************

PUSH KEY CLEAR
cur_win = woutput()

num_tries = 1

cur_comp = set('compat') = 'ON' &&  dBase IV compatibility
SET COMPAT off
cur_buff = select()
SELECT 0

USE (dbf_file) ALIAS password ORDER TAG password
GO user_no                    &&  loaded in SECURITY proc.

DEFINE WINDOW ch_win FROM 03,15 TO 11,55
ACTIVATE WINDOW ch_win

@ 00,00 SAY PADC('CAMBIO DE PALABRA CLAVE',WCOLS())

DO WHILE .t.
  @ 01,00 SAY PADC('PALABRA CLAVE ANTERIOR',WCOLS())
  oldpass = encrypt(password(6),2)

  SEEK oldpass

  IF found()
    @ 01,1 SAY space(48)
    EXIT
  ELSE

    IF num_tries = 2
      = poperror('Palabra Clave Incorrecta por 2¦ '+;
                 'vez. Sistema Detenido.')
      = beep(4)
      CLOSE ALL
      CLEAR ALL
      CLEAR
      CANCEL
    ELSE
      =poperror('La Palabra Clave no est  de '+;
                'acuerdo con su login inicial al '+;
                'sistema. Intente Nuevamente.')
      num_tries = num_tries + 1
    ENDIF

  ENDIF

ENDDO

CLEAR
@ 01,0 SAY PADC('NUEVA PALABRA CLAVE',WCOLS())
newpass = password(6)

@ 01,0 SAY PADC(' *** ESCRIBALO NUEVAMENTE *** ',WCOLS())
new2 = password(6)

IF newpass = new2
   newpass = encrypt(newpass,2)
   GO TOP
   LOCATE FOR codeb = newpass

   IF eof()
     GO user_no
     REPLACE codeb WITH newpass
     rvalue = .t.
   ELSE
     = poperror('La nueva Palabra Clave no es '+;
                'Aceptada. NO HUBO CAMBIO.')    
       rvalue = .f.
   ENDIF

ELSE
  = poperror('Palabra Clave Escrita Diferenca en cada '+;
             'Intento. Reinicie Proceso.')
  rvalue = .f.
ENDIF

USE                           &&  close the password table

IF wexist('ch_win')
  RELEASE WINDOWS ch_win
ENDIF

IF wexist('pass_win')
  RELEASE WINDOW pass_win
ENDIF

IF empty(cur_win)
  ACTIVATE SCREEN
ENDIF

SELECT(cur_buff)

RETURN(rvalue)