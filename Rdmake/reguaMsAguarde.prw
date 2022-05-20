#include "Protheus.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} PBMsA
/*/
USER FUNCTION PBMsA()
	PRIVATE lEnd := .F.
	MsAguarde({|lEnd| RunProc(@lEnd)},"Aguarde...","Processando SX5",.T.)
RETURN

//****************************
/*/{Protheus.doc} RunProc
/*/
STATIC FUNCTION RunProc(lEnd)
	dbSelectArea("SX5")
	dbSetOrder(1)
	dbGoTop()
	While !Eof()
		If lEnd
			MsgInfo(cCancel,"Fim")
			Exit
		Endif
        ProcessMessage() 
		MsProcTxt("Tabela: "+SX5->X5_TABELA+" Chave: "+SX5->X5_CHAVE)
		dbSkip()
	End
RETURN
