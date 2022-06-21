#Include "totvs.ch"

User Function PNM80GRV()
	Local aArea	  	:= GetArea()
	Local cEveProv	:= Paramixb[1]//Evento de Provento do Banco de Horas
	Local cEveDesc	:= Paramixb[2]//Evento de Desconto do Banco de Horas
	Local aSPI		:= Paramixb[3]//Array com os Valores do Banco de Horas
	Local aDelSPI	:= Paramixb[4]//Array com os Registros a serem Baixados
	Local dDataGrv	:= Paramixb[5]//Data Para a Gravacao dos Valores nos Resultados
	Local cEveResc	:= Paramixb[6]//Evento de Base para total de meses do B.Horas
	Local lAddNew	:= .F.
	Local nLenX		:= 0
	Local nX		:= 0
	Local nY		:= 0

	Alert("Passou pelo PE PNM80GRV")

	aEveProv := {"999","998","997"}
	aEveDesc := {"996","995","994"}

	//Na tabela SPB (Resultados), devera ser gravado o evento da folha que for
	//definido para o Banco de Horas.
	//Deverao ser criados eventos especificos de acordo com a faixa de Hora Extra (70%, 80%, etc),
	//caso os eventos de hora extras tenham que ser desmembrados.
	//Antes da gravacao do campo PB_HORAS, o conteudo do array aSPI devera ser alterado para
	//decimal, pode-se utilizar a seguinte funcao:

	fConvHr( aSPI[ nX , 2 ] , "D" )

	nLenX := Len( aSPI )

	For nX := 1 To nLenX
		For nY := 1 To Len( aEveProv )
			lAddNew := !SPB->( dbSeek( cFilMat + IF( aSPI[ nX , 4 ] $ "1*3" , aEveProv[ nY ] , aEveDesc[ nY ] ) + aSPI[ nX , 3 ] ) )

			If aSPI[ nX , 1 ] == cEveResc
				lAddNew := !SPB->( dbSeek( cFilMat + cEveResc + aSPI[ nX , 3 ] ) )
			Endif

			IF RecLock( "SPB" , lAddNew )
				IF SPB->PB_TIPO2 == "I"
					SPB->PB_HORAS := ( SPB->PB_HORAS + fConvHr( aSPI[ nX , 2 ] , "D" ) )
				Else
					SPB->PB_FILIAL := SRA->RA_FILIAL
					SPB->PB_CC     := aSPI[ nX , 3 ]
					SPB->PB_MAT    := SRA->RA_MAT
					SPB->PB_PD     := IF ( aSPI[nX,1] # cEveResc, IF( aSPI[ nX , 4 ] $ "1*3" , aEveProv[ nY ] , aEveDesc[ nY ] ), cEveResc)
					SPB->PB_HORAS  := IF ( aSPI[nX,1] # cEveResc, fConvHr( aSPI[ nX , 2 ] , "D" ), 0)
					//aSPI[ nX , 2 ])

					SPB->PB_DATA   := dDataGrv
					SPB->PB_TIPO1  := IF ( aSPI[nX,1] # cEveResc, "H" , "V")
					SPB->PB_TIPO2  := "G"
					SPB->PB_VALOR  := IF ( aSPI[nX,1] # cEveResc, 0, aSPI[ nX , 2 ])
				EndIF			SPB->( MsUnlock() )
			EndIF
		Next nY
	Next nX

	//O Conteudo do aDelSPI devera ser baixado ou deletado, de acordo com a opcao escolhida nos
	//parametros da rotina (Lançamentos B.H. ?). No caso de baixa, o campo PI_DTBAIX deve receber o
	//conteudo do parametro da rotina (Data de Pagto. Folha ?) e o campo PI_STATUS deve receber "B".

	nLenX := Len( aDelSPI )

	For nX := 1 To nLenX
		SPI->( dbGoto( aDelSPI[ nX ] ) )
		IF RecLock("SPI")
			IF nLimpa == 1
				// Limpa
				IF !SPI->( FkDelete( @cMsgErr ) )
					SPI->( RollBackDelTran( cMsgErr ) )
				EndIF
			Else
				// Baixa
				SPI->PI_DTBAIX := dDtPagto
				SPI->PI_STATUS := "B"
			EndIF
			SPI->( MsUnlock() )
		EndIF
	Next nXRestArea( aArea )
Return ( .F. )
