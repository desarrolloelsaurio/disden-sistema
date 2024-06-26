*       *********************************************************
*       *                                                         
*       * 28/02/95            ENTRE_FE.PRG               19:02:15 
*       *                                                         
*       *********************************************************
*       *                                                         
*       * Author's Name                                           
*       *                                                         
*       * Copyright (c) 1995 Company Name                         
*       * Address                                                 
*       * City,     Zip                                           
*       *                                                         
*       * Description:                                            
*       * This program was automatically generated by GENSCRN.    
*       *                                                         
*       *********************************************************

PARAMETERS en_tex
DO CASE
CASE _WINDOWS OR _MAC   && no MAC records in screen

	
	*       *********************************************************
	*       *                                                         
	*       *         ENTRE_FE/Windows Setup Code - SECTION 1         
	*       *                                                         
	*       *********************************************************
	*
	
	#REGION 1
	STORE IIF(EMPTY(EN_TEX)," L�mites de Fecha ",EN_TEX) TO EN_TEX
	
	
	#REGION 0
	REGIONAL m.currarea, m.talkstat, m.compstat
	
	IF SET("TALK") = "ON"
		SET TALK OFF
		m.talkstat = "ON"
	ELSE
		m.talkstat = "OFF"
	ENDIF
	m.compstat = SET("COMPATIBLE")
	SET COMPATIBLE FOXPLUS
	
	m.rborder = SET("READBORDER")
	SET READBORDER ON
	
	*       *********************************************************
	*       *                                                         
	*       *               Windows Window definitions                
	*       *                                                         
	*       *********************************************************
	*
	
	IF NOT WEXIST("_qy414syas")
		DEFINE WINDOW _qy414syas ;
			AT  0.000, 0.000  ;
			SIZE 6.077,62.400 ;
			TITLE " L�mites de Fecha " ;
			FONT "MS Sans Serif", 8 ;
			FLOAT ;
			NOCLOSE ;
			MINIMIZE ;
			SYSTEM ;
			COLOR RGB(,,,0,128,0)
		MOVE WINDOW _qy414syas CENTER
	ENDIF
	
	
	*       *********************************************************
	*       *                                                         
	*       *             ENTRE_FE/Windows Screen Layout              
	*       *                                                         
	*       *********************************************************
	*
	
	#REGION 1
	IF WVISIBLE("_qy414syas")
		ACTIVATE WINDOW _qy414syas SAME
	ELSE
		ACTIVATE WINDOW _qy414syas NOSHOW
	ENDIF
	@ 1.308,2.400 SAY "FECHA INICIAL" + CHR(13) + ;
		"FECHA FINAL" ;
		SIZE 2.000,15.300, 0.000 ;
		FONT "Arial", 16 ;
		STYLE "BT" ;
		COLOR RGB(255,255,255,,,,)
	@ 1.308,36.400 GET M.FECINI ;
		SIZE 0.960,10.400 ;
		DEFAULT {  /  /  } ;
		FONT "Arial", 16 ;
		STYLE "BI" ;
		PICTURE "@K" ;
		MESSAGE "Fecha Inicial "+en_tex ;
		COLOR ,RGB(255,255,255,0,128,0)
	@ 3.231,36.400 GET M.FECFIN ;
		SIZE 0.960,10.400 ;
		DEFAULT {  /  /  } ;
		FONT "Arial", 16 ;
		STYLE "BI" ;
		PICTURE "@K" ;
		WHEN last()#27 .and. !empty(m.fecini) ;
		MESSAGE "Fecha Final "+en_tex ;
		COLOR ,RGB(255,255,255,0,128,0)
	
	IF NOT WVISIBLE("_qy414syas")
		ACTIVATE WINDOW _qy414syas
	ENDIF
	
	READ
	
	RELEASE WINDOW _qy414syas
	
	#REGION 0
	
	SET READBORDER &rborder
	
	IF m.talkstat = "ON"
		SET TALK ON
	ENDIF
	IF m.compstat = "ON"
		SET COMPATIBLE ON
	ENDIF
	
	
	*       *********************************************************
	*       *                                                         
	*       *              ENTRE_FE/Windows Cleanup Code              
	*       *                                                         
	*       *********************************************************
	*
	
	#REGION 1
	EN_COSA=lastkey()#27
	EN_COSA=IIF(EN_COSA,!empty(fecini),EN_COSA)
	EN_COSA=IIF(EN_COSA,!empty(fecfin),EN_COSA)
	EN_COSA=IIF(EN_COSA,FECINI<=FECFIN,EN_COSA)
	RETURN EN_COSA
	

CASE _DOS OR _UNIX      && no UNIX records in screen

	
	*       *********************************************************
	*       *                                                         
	*       *         ENTRE_FE/MS-DOS Setup Code - SECTION 1          
	*       *                                                         
	*       *********************************************************
	*
	
	#REGION 1
	if _windows
	   STORE IIF(EMPTY(EN_TEX)," L�mites de Fecha ",EN_TEX) TO EN_TEX
	else
	   STORE IIF(EMPTY(EN_TEX)," L�mites de Fecha ",EN_TEX) TO EN_TEX
	endif
	
	#REGION 0
	REGIONAL m.currarea, m.talkstat, m.compstat
	
	IF SET("TALK") = "ON"
		SET TALK OFF
		m.talkstat = "ON"
	ELSE
		m.talkstat = "OFF"
	ENDIF
	m.compstat = SET("COMPATIBLE")
	SET COMPATIBLE FOXPLUS
	
	*       *********************************************************
	*       *                                                         
	*       *                MS-DOS Window definitions                
	*       *                                                         
	*       *********************************************************
	*
	
	IF NOT WEXIST("_qy414sz3q")
		DEFINE WINDOW _qy414sz3q ;
			FROM INT((SROW()-6)/2),INT((SCOL()-46)/2) ;
			TO INT((SROW()-6)/2)+5,INT((SCOL()-46)/2)+45 ;
			TITLE " L�mites de Fecha " ;
			FLOAT ;
			NOCLOSE ;
			MINIMIZE ;
			DOUBLE ;
			COLOR SCHEME 1
	ENDIF
	
	
	*       *********************************************************
	*       *                                                         
	*       *              ENTRE_FE/MS-DOS Screen Layout              
	*       *                                                         
	*       *********************************************************
	*
	
	#REGION 1
	IF WVISIBLE("_qy414sz3q")
		ACTIVATE WINDOW _qy414sz3q SAME
	ELSE
		ACTIVATE WINDOW _qy414sz3q NOSHOW
	ENDIF
	@ 1,22 GET M.FECINI ;
		SIZE 1,8 ;
		DEFAULT {  /  /  } ;
		PICTURE "@K" ;
		MESSAGE "Fecha Inicial "+en_tex
	@ 2,22 GET M.FECFIN ;
		SIZE 1,8 ;
		DEFAULT {  /  /  } ;
		PICTURE "@K" ;
		WHEN last()#27 .and. !empty(m.fecini) ;
		MESSAGE "Fecha Final "+en_tex
	@ 1,1 SAY "FECHA INICIAL" ;
		SIZE 1,13, 0
	@ 2,1 SAY "FECHA FINAL" ;
		SIZE 1,11, 0
	
	IF NOT WVISIBLE("_qy414sz3q")
		ACTIVATE WINDOW _qy414sz3q
	ENDIF
	
	READ
	
	RELEASE WINDOW _qy414sz3q
	
	#REGION 0
	IF m.talkstat = "ON"
		SET TALK ON
	ENDIF
	IF m.compstat = "ON"
		SET COMPATIBLE ON
	ENDIF
	
	
	*       *********************************************************
	*       *                                                         
	*       *              ENTRE_FE/MS-DOS Cleanup Code               
	*       *                                                         
	*       *********************************************************
	*
	
	#REGION 1
	EN_COSA=lastkey()#27
	EN_COSA=IIF(EN_COSA,!empty(fecini),EN_COSA)
	EN_COSA=IIF(EN_COSA,!empty(fecfin),EN_COSA)
	EN_COSA=IIF(EN_COSA,FECINI<=FECFIN,EN_COSA)
	RETURN EN_COSA
	

ENDCASE
