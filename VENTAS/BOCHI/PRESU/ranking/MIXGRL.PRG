* 旼 Programa컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: MIXGRL.PRG                           �
* �       Author: G. REINER                            �
* � Date created: 12-19-92                             �
* � Time created: 10:11:47am                           �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L. �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
* GENERA UN QUERY
* MIX_TEXTO - EL TITULO DE LA VENTANA
* m�X_SING  - LA DENOMINACION DEL CONCEPTO EN SINGULAR
* MIX_PL    - LA DENOMINACION DEL CONCEPTO EN PLURAL
* mIX_MASC (L) - SI LA PALABRA ES MASCULINA
FUNCTION MIXGRL
	parameter MIX_texto,MIX_SING,MIX_PL,MIX_MASC
	MIX_texto=xxtochar(MIX_texto)
	IF MIX_MASC
	MIX_salida=algun(45,MIX_texto,;
	"\<Todos los "+MIX_PL+";"+;
    "\<Un "+;
    MIX_SING+";"+;
    "Todos \<Menos Un "+MIX_SING+";"+;
    "\<Algunos "+;
    mIX_PL+";"+;
    "\<Combinado")
	ELSE
	MIX_salida=algun(45,MIX_texto,;
	"\<Todas las "+MIX_PL+";"+;
    "\<Una "+MIX_SING+";"+;
    "Todas \<Menos Una "+;
    mIX_SING+";"+;
    "\<Algunas "+MIX_PL+";"+;
    "\<Combinado")
ENDIF
RETURN IIF(LAST()=27,NUL,MIX_SALIDA)
