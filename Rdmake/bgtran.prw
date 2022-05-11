// #########################################################################################
// Projeto:
// Modulo :
// Fonte  : param.prw
// -----------+-------------------+---------------------------------------------------------
// Data       | Autor             | Descricao
// -----------+-------------------+---------------------------------------------------------
// 02/05/2022 | helder couto      | Gerado no VSCode.
// -----------+-------------------+---------------------------------------------------------

#include "totvs.ch"
#include "TbiConn.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} bgtran
Manutenção de dados em Parametros.
@author    helder couto
@version   11.3.10.201812061821
@since     02/05/2022
/*/

User Function bgtran()
	Local xx := 0

	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	dBselectArea("SA1")
	DbSetOrder(1)

	//consigo desarmar a transação e a rotina vai continuar depois
	//Cometado devido erro apresentado: "Esta função tem um uso restrito para compilar!"
	//BEGINTRAN()

		For xx := 1 To 10
			cNumero := "000010"

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

			if cNumero == "000010"
				DisarmTransaction()
			EndIf

		Next

	//cometado para não gerar erro devido o uso da função
	//ENDTRAN()
	MsUnlockAll() //caso esqueça alguma tabela travada, para destravar

	RESET ENVIRONMENT
Return

