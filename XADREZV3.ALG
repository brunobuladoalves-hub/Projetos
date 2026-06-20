algoritmo "Xadrez"

// Autor : Bruno Bulado Alves
// Data de início : 09/06/26
// Descrição : Algoritmo que simula uma partida de xadrez

var

   T : vetor [1..8,1..8] de caractere						   // Posicionamento da peça
   Tab, Tap, Tpb, Tpp, Ta : vetor [1..8,1..8] de logico	// Armazenamento de inforamções do tabuleiro

   I, J, K : inteiro										         // Variáveis de controle

   Pv, Ph : inteiro										         // Leitura da posição da peça que se deseja mover
   Dv, Dh : inteiro                                      // Leitura da posição para onde a peça vais e mover
   Nv, Nh : inteiro                                      // Posições para calculo
   NvA, NhA : inteiro                                    // Para o cavalo

   resposta : caractere									         // Resposta do usuário

   bo : logico                                           // indentifica um xeque_mate

   AUX : caractere                                       // Variável auxiliar

   Pea, Tor, Cav, Bis, Dam, Rei : caractere              // Alterna entre pretas e brancas

   br, pr : logico                                       // Alterna entre pretas e brancas

procedimento Pe

inicio


   // Validação do movimento do peão

   se (Pv = 2) entao

      para I de 1 ate 2 faca

         Nv <- Pv + I

         se (T[Nv, Ph] = " ") entao

            Ta[Nv, Ph] <- verdadeiro

         senao

            interrompa

         fimse

      fimpara

   senao

      NV <- Pv + 1

      se (T[Nv,Ph] = " ") e (Nv < 9) entao

         Ta[Nv, Ph] <- verdadeiro

      fimse

   fimse

   para I de 1 ate -1 passo -2 faca

      Nv <- Pv + 1
      Nh <- Ph + I

      Ta[Nv, Nh] <- Tpp[Nv, Nh]

   fimpara

   // Fim da validação do movimento do peão

fimprocedimento

procedimento To

inicio

   // Validação do movimento da torre

   para I de 1 ate -1 passo -2 faca

      para J de 1 ate 8 faca

         Nh <- Ph + J * I

         se (Nh > 0) e (Nh < 9) entao

            se (T[Pv, Nh] = " ") ou (Tpp[Pv,Nh]) entao

               Ta[Pv, Nh] <- verdadeiro

            senao

               interrompa

            fimse

            se (Tpp[Pv,Nh]) entao

               interrompa

            fimse

         fimse

      fimpara

   fimpara

   para I de 1 ate -1 passo -2 faca

      para J de 1 ate 8 faca

         Nv <- Pv + J * I

         se  (Nv > 0) e (Nv < 9) entao

            se (T[Nv, Ph] = " ") ou (Tpp[Nv,Ph]) entao

               Ta[Nv, Ph] <- verdadeiro

            senao

               interrompa

            fimse

            se (Tpp[Nv,Ph]) entao

               interrompa

            fimse

         fimse

      fimpara

   fimpara

   // Fim da validação do movimento da torre

fimprocedimento

procedimento Ca

inicio

   para I de 2 ate -2 passo -4 faca

      para J de 1 ate -1 passo -2 faca

         Nv <- Pv + I
         Nh <- Ph + J
         NvA <- Pv + J
         NhA <- Ph + I

         se (Nv > 0) e (Nv < 9) e (Nh > 0) e (Nh < 9) entao

            se (T[Nv, Nh] = " ") ou (Tpp[Nv, Nh]) entao

               Ta[Nv, Nh] <- verdadeiro

            fimse

         fimse

         se (NvA > 0) e (NvA < 9) e (NhA > 0) e (NhA < 9) entao

            se (T[NvA, NhA] = " ") ou (Tpp[NvA, NhA]) entao

               Ta[NvA, NhA] <- verdadeiro

            fimse

         fimse

      fimpara

   fimpara

   // Fim da validação do movimento do cavalo

fimprocedimento

procedimento Bi


inicio

   // Validação do movimento do bispo

   para I de 1 ate -1 passo -2 faca

      para J de 1 ate -1 passo -2 faca

         para K de 1 ate 8 faca

            Nv <- Pv + K * I
            Nh <- Ph + K * J

            se (Nv < 9) e (Nv > 0) e (Nh < 9) e (Nh > 0) entao

               se (T[Nv, Nh] = " ") ou (Tpp[Nv, Nh]) entao

                  Ta[Nv, Nh] <- verdadeiro

               senao

                  interrompa

               fimse

               se (Tpp[Nv, Nh]) entao

                  interrompa

               fimse

            fimse

         fimpara

      fimpara

   fimpara

   // Fim da validação do movimento do bispo

fimprocedimento

procedimento Re

inicio



   // Validação do movimento do rei

caso "R"

   // Movimento em cruz

   para I de 1 ate -1 passo -2 faca

      para J de 1 ate 8 faca

         Nh <- Ph + J * I

         se (Nh > 0) e (Nh < 9) entao

            se (T[Pv, Nh] = " ") ou (Tpp[Pv,Nh]) entao

               Ta[Pv, Nh] <- verdadeiro

            fimse

         fimse

      fimpara

   fimpara

   para I de 1 ate -1 passo -2 faca

      para J de 1 ate 1 faca

         Nv <- Pv + J * I

         se  (Nv > 0) e (Nv < 9) entao

            se (T[Nv, Ph] = " ") ou (Tpp[Nv,Ph]) entao

               Ta[Nv, Ph] <- verdadeiro

            fimse

         fimse

      fimpara

   fimpara


   // Fim do movimento em cruz

   // Movimento em X


   para I de 1 ate -1 passo -2 faca

      para J de 1 ate -1 passo -2 faca

         para K de 1 ate 1 faca

            Nv <- Pv + K * I
            Nh <- Ph + K * J

            se (Nv < 9) e (Nv > 0) e (Nh < 9) e (Nh > 0) entao

               se (T[Nv, Nh] = " ") ou (Tpp[Nv, Nh]) entao

                  Ta[Nv, Nh] <- verdadeiro

               fimse

            fimse

         fimpara

      fimpara

   fimpara

   // Fim do movimento em X

   // Fim da validação do movimento do rei

fimprocedimento

INICIO

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

      // Inicialização do Ta

      para I de 1 ate 8 faca

         para J de 1 ate 8 faca

            Ta[I,J] <- falso

         fimpara

      fimpara

      // Escrita do tabuleiro

      escreval("      A   B   C   D   E   F   G   H  ")

      escreval("|-----------------------------------|")

      para I de 1 ate 8 faca

         escreva("|",I, "-| ")

         para J de 1 ate 8 faca

            escreva(T[I,J], " | ")

         fimpara

         escreval("")
         escreval("|-----------------------------------|")

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

            Pea <- "P"
            Tor <- "T"
            Cav <- "C"
            Bis <- "B"
            Dam <- "D"
            Rei <- "R"

            br <- verdadeiro
            pr <- falso

         senao

            Pea <- "p"
            Tor <- "t"
            Cav <- "c"
            Bis <- "b"
            Dam <- "d"
            Rei <- "r"

            br <- falso
            pr <- verdadeiro

         fimse

         escolha T[Pv,Ph]

         caso Pea

            Pe

         caso Tor

            To

         caso Cav

            Ca

         caso Bis

            Bi

         caso Dam

            To
            Bi

         caso Rei

            Re

         fimescolha

         escreval("Digite a posição horizontal para onde vai mover:")
         leia(Dh)

         escreval("Digite a posição vertical para onde vai mover:")
         leia(Dv)

         se (Dh = Ph) e (Dv = Pv) entao

            escreval("Colocado de volta, nada foi feito. Digite ENTER para prosseguir")
            leia(resposta)

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

      ate (bo)

fimalgoritmo