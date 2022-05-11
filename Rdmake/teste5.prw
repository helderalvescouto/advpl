#include "totvs.ch"
#include "msmgadd.ch"
#include "TbiConn.ch" //usar uma função PREPARE.... simula abrir as talebas e variaveis

/*/{Protheus.doc} teste5
Manutenção de dados em SZ1-Descrição Generica do Produto

@autor      Helder Alves Couto
@version    11.3.10.201812061821
@since      10/04/2022
/*/

User Function teste5()
	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	dbSelectArea("SZ1")//seleciona a tabela
	dbSetOrder(1)//indice que vai buscar, remover se for usar nickname

	if !SoftLock("SZ1")//Trava todos os registro da tabela, para não ter alterações por outras chamadas no sistema
		MsgAlert("Achou")
	endif

	RESET ENVIRONMENT//Reseta o environment
Return
