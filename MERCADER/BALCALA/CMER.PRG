****************************************************************************
*-- Programa: CMER.PRG
*-- Fecha   : 06/13/91
*-- Version : G. REINER
*-- Notas   : INGRESA MERCADERIA
********************************************************************************
ff=recno()
registro=str(ff)
PRIVATE TEMP
STORE .T. TO SIGUE
STORE .F. TO CAMBIO
ulpr=hora_ulp(program())
if cheqseg()
   =movewin(cmerr,cmerc,cmerr+cmerla,cmerc+cmeran,'win'," Correcci¢n Mercader¡a-"+alltrim(janname),alltrim(janname))
   STOR " Correcci¢n Mercader¡a - " TO me1
   STOR 27 TO COL
   rele temp
   dime temp[5]
   =GEN_TEM(@TEMP)
   =lock(registro,'MER') .or. lok("Mer")
   sele mer
   SCAT MEMV
   =mmer(.t.)
   store nul to respuesta
   =XSEEK(M.RUBRO,'RUB','CODRUB')
   M.NADA=RUB.RUBRO
   @ 1,col get nada mess me1+TECMOD
   READ
   if last()#27
      IF UPDATE()
         IF !EMPTY(elirub(" del Producto",1,COL))
            m.rubro=rub.codrub
            nada=rub.rubro
            @ 1,col get nada
            clea gets
            STORE .T. TO CAMBIO
         ELSE
            STORE .F. TO SIGUE
         ENDIF
      ENDIF
      @ 2,COL GET m.articulo;
        valid !yaestaba(m.articulo,'mer','articulo',.f.,.t.,.t.);
        error 'El Art¡culo '+alltrim(m.articulo)+' Existe';
        mess me1+' Art¡culo'
      @ 3,col get m.merca PICT '@!';
        VALID !YAESTABA(M.MERCA,'MER','MERCA',.T.,.T.,.T.);
        ERROR 'DENOMINACION EXISTE';
        mess me1+' Denominaci¢n del Producto'
      read WHEN SIGUE .AND. LAST()#27
      CAMBIO=IIF(UPDATE(),.T.,CAMBIO)
      =xseek(m.marca,'mix','marcod')
      m.nada=mix.texto1
      @ 4,col get m.nada pict '@!' mess me1+tecmod
      read
      if update()
         if elimar("",4,col)
            m.marca=left(mix.texto2,2)
            m.nada=mix.texto1
            @ 4,col get m.nada
            clea gets
            store .t. to cambio
         endif
      endif
      =xseek(m.proveedor,'PRO','PROCOD')
      m.nada=pro.proveedor
      @ 5,COL GET M.NADA PICT '@!' MESS ME1+tecmod
      read
      if update()
         if elipro("",5,col)
            m.proveedor=pro.procod
            m.nada=pro.proveedor
            @ 5,col get m.nada
            clea gets
            store .t. to cambio
         endif
      endif
      M.NADA=QTEM(M.TEMPORADA)
      @ 6,COL GET M.NADA MESS ME1+TECMOD
      READ WHEN LAST()#27 .AND. SIGUE
      IF UPDATE()
         m.temporada=TEMP[pop_lisT(6,COL,@temp,'Temporada de '+alltrim(m.merca))]
         @ 6,COL GET M.TEMPORADA
         CLEA GETS
         STORE .T. TO CAMBIO
         SIGUE=IIF(LAST()=27,.F.,SIGUE)
      ENDIF
      m.discrim=xxtochar(m.discrim)
      @ 7,col get m.UNIdXBUL pict '9999';
        default 1;
        mess me1+' Cantidad de Unidades por Bulto/Caja/Bolsa';
        range 1,1000
      @ 8,COL GET M.DISCRIM PICT '@M NO,SI'
      READ when last()#27 .AND. SIGUE
      CAMBIO=IIF(UPDATE(),.T.,CAMBIO)
      if lastkey()#27 .AND. CAMBIO .AND. SIGUE
         IF confirma(" los Datos Modificados",.T.,16,nul)
            =MEN_LIN(grabando)
            sele mer
            go ff
            m.discrim=(m.discrim='SI')
            gath memv
            =repuse()
            unlo all
            =IAUD(zero(m.rubro,3)+M.ARTICULO+'-'+M.MERCA)
         endif
      endif
   endif
   =relewin('win')
ELSE
   =iaudI()
ENDIF
=men_lin(botom)
RETURN
