#include "totvs.ch"
#include "msmgadd.ch"
#include "TbiConn.ch" //usar uma função PREPARE.... simula abrir as talebas e variaveis

/*/{Protheus.doc} teste6
Manutenção de dados em SZ1-Descrição Generica do Produto

@autor      Helder Alves Couto
@version    11.3.10.201812061821
@since      10/04/2022
/*/

User Function teste6()

//Se for maior que zero a tabela esta sendo usada pelo Protheus
	if Select("SX6") > 0
		MsgAlert("Protheus Aberto")
	else
		RpcSetType(3)
		PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"
	endif

	dbSelectArea("SX6")//seleciona a tabela
	dbSetOrder(1)//indice que vai buscar, removo se for usar nickname

	RESET ENVIRONMENT//Reseta o environment
Return
