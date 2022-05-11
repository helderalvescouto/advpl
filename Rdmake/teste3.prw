#include "totvs.ch"
#include "msmgadd.ch"
#include "TbiConn.ch" //usar uma função PREPARE.... simula abrir as talebas e variaveis
//#include "TbiCode.ch"

/*/{Protheus.doc} teste3
Manutenção de dados em SZ1-Descrição Generica do Produto

@autor      Helder Alves Couto
@version    11.3.10.201812061821
@since      09/04/2022
/*/
User Function teste3()
    Local nValor := 10
    Local nQtd := 5

	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	filha(nValor,nQtd)

	RESET ENVIRONMENT//Reseta o environment
Return

//So funciona nesse mesmo Rdmake
/*/{Protheus.doc} FILHA
Manutenção de dados em SZ1-Descrição Generica do Produto

@autor      Helder Alves
@version    11.3.10.201812061821
@since      09/04/2022
/*/
Static Function filha(nValor,nQtd)
	Local nx := 0
	Local aCampos := {}
	Local aTitulos := {}
    Local nTotal
    DEFAULT nQtd := 0 //usa quando o valor não esta declarado ou seja não veio na função como parametro

    //# diferente != diferente, só entra se não tivesse a variavel declarada em DEFAULT, verificaria se era numerico por isso N
    if ValType(nQtd) # "N"
        nQtd := 0
    EndIf

    nTotal = nValor * nQtd

	AADD(aCampos,"C5_FILIAL")
	AADD(aCampos,"C5_NUM")

	SX3->(dbSetOrder(2))//ordem de campo o dois (2)
	For nx:=1 To Len(aCampos)
		SX3->(dbSeek(aCampos[nx]))
		aAdd(aTitulos,AllTrim(SX3->X3_TITULO))
	Next nx

	aTitulos:= {}
	SX3->(dbGoTop())
	aEval(aCampos,{|X| SX3->(dbSeek(x)),AAdd(aTitulos,AllTrim(SX3->X3_TITULO))})

Return
