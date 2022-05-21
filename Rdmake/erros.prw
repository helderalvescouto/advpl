#include "totvs.ch"

//Aula leitura de erro
/*/{Protheus.doc} VerErros
/*/

User Function VerErros()
	Local nNumero := 22
	Local aArray := {{0,0}}
    
    MsgStop("Ver erro", +CValToChar(nNumero))

    aArray[] := 2

Return
