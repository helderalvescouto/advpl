// #########################################################################################
// Projeto:
// Modulo :
// Fonte  : ABRESZ1.prw
// -----------+-------------------+---------------------------------------------------------
// Data       | Autor             | Descricao
// -----------+-------------------+---------------------------------------------------------
// 21/06/2019 | paulo.bindo       | Gerado com auxílio do Assistente de Código do TDS.
// -----------+-------------------+---------------------------------------------------------

//#include "protheus.ch"    Substituido por totvs.ch
//#include "vkey.ch"        Substituido por totvs.ch
//#include "Rwmake.ch"      >>>desnecessario<<<
#include "totvs.ch"
#include "JPEG.ch"
#include "msmgadd.ch"
#include "TbiConn.ch"
//------------------------------------------------------------------------------------------
/*/{Protheus.doc} ControlNum
Manutenção de dados em SB1-Descricao Generica do Produto.
@author    paulo.bindo
@version   11.3.10.201812061821
@since     21/06/2019
/*/

User Function ControlNum()
	Local xx := 0

	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	dbSelectArea("SA1")
	dbSetOrder(1)

	For xx := 1 To 10
		cNumero := GETSXENUM("SA1","A1_COD")

		If cNumero $ "000099"
			ROLLBACKSXE()
		Else
			RecLock("SA1", .T.)

			A1_FILIAL := xFilial()
			A1_COD := cNumero
			A1_LOJA := "01"
			A1_NOME := "Teste de Numeracao "+CValToChar(xx)
			A1_PESSOA := "F"
			A1_END := "Rua teste"
			A1_NREDUZ := "Teste"+CValToChar(xx)
			A1_BAIRRO := "Teste"
			A1_TIPO := "F"
			A1_EST := "SP"
			A1_COD_MUN := "00105"
			A1_MUN := "ADAMANTINA "
			A1_NATUREZ := "1.00001 "
			MsUnlock()

			ConfirmSx8()
		End
	Next

	RESET ENVIRONMENT
Return

