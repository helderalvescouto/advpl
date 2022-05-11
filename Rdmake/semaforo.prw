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
/*/{Protheus.doc} semaforo
Manutenção de dados em SB1-Descricao Generica do Produto.
@author    paulo.bindo
@version   11.3.10.201812061821
@since     21/06/2019
/*/

User Function semaforo()
	
	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	dbSelectArea("SA1")
	dbSetOrder(1)

    //Semaforo
    // Nome do que crie + Controle por empresa +se por filial (Falso e true cria um registro de trava para o TESTE criado), travar para que usuários não abra uma empresa
    If LockByName("TESTE",.F.,.T.)
        MsgAlert("Já Usado", "LockByName")
    EndIf

    // Nome do que crie + Controle por empresa +se por filial
    UnLockByName("TESTE",.T.,.T.)

	RESET ENVIRONMENT
Return

