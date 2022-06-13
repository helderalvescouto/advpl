#include "totvs.ch"

/*/{Protheus.doc} FSX3Ord
/*/

User Function FSX3Ord()
	//Local uRet
	Local cRPCEmp    := "01"   // Empresa.
	Local cRPCFil    := "01"   // Filial.
	Local cTabela    := "SB1" // Tabela que será processada.
	Local aCampos    := {}
	Local cOrdem     := ""
	Local cConOut    := "FSX3Ord - "
	Local nX

// Variáveis para medir o tempo de processamento.
	Local cTempo     := ""
	Local dDate      := Date()
	Local nSeconds   := Seconds()

// Abre o ambiente.
	RPCSetType(3) // Não consome licença.
	WfPrepEnv(cRPCEmp, cRPCFil)

// Ordena os campos.
	ConOut(cConOut + "Ordenando campos da tabela " + cTabela + ".")
	aCampos := {}
	SX3->(dbSetOrder(1)) // X3_ARQUIVO, X3_ORDEM.
	SX3->(dbSeek(cTabela, .F.))
	Do While SX3->(!eof() .and. X3_ARQUIVO = cTabela)
		aAdd(aCampos, {SX3->(RecNo()), SX3->X3_CAMPO})
		SX3->(dbSkip())
	EndDo

// Grava as ordens dos campos.
	ConOut(cConOut + "Listando ordem.")
	For nX := 1 to len(aCampos)
		SX3->(dbGoTo(aCampos[nX, 1]))
		cOrdem := RetAsc(nX, 2, .T.)
		ConOut(cConOut + SX3->(SX3->X3_CAMPO + " - " + SX3->X3_ORDEM + " -> " + cOrdem) + " (" + cValToChar(nX) + ") -> " + If( SX3->X3_ORDEM = cOrdem, " OK", " Campo corrigido"))
		If SX3->X3_ORDEM <> cOrdem
			RecLock("SX3", .F.)
			SX3->X3_ORDEM := cOrdem
			SX3->(msUnLock())
		Endif
	Next nX

// Fecha ambiente.
	RpcClearEnv()

	nSeconds := (Seconds() - nSeconds) + ((Date() - dDate) * 86400) // Um dia tem 86.400 segundos.
	cTempo   := IncTime("00:00:00", 0, 0, nSeconds)
	ConOut(cConOut + "Fim - tempo total " + cTempo + ".")

Return
