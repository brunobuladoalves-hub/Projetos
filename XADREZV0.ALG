algoritmo "Xadrez"

// Autor : Bruno Bulado Alves
// Data de início : 09/06/26
// Descrição : Algoritmo que faz um partida de xadrez

var

   T : vetor [1..8,1..8] de caractere						// Posicionamento da peça
   Tab, Tap, Tpb, Tpp, Ta : vetor [1..8,1..8] de logico	// Armazenamento de inforamções do tabuleiro

   I, J, K : inteiro										// Variáveis de controle

   Pv, Ph : inteiro										// Leitura da posição da peça que se deseja mover
   Dv, Dh : inteiro                             // Leitura da posição para onde a peça vais e mover

   resposta : caractere									// Resposta do usuário

   bo : logico                          // indentifica um xeque_mate

   AUX : caractere                              // Variável auxiliar

inicio

   // Inicialização do tabuleiro

   T[1,1] <- "T"
   T[1,2] <- "C"
   T[1,3] <- "B"
   T[1,4] <- "R"
   T[1,5] <- "D"
   T[1,6] <- "B"
   T[1,7] <- "C"
   T[1,8] <- "T"

   T[8,1] <- "t"
   T[8,2] <- "c"
   T[8,3] <- "b"
   T[8,4] <- "r"
   T[8,5] <- "d"
   T[8,6] <- "b"
   T[8,7] <- "c"
   T[8,8] <- "t"

   para I de 1 ate 8 faca

      T[2,I] <- "P"
      Tpb[2,I] <- verdadeiro
      Tpb[1,I] <- verdadeiro


      T[7,I] <- "p"
      Tpp[7,I] <- verdadeiro
      Tpp[8,I] <- verdadeiro

   fimpara

   para I de 1 ate 8 faca

      para J de 3 ate 6 faca

         T[J,I] <- " "

      fimpara

   fimpara

   // Fim da inicialização do tabuleiro

   repita

      limpatela

      // Escrita do tabuleiro

      escreval("|----------------------------------|")

      para I de 1 ate 8 faca

         escreva("|",I, "- ")

         para J de 1 ate 8 faca

            escreva(T[I,J], " | ")

         fimpara

         escreval("")
         escreval("|----------------------------------|")

      fimpara

      // Fim da escrita do tabuleiro

      // ENTRADA

      escreval("==========================")

      escreval("Digite a posição horizontal da peça que se deseja mover :")
      leia(Ph)

      escreval("Digite a posição vertical da peça que se deseja mover:")
      leia(Pv)

      se (T[Pv,Ph] = " ") entao

         escreval("Não há peças no local.")

         escreval("Digite qualquer coisa para escolher novamente.")
         leia(resposta)

      senao

         se (Tpb[Pv, Ph]) entao

            escolha T[Pv,Ph]

               // Validação do movimento do peão

            caso "P"

               se (Pv = 2) entao

                  para I de 1 ate 2 faca

                     se (T[Pv + I, Ph] = " ") entao

                        Ta[Pv + I, Ph] <- verdadeiro

                     senao

                        interrompa

                     fimse

                  fimpara

               senao

                  se (T[Pv + 1,Ph] = " ") e ((Pv + 1) < 9) entao

                     Ta[Pv + 1, Ph] <- verdadeiro

                  senao

                     interrompa

                  fimse

               fimse

               // Fim da validação do movimento do peão

               // Validação do movimento da torre

            caso "T"

               para I de 1 ate -1 passo -2 faca

                  para J de 1 ate 8 faca

                     se (Ph + J * I > 0) e (Ph + J * I < 9)  e (Pv + J * I > 0) e (Pv + J * I < 9) entao

                        se (T[Pv,Ph + J * I] = " ") entao

                           Ta[Pv, Ph + J * I] <- verdadeiro

                        senao

                           interrompa

                        fimse

                        se (T[Pv + J * I, Ph] = " ") entao

                           Ta[Pv + J * I, Ph] <- verdadeiro

                        fimse

                     fimse

                  fimpara

               fimpara


               // Fim da validação do movimento da torre

               // Validação do movimento do cavalo

            caso "C"

               para I de 2 ate -2 passo -4 faca

                  para J de 1 ate -1 passo -2 faca

                     se (Pv + I > 0) e (Pv + I < 9) e (Ph + J > 0) e (Ph + J < 9) entao

                        se (T[Pv + I, Ph + J] = " ") entao

                           Ta[Pv + I, Ph + J] <- verdadeiro

                        fimse

                     fimse

                     se (Pv + J > 0) e (Pv + J < 9) e (Ph + I > 0) e (Ph + I < 9) entao

                        se (T[Pv + J, Ph + I] = " ") entao

                           Ta[Pv + J, Ph + I] <- verdadeiro

                        fimse

                     fimse

                  fimpara

               fimpara

               // Fim da validação do movimento do cavalo

               // Validação do movimento do bispo

            caso "B"

               para I de 1 ate -1 passo -2 faca

                  para J de 1 ate -1 passo -2 faca

                     para K de 1 ate 8 faca

                        se (Pv + K * I < 9) e (Pv + K * I > 0) e (Ph + K * J < 9) e (Ph + K * J > 0) entao

                           se (T[Pv + K * I, Ph + K * J] = " ") entao

                              Ta[Pv + K * I, Ph + K * J] <- verdadeiro

                           senao

                              interrompa

                           fimse

                        fimse

                     fimpara

                  fimpara

               fimpara

               // Fim da validação do movimento do bispo

               // Validação do movimento da rinha

            caso "D"

               para I de 1 ate -1 passo -2 faca

                  para J de 1 ate -1 passo -2 faca

                     para K de 1 ate 8 faca

                        se (Pv + K * I < 9) e (Pv + K * I > 0) e (Ph + K * J < 9) e (Ph + K * J > 0) entao

                           se (T[Pv + K * I, Ph + K * J] = " ") entao

                              Ta[Pv + K * I, Ph + K * J] <- verdadeiro

                           senao

                              interrompa

                           fimse

                        fimse

                     fimpara

                  fimpara

               fimpara

               para I de 1 ate -1 passo -2 faca

                  para J de 1 ate 8 faca

                     se (Ph + J * I > 0) e (Ph + J * I < 9)  e (Pv + J * I > 0) e (Pv + J * I < 9) entao

                        se (T[Pv,Ph + J * I] = " ") entao

                           Ta[Pv, Ph + J * I] <- verdadeiro

                        senao

                           interrompa

                        fimse

                        se (T[Pv + J * I, Ph] = " ") entao

                           Ta[Pv + J * I, Ph] <- verdadeiro

                        fimse

                     fimse

                  fimpara

               fimpara

               // Fim da validação do movimento da rainha

               // Validação do movimento do rei

            caso "R"

               para I de 1 ate -1 passo -2 faca

                  para J de 1 ate -1 passo -2 faca

                     se (Pv + 1 * I < 9) e (Pv + 1 * I > 0) e (Ph + 1 * J < 9) e (Ph + 1 * J > 0) entao

                        se (T[Pv + 1 * I, Ph + 1 * J] = " ") entao

                           Ta[Pv + 1 * I, Ph + 1 * J] <- verdadeiro

                        fimse

                     fimse

                  fimpara

               fimpara

               para I de 1 ate -1 passo -2 faca

                  se (T[Pv,Ph + 1 * I] = " ") e (Ph + 1 * I > 0) e (Ph + 1 * I < 9) entao

                     Ta[Pv, Ph + 1 * I] <- verdadeiro

                  fimse

               fimpara

               para I de 1 ate -1 passo -2 faca

                  se (T[Pv + 1 * I,Ph] = " ") e (Pv + 1 * I > 0) e (Pv + 1 * I < 9) entao

                     Ta[Pv + 1 * I, Ph] <- verdadeiro

                  fimse

               fimpara

               // Fim da validação do movimento do rei

            fimescolha

            escreval("Digite a posição horizontal para onde vai mover:")
            leia(Dh)

            escreval("Digite a posição vertical para onde vai mover:")
            leia(Dv)

            se (Dh = Ph) e (Dv = Pv) entao

               ("Colocado de volta, nada foi feito.")

            senao

               se (Ta[Dv, Dh]) entao

                  Tpb[Dv, Dh] <- verdadeiro
                  Tpb[Pv, Ph] <- falso
                  Tpp[Dv, Dh] <- falso

                  T[Dv, Dh] <- T[Pv, Ph]
                  T[Pv, Ph] <- " "

               senao

                  escreval("Movimento inválido, digite ENTER para prosseguir")
                  leia(resposta)

               fimse

            fimse

         fimse

      fimse

   ate (bo)

fimalgoritmo