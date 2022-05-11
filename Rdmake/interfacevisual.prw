#include "Rwmake.ch"
#include "totvs.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} IVisual
Criação de tela para input de dados

@author    helder couto
@version   11.3.10.201812061821
@since     09/05/2022
/*/

User Function IVisual()
	Local cTitulo   := "Aula MSDIALOG"
	Local cTexto    := "CNPJ"
	Local cCGC      := Space(14)
	Local nOpca     := 0
	Private oDlg
/*/
	Linha: 27 - oDlg é o objeto tem que está dentro deste objeto, From tamanho inicial da linha e To tamanho final da linha
	Linha: 29 - exibe texto na tela
	Linha: 30 - campo onde insere dados, VALID! Vazio(), pode ter uma função
	Linha: 31 - define o botão, 1 é = ok, habilita o botão
	Linha: 32 - opção para sair
	Linha: 33 - caixa centralizada na tela
/*/
	DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 080,300 PIXEL
	@ 001,001 TO 040, 150 OF oDlg PIXEL
	@ 010,010 SAY cTexto SIZE 55, 07 OF oDlg PIXEL
	@ 010,050 MSGET cCGC SIZE 55, 11 OF oDlg PIXEL PICTURE "@R 99.999.999/9999-99" VALID ACGC(@cCGC)
	DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpca := 1,oDlg:End()) ENABLE OF oDlg
	DEFINE SBUTTON FROM 020, 120 TYPE 2 ACTION (nOpca := 2,oDlg:End()) ENABLE OF oDlg
	ACTIVATE MSDIALOG oDlg CENTERED

	If nOpca == 2
		RETURN
	ENDIF

	//MsgInfo(cText, cTitle)
	MsgInfo("O CNPJ digitado foi: "+cCGC)

Return

/*/{Protheus.doc} ACGC
	(long_description)
	@type  Function
	@author user
	@since 10/05/2022
	@version version
	@param param_name, param_type, param_descr
	@return return_var, return_type, return_description
	@example
	(examples)
	@see (links_or_references)
	/*/
Static Function ACGC(cCGC)
	
	if Vazio(cCGC)
		MsgAlert("Erro CGC", "Atenção")
		oDlg:Refresh() //atualizar a tela
	EndIf

Return
