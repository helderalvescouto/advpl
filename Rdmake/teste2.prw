#include "totvs.ch"
#include "msmgadd.ch"
#include "TbiConn.ch" //usar uma função PREPARE.... simula abrir as tabelas e variaveis
//#include "TbiCode.ch"

/*/{Protheus.doc} teste2
Manutenção de dados em SZ1-Descrição Generica do Produto

@autor      Helder Alves Couto
@version    11.3.10.201812061821
@since      09/04/2022
/*/

User Function teste2()
	// Local nItem := 100
    Local cTab := "12" //tabela de estados
    Local nCnt := 0
    RpcSetType(3)
    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	// bBloco := {|X| Y:=5, Z:= X*Y}
	// nValor := Eval(bBloco,nItem)

	DbSelectArea("SX5")//abrir tabela na base de dados ou no Dicionário de Dados SX3->Dados
	DbSetOrder(1)//Qual o indice que eu quero
	dbGotop()//Vai para o começo de todos os arquivos
	
    //
    While !Eof() .and. X5_FILIAL == xFilial("SX5") .and. X5_TABELA <= cTab
		nCnt++
		dbSkip()
	EndDo

    DbSelectArea("SX5")//abrir tabela na base de dados ou no Dicionário de Dados SX3->Dados
	dbGotop()//Vai para o começo de todos os arquivos

    //Faz mesmo processo do while, dBVal usa para tabelas
    dbEval({|X| nCnt++},,{||X5_FILIAL==xFilial("SX5") .and. X5_TABELA <= cTab})

    RESET ENVIRONMENT//Reseta o environment
Return
