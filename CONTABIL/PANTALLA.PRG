*
*                     MUESTRA LA PANTALLA DE MOVIMIENTOS
*
* PANTALLA.PRG
*
@3,1 say "Cuenta                                                     "
@4,1 say "Saldo              "
@6,5 say "1 - Movimiento Nro........         "
@7,5 say "2 - Asiento Nro...........         "
@8,5 say "3 - Cuenta Nro............              "
@9,5 say "4 - Fecha del Movimiento..              "
@10,5 say "5 - Detalle...............                                              "
@11,5 say "6 - Debe..................                    "
@12,5 say "7 - Haber.................                    "
@14,5 say "Item a Modificar, <RETURN> Correcto, <8> Cancela"
@16,20 say "1 - Continua el asiento"
@17,20 say "2 - Cierra el asiento"
@19,20 say "Su opcion"
@21,10 say "Debe                      Haber                          "
@6,31 say NROMOV PICT "#,###"
@7,31 say NROASI PICT "#,###"
@21,15 say TDEBE PICT PICU1
@21,42 say THABER PICT PICU1
return
