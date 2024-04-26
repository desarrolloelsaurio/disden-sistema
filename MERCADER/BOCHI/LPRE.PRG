* ELFILTRO =1 -> TODOS L0S ARTICULOS
* ELFILTRO =2 -> POR RUBRO
* ELFILTRO =3 -> POR PROVEEDOR
* LALISTA = 1 -> MOSTRADOR
* LALISTA = 4 -> MAYORISTA
* LALISTA = 6 -> COMISIONES
* LALISTA = 7 -> COMISIONES DIFERENCIADAS

FUNCTION LPRE
PARAMETER ELFILTRO,LALISTA,PARAEXCEL
M.MULTI = 1
STORE .T. TO M.OK
=OPMIX()
M.PORLISMAY=GETNU1("PORLISMAY","FOXGRL")
M.PORLISMIN=GETNU1("PORLISMIN","FOXGRL")
M.FLETE=GETNU1("FLETE","FOXGRL")
VALDOLAR=getnu1("D", "FOXGRL",3)
=oprub()
=oppro()
=opmer()
m.multi=1
DO CASE
CASE ELFILTRO=1
	m.cuallist = 1
	do elilist.spr
   SET ORDER TO TAG RUBRO
*   tt1="Completo"
	fisc=".T."
	tt1=""
CASE ELFILTRO=2
	IF LALISTA=1 .OR. LALISTA=4
		m.cuallist = 1
		do elilist.spr
		store nul to respuesta
		if m.cuallist=2 .AND. LALISTA=4
		   M.MULTI = 1 / VALDOLAR
		endif
	   store nul to respuesta
	   if empty(elirub("a Listar",-1,1))
   		   STORE !NOSELEC("RUBRO") TO M.OK
   			return
		endif
	ELSE
	   store nul to respuesta
	   if empty(elirub("a Listar",-1,1))
	   		STORE !NOSELEC("RUBRO") TO M.OK
   			return
	   endif
	ENDIF
    elcod=left(mix.texto2,3)
    sele mer
    set order to tag rubro
    tt1=" Por Rubro: "+alltrim(mix.texto1)+" "
    FISC="rubro='"+elcod+"'"
CASE ELFILTRO=3
	IF LALISTA=1 .OR. LALISTA=4
		m.cuallist = 1
		if PARAEXCEL
			m.cuallist=2
		else
			do elilist.spr
		endif
		store nul to respuesta
		if m.cuallist=2 .AND. LALISTA=4
		   M.MULTI = 1 / VALDOLAR
		endif
	   store nul to respuesta
	   if empty(eliPRO("a Consultar",-1,1))
   		   STORE !NOSELEC("PROVEEDOR") TO M.OK
   			return
	   endif
	ELSE
	   store nul to respuesta
	   if empty(eliPRO("a Consultar",-1,1))
	   		STORE !NOSELEC("PROVEEDOR") TO M.OK
   			return
	   endif
	ENDIF
    ELCOD=PER.CODCLI
    tt1=" Por Proveedor: "+alltrim(per.cliente)+" "
    sele mer
    set order to tag rubro
    FISC="proveedor='"+elcod+"'"
ENDCASE
IF M.OK
   DO CASE
   CASE LALISTA=1
      TT="Lista de Precios Mostrador"
      **  saypre(-)
      repo form lPRE3 nocon to prin promp FOR &FISC
**      repo form lPRE3 nocon to file cualuqe FOR &FISC
   CASE LALISTA=4
   	  if elfiltro=1
   	  	if cuallist = 2
	 	   M.MULTI = 1 / VALDOLAR
   	  		TMP=GENTMP()
   	  		select * from mer where !empty(moneda) order by rubro, merca into table (tmp)
   	  		use 
   	  		sele mer
   	  		use (tmp) alias mer
     		TT="Lista de Precios Mayorista EN DOLARES"
	    	repo form lPRE6 nocon to prin promp 
		else
			if cuallist=3
		 	   M.MULTI = 1 
	   	  		TMP=GENTMP()
   		  		select * from mer where !empty(moneda) order by rubro, merca into table (tmp)
   	  			use 
   	  			sele mer
	   	  		use (tmp) alias mer
    	 		TT="Lista de Precios Mayorista EN PESOS"
	    		repo form lPRE6 nocon to prin promp 
			else
	   	  		TMP=GENTMP()
   			  	select * from mer where empty(moneda) order by rubro, merca into table (tmp)
   	  			use 
   	  			sele mer
	   	  		use (tmp) alias mer
		     	TT="Lista de Precios Mayorista "
	    		repo form lPRE6 nocon to prin promp 
	    	endif
     	endif
    	use in mer
      else
        if m.cuallist=2
   		   M.MULTI = 1 / VALDOLAR
	      	TT="Lista de Precios Mayorista EN DOLARES"
	      	FISC = FISC + " .AND. !EMPTY(MONEDA)"
     		if PARAEXCEL
     			select  ;
     				ARTICULO+"   " as ARTICULO, ;
     				MERCA as MERCADERIA, ;
   					round(DOLAR*(1+PMAYOR/100)*M.MULTI, 2) as PRECIO, ;
     				SAYPER(proveedor,"PROCOD") AS PROVEEDOR ;
					from mer orde by rubro, merca into cursor tmp where (&FISC)
				export to c:\compar~1\mayo_dls XLS
				use in tmp
   		    else
   		 	  	repo form lPRE6 nocon to prin promp FOR &FISC
   		 	ENDIF
    	else
	      	TT="Lista de Precios Mayorista"
    	  	repo form lPRE6 nocon to prin promp FOR &FISC
        endif
      endif
   CASE LALISTA=6 
      TT="Lista de Comisiones"
      repo form lcomi nocon to prin promp FOR &FISC
   CASE LALISTA=7
      TT="Lista de Comisiones"
      FISC = FISC+" AND (MER.COMIMIN#10 OR MER.COMIMAY#3)"
      repo form lcomi nocon to prin promp FOR &FISC
   ENDCASE
ENDIF
M.MULTI = 1
RETURN .T.
 
 
