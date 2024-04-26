clea
set talk off
=adir(COSA,'*.DBF')
FOR A=1 TO ALEN(COSA,1)
? COSA[A,1]
=INKEY(.1)
USE (COSA[A,1])
NEXT
RETURN
