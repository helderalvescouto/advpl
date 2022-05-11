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
//#include "protheus.ch"    Substituido por totvs.ch
//#include "vkey.ch"        Substituido por totvs.ch
//#include "Rwmake.ch"      >>>desnecessario<<<
//#include "JPEG.ch"
//#include "msmgadd.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} param
Manutenção de dados em Parametros.
@author    helder couto
@version   11.3.10.201812061821
@since     02/05/2022
/*/

User Function param()
	//Local cTitle := "Parametros aula"
	Local cMVPar := "MV_ULMES"
	Local dParam := ""
	Local dt := ""

	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	GetMV(cMVPar)

	dParam := GetMV(cMVPar) - 180

	PutMV(cMVPar,dParam)

	dt := Dtos(GetMV(cMVPar))
	
    MsgAlert(dt)

	RESET ENVIRONMENT
Return

