#include "TOTVS.ch"

/*/{Protheus.doc} teste1
Manutenção de dados em SZ1-Descrição Generica do Produto

@autor      Helder Alves Couto
@version    11.3.10.201812061821
@since      09/04/2022
/*/

User function teste1()
	Local cData1 := DTOS(Date())
	Local dData2 := STOD("19830518")
	Local nNumero := 20
	Local dData4 := Date()
	Local nNum
	Local lPagaIpva := .F.
	Local xx := 0

	Local aRotina := {,;
		{"Pesquisar","AxPesqui",0,1},;
		{"Visualizar","AxVisual",0,2},;
		{"Alterar","AxAltera",0,3},;
		{"Incluir","AxIncluir",0,4},;
		{"Excluir","AxDeleta",0,5}}

	Private dData := CTOD("10/01/2021")
	Private aVeiculos := {}
	Private aVeic2 := {}

	MsgAlert(aRotina)

	//1 - NOME, 2 - MARCA, 3 - COMBUSTIVEL, 4 - SOM, 5 - ANO, 6 - PRECO, 7 - PLACA PRETA
	AADD(aVeiculos,{"GOL","VW","FLEX",.T.,2014,41000,})
	AADD(aVeiculos,{"FUSCA","VW","GASOLINA",.F.,1962,30000,})
	AADD(aVeiculos,{"FOX","VW","FLEX",.T.,2015,48000,})

	ASIZE(aVeiculos,7)//Aumenta o tamanho do Array
	ADEL(aVeiculos,7)//Deleta o campo especifico do Array
	MsgAlert("Nome: "+aVeiculos[1,1])
	aVeiculos[1,1] := "FUSCA 1300"

	For xx:=1 To Len(aVeiculos)
		aVeiculos[xx,7]:= .F.
	Next

	aVeic2 := ACLONE(aVeiculos)

	//Coloca Landau como vendido
	nPos := Ascan(aVeic2,{|x| x[1] == "FOX"})
	aVeic2[nPos,7] := .T.

	//Apagar o item vendido
	For xx:=1 To Len(aVeic2)
		If aVeic2[xx,7]
			ADEL(aVeic2,xx)
			ASIZE(aVeic2, Len(aVeic2)--)
		Endif
	Next

	//Ordenar o Array
	aVeic2 := aSort(aTemp,,,{|x,y| x[1] < y[1]})

	MsgAlert("Valor: "+cData1)
	MsgAlert(dData2)
	MsgAlert("Valor: "+cValToChar(nNumero))
	MsgAlert(dData4)

	nResult := 1 + 1 // Soma
	nResult := 1 - 1 // Subtração
	nResult := 1 * 1 // Multiplicaçãao
	nResult := 1 / 1 // Divisão
	nResult := 2 ** 2 // Exponenciação
	nResult := 2 ^ 2 // Exponenciação
	nResult := 3 % 2 // Resto da divisao

	cBranco := "Teste"+Space(10) //Adiciona 10 espaços posteriormente
	cBranco2 := cBranco - "  Teste2" 

	If "Teste3" $ cBranco
		Alert("OK")
	Else
		Alert("Não encontrou")
	Endif


	cData := Dtoc(dData)
	Alert(cData)

	sData := Dtos(dData)
	Alert(sData)

	dData2 := Stod(sData)
	Alert(dData2)

	cNumero := CValToChar(nNumber)
	cNumero2 := Str(nNumero) //Permite que tenha parametros

	cNumero3 := Str(nNumero,5,2) //5 casas e 2 casas decimais

	cNumero4 := StrZero(nNumero,10) //Preenche com zeros a esquerda

	cNumero5 := Val(cNumero3) //Conversão de valores para inteiro

	cNum := Alltrim("     Helder      ") //Remove os espaços
	cNum2 := AllTrim(cNum)

	cAsc := ASC("A")//Tabela asc
	cChr := CHR(cAsc)//Converte de asc para letra

	cTexto := At("L","HELDER")//Pega a primeira posição da letra pesquisada

	cTexto := RAT("L","HELDERL") //Pega a ultima posição da letra pesquisada

	nNumCar := Len("HELDER")

	nNumCar := LOWER("HELDER")
	nNumCar := UPPER("helder")
	nNumCar := CAPITAL("HELDER")

	cNomeCli := "Helder Alves Couto"


	if "HELDER" $ UPPER(cNomeCli)
		MsgAlert("Contém!")
	else
		MsgAlert("Não contém!")
	endif

	STUFF("PPQQQPP",3,3,"RRR")//troca os caracteries começando na 3 posição e alterar 3 casas

	cNomeCli := SubStr("Helder Alves Couto",1,6)

	PadR("Helder Alves Couto",20,"*")//Rigth
	PadC("Helder Alves Couto",50,"*")//Center
	PadL("Helder Alves Couto",20,"*")//Left

	Replicate("*",100)

	StrTran("Helder Alves Couto","e","a")//alterar todas as letras "e" para "a"

	// Função Abs retorna o valor absoluto
	nTotal := ABS(100-1000)

	nNumero := Int(10.389)

	nNumero := NoRound(10.389,2)

	nNumero := Round(10.389,2)

	nNumero := Round(10.3894,2)

	if VALTYPE(nNumero) == "N"
	endif

	if TYPE(nNumero) == "D"
	endif

	For nNum := 1 to 10
		FWLogMsg(CValToChar(nNum))//escreve no log do server
		if nNum == 5
			Loop //Não executa mais nada, para
		elseif nNum == 9
			Exit //sai do loop
		Endif

		FWLogMsg("Passou "+CValToChar(nNum)+" Vezes.")
	Next

	For nNum := 1 to 10 STEP 2 //executa de 2 em 2
		FWLogMsg(CValToChar(nNum))//escreve no log do server
		if nNum == 5
			Loop //Não executa mais nada, para
		elseif nNum == 9
			Exit //sai do loop
		Endif

		FWLogMsg("Passou "+CValToChar(nNum)+" Vezes.")
	Next

	For nNum := 1 to 10 STEP 2 //executa de 2 em 2
		FWLogMsg(CValToChar(nNum))//escreve no log do server
		if nNum == 5
			Loop //Não executa mais nada, para
		elseif nNum == 9
			Exit //sai do loop
		else
			nNum --
		Endif

		FWLogMsg("Passou "+CValToChar(nNum)+" Vezes.")
	Next

	nNum := 0
	While nNum <= 10
		if nNum == 5
			Loop //Não executa mais nada, para
		elseif nNum == 9
			Exit //sai do loop
		Endif
		nNum ++
	end

	While !Eof()
		if cMeuCarro == "NOVO"
			lPagaIpva := .T.
		endif

		if lPagaIpva
			U_GeraTitulo()
		endif

		dbSkip()
	End

	Do CASE
	CASE cMeuCarro == "NOVO"
		lPagaIPVA := .T.
	CASE cMeuCarro == "VELHO"
		lPagaIPVA := .F.
	OTHERWISE
		lPagaIPVA := .F.
	End CASE

	cdata5 := Ctod("24/03/2022")
	cdata6 := Stod("2020/05/20")
	alert(cdata5)
	alert(cdata6)

	//Bloco de codigo
	bNewPage := {|| Cabec(cData1,dData2nNumero), nLin:=9}

	if !Empty(nNumero);
			.and. nNumero > 2
		MsgAlert("Valor cData1: "+cData1+" Valor dData2: "+DTOS(dData2)+" Valor nNumero: "+cValToChar(nNumero))
		MsgAlert(dData4)
		MsgAlert(bNewPage)
	else
		MsgAlert(dData4)
		MsgAlert(bNewPage)
	endif

return
