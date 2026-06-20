algoritmo "Xadrez"

// Autor : Bruno Bulado Alves
// Data de início : 09/06/26
// Descrição : Algoritmo que faz um partida de xadrez

var

	T : vetor [1..8,1..8] de caractere			// Posicionamento da peça
	Tab, Tap, Tpb, Tpp, Ta : vetor [1..8,1..8] de logico	// Armazenamento de inforamções do tabuleiro

	I, J, K : inteiro				// Variáveis de controle

	Pv, Ph : inteiro				// Leitura da posição da peça que se deseja mover

	resposta : caractere				// Resposta do usiário

inicio

	// Inicialização do tabuleiro

	T[1,1] <- "To-b"
	T[1,2] <- "Ca-b"
	T[1,3] <- "Bi-b"
	T[1,4] <- "Re-b"
	T[1,5] <- "Ra-b"
	T[1,6] <- "Bi-b"
	T[1,7] <- "Ca-b"
	T[1,8] <- "To-b"

	T[8,1] <- "To-p"
	T[8,2] <- "Ca-p"
	T[8,3] <- "Bi-p"
	T[8,4] <- "Re-p"
	T[8,5] <- "Ra-p"
	T[8,6] <- "Bi-p"
	T[8,7] <- "Ca-p"
	T[8,8] <- "To-p"

	para I de 1 ate 8 faca

		T[2,I] <- "Pe-b"
		T[7,I] <- "Pe-p"

	fimpara

	para I de 1 ate 8 faca

		para J de 3 ate 6 faca

			T[J,I] <- "    "

		fimpara

	fimpara

	// Fim da inicialização do tabuleiro

	
	// Escrita do tabuleiro

	para I de 1 ate 8 faca

		para J de 1 ate 8 faca

			escreva(T[I,J])

		fimpara

		escreval("")

	fimpara

	// Fim da escrita do tabuleiro

	repita

		limpatela

		// Escrita do tabuleiro

		para I de 1 ate 8 faca

			escreva(I, "- ")

			para J de 1 ate 8 faca

				escreva(T[I,J])

			fimpara

			escreval("")

		fimpara

		// Fim da escrita do tabuleiro

		repita

			// ENTRADA

			escreval("==========================")

			escreval("Digite a posição horizontal da peça que se deseja mover :")
			leia(Ph)

			escreval("Digite a posição vertical da peça que se deseja mover:")
			leia(Pv)

			se (V[Pv,Ph] = "    ") entao

				escreval("Não há peças no local.")
				
				escreval("Digite qualquer coisa para escolher novamente.")
				leia(resposta)

			senao
				
				se (Tpb[Pv, Ph]) entao
				
					escolha T[Pv,Ph]

						// Validação do movimento do peão

						caso "Pe-b"

							se (Ph = 2) entao
							
								para I de 1 ate 2 faca

									se (T[Pv,Ph] = "   ") entao

										Ta[Pv + I, Ph] <- verdadeiro

									senao
		
										interrompa

									fimse

								fimpara

							fimse
		
							senao


								se (T[Pv + 1,Ph] = "    ") e (Pv + I < 9) entao

									Ta[Pv + 1, Ph] <- verdadeiro

								senao
		
									interrompa

								fimse


							fimse

						// Fim da validação do movimento do peão

						// Validação do movimento da torre

						caso "To-b"

							para I de 1 ate 8 faca

								se (V[Pv + I , Ph] = "    ") e (Pv + I < 9) entao

									Ta[Pv + I, Ph] <- verdadeiro

								senao

									interrompa

								fimse	

							fimpara

							para I de 1 ate 8 faca

								se (V[Pv - I , Ph] = "    ") e (Pv + I < 9) entao

									Ta[Pv - I, Ph] <- verdadeiro

								senao

									interrompa

								fimse	

							fimpara

							para I de 1 ate 8 faca

								se (V[Pv, Ph + I] = "    ") e (Pv + I < 9) entao

									Ta[Pv, Ph + I] <- verdadeiro

								senao

									interrompa

								fimse	

							fimpara

							para I de 1 ate 8 faca

								se (V[Pv, Ph - I] = "    ") e (Pv + I < 9) entao

									Ta[Pv, Ph - I] <- verdadeiro

								senao

									interrompa

								fimse	

							fimpara


						// Fim da validação do movimento da torre

						// Validação do movimento do cavalo	

						caso "Ca-b"

						

						// Fim da validação do movimento do cavalo

						// Validação do movimento do bispo

						caso "Bi-b

						// Fim da validação do movimento do bispo

						// Validação do movimento da rinha

						caso "Ra-b"

						// Fim da validação do movimento da rainha

						// Validação do movimento do rei

						caso "Re-b"

						// Fim da validação do movimento do rei	
					
				senao



				fimse

			fimse	

	ate (xeque_mate)	

fimalgoritmo

	

		

		

	