#INCLUDE "totvs.ch"
#include "TbiConn.ch"

//atividade fun��es e diretivas
/*/{Protheus.doc} Numeracao
Manuten��o de dados em Numeracao.
@author    helder couto
@version   11.3.10.201812061821
@since     02/05/2022
/*/

User Function Numeracao()
    Local cCliente := "000001"
    Local cLoja  := "01"
    Local cProdut := "000001"

	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	dBselectArea("SZ1")


	RecLock("SZ1",.T.)
	Z1_FILIAL := xFilial()
	Z1_CLIENT := GetSx8Num("SA1","A1_COD")
	Z1_LOJA   := cLoja
	Z1_PRODUT := cProdut
	Z1_UM     := "PC"
	Z1_UMCLI  := "CX"
	Z1_TIPO   := "M"
	Z1_FATOR  := 1
	MsUnlock()

    ConfirmSX8()

    dbSelectArea("SA1")
    dbSetOrder(1)
    If dbSeek(xFilial()+cCliente+cLoja)
        MsgInfo("Nome: "+SA1->A1_NOME)
    else
        MsgInfo("CLIENTE NAO ENCONTRADO")
    EndIf        


    dbSelectArea("SB1")
    dbSetOrder(1)
    If dbSeek(xFilial()+cProdut)
        MsgInfo("Cliente: "+AllTrim(SA1->A1_NOME)+"- Produto: "+SB1->B1_DESC)
    else
        MsgInfo("PRODUTO NAO ENCONTRADO")
    EndIf        

	RESET ENVIRONMENT

Return
