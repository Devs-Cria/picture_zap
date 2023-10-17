#include ahk_modules\gdip.ahk
FileEncoding, UTF-8
Loop, Read, contatos.txt
{
    SetTitleMatchMode, 2 ; Define o modo de correspondência de título para encontrar janelas que contenham o texto

    linha := Trim(A_LoopReadLine) ; Lê a próxima linha do arquivo e remove espaços em branco no início e no final

    Sleep, 4000
    DllCall("SetCursorPos", "int", 344, "int", 200) ; Clica na barra de pesquisa
    MouseClick, left
    Sleep, 1000

    Send, %linha% ; Envia o conteúdo da linha
    Sleep, 3000

    DllCall("SetCursorPos", "int", 397, "int", 328) ; Clica no contato já pesquisado
    MouseClick, left
    Sleep, 3000

    DllCall("SetCursorPos", "int", 192, "int", 200) ; Clica na barra de pesquisa
    MouseClick, left
    Sleep, 3000

    DllCall("SetCursorPos", "int", 717, "int", 155) ; Clica no nome do contato
    MouseClick, left
    Sleep, 3000

    DllCall("SetCursorPos", "int", 1512, "int", 322) ; Clica no nome do contato
    MouseClick, left
    Sleep, 3000


    pToken := Gdip_Startup()
    
    ; Obter o nome do arquivo baseado na linha atual do arquivo contatos.txt
    nomeArquivo := A_ScriptDir . "\" . linha . ".png"

    ; Salvar a captura de tela com o nome do arquivo baseado na linha atual
    snap := Gdip_BitmapFromScreen("640|280|640|640")
    Gdip_SaveBitmapToFile(snap, nomeArquivo)
    Gdip_DisposeImage(snap) ; Liberar a imagem da memória após salvar

    Sleep, 2000
    DllCall("SetCursorPos", "int", 192, "int", 200) ; Clica na barra de pesquisa
    MouseClick, left
    Sleep, 5000
}
