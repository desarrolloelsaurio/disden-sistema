PRIVATE m.currarea, m.talkstat, m.compstat
DEFINE WINDOW _0is0o8h3w ;
		AT 9.000, 18.000 ;
		SIZE 9.286,106.000 ;
		TITLE "ARTICULO" ;
		FONT "ARIAL", 8 ;
		FLOAT ;
		NOCLOSE ;
		MINIMIZE ;
		SYSTEM ;
		COLOR RGB(,,,0,128,0)
DEFINE POPUP _0is0o8h4v ;
	PROMPT FIELD merca +" .... "+ articulo ;
	SCROLL
ACTIVATE WINDOW _0is0o8h3w NOSHOW
@ 0, 0 GET m.eleli ;
 	PICTURE "@&T" ;
	POPUP _0is0o8h4v ;
	DEFAULT " " ;
	FONT "Courier New", 10 ;
	STYLE "B" ;
	COLOR RGB(255,255,0,0,128,128),RGB(255,255,0,0,128,128)
IF NOT WVISIBLE("_0is0o8h3w")
	ACTIVATE WINDOW _0is0o8h3w
ENDIF
READ CYCLE
RELEASE WINDOW _0is0o8h3w
RELEASE POPUPS _0is0o8h4v
return





#REGION 0
REGIONAL m.currarea, m.talkstat, m.compstat

IF SET("TALK") = "ON"
	SET TALK OFF
	m.talkstat = "ON"
ELSE
	m.talkstat = "OFF"
ENDIF
SET READBORDER ON

*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º               Windows Window definitions                º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*
*
*IF NOT WEXIST("_0is0o8h3w")
	DEFINE WINDOW _0is0o8h3w ;
		AT 9.000, 18.000 ;
		SIZE 9.286,106.000 ;
		TITLE "ARTICULO" ;
		FONT "ARIAL", 8 ;
		FLOAT ;
		NOCLOSE ;
		MINIMIZE ;
		SYSTEM ;
		COLOR RGB(,,,0,128,0)
*ENDIF


#REGION 1
DEFINE POPUP _0is0o8h4v ;
	PROMPT FIELD merca +" .... "+ articulo ;
	SCROLL

*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º             ELIMERCA/Windows Screen Layout              º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*

#REGION 1
ACTIVATE WINDOW _0is0o8h3w NOSHOW
@ 0, 0 GET m.eleli ;
 	PICTURE "@&T" ;
	POPUP _0is0o8h4v ;
	DEFAULT " " ;
	FONT "Courier New", 10 ;
	STYLE "B" ;
	COLOR RGB(255,255,0,0,128,128),RGB(255,255,0,0,128,128)

*	SIZE 7.875,65.750 

IF NOT WVISIBLE("_0is0o8h3w")
	ACTIVATE WINDOW _0is0o8h3w
ENDIF

READ CYCLE

RELEASE WINDOW _0is0o8h3w
RELEASE POPUPS _0is0o8h4v

#REGION 0

SET READBORDER &rborder

IF m.talkstat = "ON"
	SET TALK ON
ENDIF
IF m.compstat = "ON"
	SET COMPATIBLE ON
ENDIF
return
