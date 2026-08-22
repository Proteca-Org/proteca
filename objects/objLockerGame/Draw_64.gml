drawMinigameScreenDim(0.6, guiWidth, guiHeight)
drawMinigameFrame(x, y)

if (estado == "play") {
    drawMinigameText(text1, fntMinigameBig, x, y - 60, 40, 300)
    if (!abertoAgora && drawMinigameSpriteButton(sprButtonPlay, x, y + 80)) {
	    estado = "senha";
	    senhaDigitada = "";
	}

} else if (estado == "senha") {
    drawMinigameText(text2, fntMinigameMedium, x, y - 100, 30, 310)
    drawMinigameText(senhaDigitada, fntMinigameBig, x, y, 50, 200)
	
    var senhaCompleta = string_length(senhaDigitada) == maxDigitos;
    if (drawMinigameButton("CONTINUAR", fntMinigameBig, x, y + 110, 200, 60, senhaCompleta)) {
        if (senhaDigitada == senhaCorreta) {
            estado = "sucesso";
        } else {
            senhaDigitada = "";
        }
    }

} else if (estado == "sucesso") {
    drawMinigameText(text3, fntMinigameBig, x, y - 30, 40, 260)
	drawMinigameText(text4, fntMinigameMedium, x, y + 30, 30, 260)
}