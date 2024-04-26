FUNCTION beep
PARAMETERS song
PRIVATE song, i
*****************************************************
*  beep(<expN>)                                     *
*  Version # 1.0  FP          Date: 10-26-89        *
*  Programmed by: Malcolm C. Rubel                  *
*  Note: Plays the songs from the Xbase Hit Parade. *
*  song      1 = error                              *
*            2 = danger                             *
*            3 = hello                              *
*            4 = death                              *
*            5 = slide up                           *
*            6 = slide down                         *
*****************************************************
IF type('song') # 'N'       &&  if bizzare thing passed
  song = 0
ENDIF
DO CASE
  CASE song = 1
    SET BELL TO 800,1
    ?? chr(7)
    = inkey(.1)
    ?? chr(7)
  CASE song = 2
    SET BELL TO 523.3,1
    ?? chr(7)
    = inkey(.1)
    ?? chr(7)
    = inkey(.1)
    ?? chr(7)
    = inkey(.1)
    ?? chr(7)
    = inkey(.1)
  CASE song = 3
    SET BELL TO 261,3
    ?? chr(7)
    SET BELL TO 349,4
    ?? chr(7)
    SET BELL TO 440,1
    ?? chr(7)
    SET BELL TO 349,1
    ?? chr(7)
    SET BELL TO 261,3
    ?? chr(7)
    SET BELL TO 349,4
    ?? chr(7)
    SET BELL TO 440,8
    ?? chr(7)
    SET BELL TO 349,6
    ?? chr(7)
  CASE song = 4
    SET BELL TO 261,8
    ?? chr(7)
    SET BELL TO 261,7
    ?? chr(7)
    SET BELL TO 261,2
    ?? chr(7)
    SET BELL TO 261,8
    ?? chr(7)
    SET BELL TO 311,7
    ?? chr(7)
    SET BELL TO 293,2
    ?? chr(7)
    SET BELL TO 293,7
    ?? chr(7)
    SET BELL TO 261,2
    ?? chr(7)
    SET BELL TO 261,7
    ?? chr(7)
    SET BELL TO 247,2
    ?? chr(7)
    SET BELL TO 261,8
    ?? chr(7)
  CASE song = 5
    FOR i = 400 to 1800 step 100
      SET BELL TO i,1
      ?? chr(7)
    ENDFOR
  CASE song = 6
    FOR i = 1800 to 400 step -100
      SET BELL TO i,1
      ?? chr(7)
    ENDFOR
  OTHERWISE
    SET BELL TO 440,6
    ?? chr(7)
ENDCASE
RETURN .T.