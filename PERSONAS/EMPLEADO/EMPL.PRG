* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : EMPL.PRG              บ
* บ COMENTARIO    : GESTION DE EMPLEADOS  บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 11-06-93                 บ
* บ HORA       : 03:05:36am               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
PROCEDURE EMPL
PARAMETER Q_HACER
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
EXTERNAL PROCEDURE ELIPLE
EXTERNAL PROCEDURE LPER1
GA1_DIJO=IIF(EMPTY(Q_HACER),ALLTRIM(PROMPT()),Q_HACER)
RELE INQ_TIPO
DO CASE
CASE GA1_DIJO="Legajo"
	INQ_TIPO="J"
CASE GA1_DIJO="Datos Generales" .OR. ;
GA1_DIJO="Empleados" .OR. ;
GA1_DIJO="Datos Administrativos"
	INQ_TIPO=.F.
CASE GA1_DIJO="Ingreso de Horas"
	INQ_TIPO="IHOR"   
CASE GA1_DIJO="Listado de Horas"
	INQ_TIPO="LHOR"   
ENDCASE
IF TYPE("INQ_TIPO")#"U"
	=OPCIU()
	=OPPLE()
	ULPR=PROGRAM()
	=CABPAN1()
	SELE PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[11],CONTENIDO[9]
	TEXTO[1]="Empleado"
	TEXTO[2]="Empleado"
	TEXTO[3]="Empleados"
	*[4] VA DESPUES
	TEXTO[5]="Fecha de Nacimiento"
	TEXTO[6]="Detalle"
	TEXTO[7]="Legajo"
	TEXTO[10]="Apellido y Nombre"
	TEXTO[11]="Secciขn"
	TIPO_PER="EMPLEADO"

	CONTENIDO[1]="@!"
	CONTENIDO[2]=9
	CONTENIDO[3]="EMPLCOD"
	CONTENIDO[4]="EMPLEADO"
	CONTENIDO[5]="E"
	CONTENIDO[6]=.T.
	CONTENIDO[7]=.T.
	CONTENIDO[8]=.F.
	CONTENIDO[9]="EMPLDNI"
    TEXTEX='SECTEX'
    TEXCOD='SECCOD'    
	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
	DO CASE
	CASE EMPTY(INQ_TIPO)
		DO PERSDT.SPR WITH .T.
	CASE INQ_TIPO="IHOR"
		DO HOR.SPR WITH .F.,.F.,"PER"," Ingreso de Horas Trabajadas ",.t.
	CASE INQ_TIPO="LHOR"
        M.MESANIO=MESANIO("Mes a Listar",.t.,.t.)
        IF !EMPTY(M.MESANIO)
           DO IPER_DO.SPR WITH .F.,.F.,"PER"," Listado de Horas Trabajadas ",.f.,12
        ELSE
           =NOSELEC("FECHA")
        ENDIF
        =RELEWIN("WIN")                   
	OTHERWISE
      DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Empleado ",.T.
	ENDCASE
	ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)
