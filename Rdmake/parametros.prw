// #########################################################################################
// Projeto:
// Modulo :
// Fonte  : parametros.prw
// -----------+-------------------+---------------------------------------------------------
// Data       | Autor             | Descricao
// -----------+-------------------+---------------------------------------------------------
// 02/05/2022 | helder couto      | Gerado no VSCode.
// -----------+-------------------+---------------------------------------------------------

//#include "protheus.ch"    Substituido por totvs.ch
//#include "vkey.ch"        Substituido por totvs.ch
//#include "Rwmake.ch"      >>>desnecessario<<<
#include "totvs.ch"
#include "JPEG.ch"
#include "msmgadd.ch"
#include "TbiConn.ch"
//------------------------------------------------------------------------------------------
/*/{Protheus.doc} parametros
Manutenção de dados em parametros.
@author    helder couto
@version   11.3.10.201812061821
@since     02/05/2022
/*/

User Function parametros()
	//Local cText := "Protheus Aberto"
	Local cTitle := "Parametros aula"
	Local cMVPar := "MV_ULMES"

	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"


	//Pegar dados de parametros
	GetMV(cMVPar)

	//Caso não exista retorna o valor(cMVPar) ele retorna "TESTE", e qual filial ele check
	GetNewPar(cMVPar,"TESTE",xFilial("SC5"))
	
	//GetNewPar(cMVPar,"02/05/2022",xFilial("SC5"))
	
	//Vai ler o paramentro, exibir o help ou não (.T. ou .F.), volta o valor padrão ("TESTE"), e qual a filial que vai checkar
	SuperGetMV(cMVPar,.T.,"TESTE",xFilial("SC5"))
	
	//SuperGetMV(cMVPar,.T.,"03/05/2022",xFilial("SC5"))

	//Gravar novos dados no parametro, passar o parametro e o novo valor
	PutMV(cMVPar, "B")
	//PutMV(cMVPar, +90)
	
	MsgInfo(cMVPar, cTitle)

	RESET ENVIRONMENT
Return

