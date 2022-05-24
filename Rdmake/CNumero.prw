#include "totvs.ch"

/*/{Protheus.doc} CRIASXE
Ponto de Entrada para correção sequencia numeração.
@author    Helder Alves Couto
@version   11.3.10.201812061821
@since     24/05/2022
/*/

User Function CRIASXE()

	Local cNum := NIL
	Local aArea := getarea()
	Local aArea2 := {}
	Local cAlias    := paramixb[1]
	Local cCpoSx8   := paramixb[2]
	Local cAliasSx8 := paramixb[3]
	Local nOrdSX8   := paramixb[4]
	Local cUsa := "SE1"

	// colocar os alias que irão permitir a execução do P.E.

	if cAlias $ cUsa .and.  !( Empty(cAlias) .and. empty(cCpoSx8) .and. empty(cAliasSx8) )

		qout(cAlias + "-" + cCpoSx8 + "-" + cAliasSx8 + "-" + str(nOrdSX8))

		dbselectarea(cAlias)

		aArea2 := getarea()

		dbsetorder(nOrdSX8)
		dbseek(xfilial()+"Z")
		dbskip(-1)

		cNum := &(cCpoSx8)
		cnum := soma1(cNum)

		// fazer o tratamento aqui para a numeracao

		MsgGet2( "Indique o numero correto para a tabela:" + calias, "Campo:"+cCposx8, @cNum, , , )

		restarea(aArea2)

		restarea(aArea)
	end

return cNum


