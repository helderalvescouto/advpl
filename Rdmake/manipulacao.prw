#INCLUDE "totvs.ch"
#include "TbiConn.ch"
//#include "TbiCode.ch"

//atividade funções e diretivas

/*/{Protheus.doc} Manipulacao
Manutenção de dados em SZ1-Descrição Generica do Produto

@autor      Helder Alves Couto
@version    11.3.10.201812061821
@since      10/04/2022
/*/

User Function Manipulacao()
	Local cCliente := "000001"
	Local cLoja  := "01"
	Local cProdut := "000001"

	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	dBselectArea("SZ1")

	RecLock("SZ1",.T.)
	Z1_FILIAL := xFilial()
	Z1_CLIENT := cCliente
	Z1_LOJA   := cLoja
	Z1_PRODUT := cProdut
	Z1_UM     := "PC"
	Z1_UMCLI  := "CX"
	Z1_TIPO   := "M"
	Z1_FATOR  := 1
	MsUnlock()

	dbSelectArea("SA1")
	dbSetOrder(1)
	If dbSeek(xFilial()+cCliente+cLoja)
		MsgInfo("Nome: "+SA1->A1_NOME)
	else
		MsgInfo("CLIENTE NAO ENCONTRADO")
	EndIf

	dbSelectArea("SZ1")
	dbSetOrder(1)
	If dbSeek(xFilial()+cProdut)
		MsgInfo("Cliente: "+AllTrim(SA1->A1_NOME)+"- Produto: "+SZ1->B1_DESC)
	else
		MsgInfo("PRODUTO NAO ENCONTRADO")
	EndIf

	RESET ENVIRONMENT
Return
