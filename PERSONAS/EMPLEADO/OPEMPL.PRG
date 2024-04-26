* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPEMPL.PRG              บ
* บ COMENTARIO    : ABRE BASE DE EMPLEADOS  บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+REPL("ฐ",78)                  && BOTOM
#DEFINE ABA   "Abriendo Base de "                && ABA

IF USED("PER")
	SELE PER
	SET ORDER TO TAG EMPLEADO
ELSE
	=MEN_LIN(ABA+'Empleados')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG EMPLEADO ALIAS PER
ENDIF
IF EMPLPOP
	=DEFPOPER(EMPLPOPR,EMPLPOPC)
ENDIF
RETURN MEN_LIN(BOTOM)
