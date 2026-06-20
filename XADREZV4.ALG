algoritmo "Xadrez"

// Autor : Bruno Bulado Alves
// Data de início : 09/06/26
// Descrição : Algoritmo que simula uma partida de xadrez

var

   T : vetor [1..8,1..8] de caractere						   // Posicionamento da peça
   Tab, Tap, Tpb, Tpp, Ta : vetor [1..8,1..8] de logico	// Armazenamento de inforamções do tabuleiro

   I, J, K, L, M : inteiro										         // Variáveis de controle

   Pv, Ph : inteiro										         // Leitura da posição da peça que se deseja mover
   Dv, Dh : inteiro                                      // Leitura da posição para onde a peça vais e mover
   Nv, Nh : inteiro                                      // Posições para calculo
   NvA, NhA : inteiro                                    // Para o cavalo

   resposta : caractere									         // Resposta do usuário
   Pp : caractere
   bo : logico                                           // indentifica um xeque_mate

   AUX : caractere                                       // Variável auxiliar
   br, pr, xr : logico                                   // Mudam o objetivo das verificações


procedimento Pe

inicio


   // Validação do movimento do peão

   se (Pv = 2) entao

      para I de 1 ate 2 faca

         Nv <- Pv + I
         Nh <- Ph

         se (T[Nv, Nh] = " ") entao

            se (xr) entao

               se (

               senao

                  Ta[Nv, Nh] <- verdadeiro

               fimse

            fimse

         senao

            interrompa

         fimse

      fimpara

   senao

      Nv <- Pv + 1
      Nh <- Pv

      se (T[Nv,Nh] = " ") e (Nv < 9) entao

         Ta[Nv, Nh] <- verdadeiro

      fimse

   fimse

   para I de 1 ate -1 passo -2 faca

      Nv <- Pv + 1
      Nh <- Ph + I

      se (Nh > 0) e (Nh < 9) entao

         Ta[Nv, Nh] <- ((Tpp[Nv, Nh]) e (br)) ou ((Tpb[Nv,Nh] e pr)

      fimse

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

      para J de 1 ate 1 faca

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

      // Fim da inicialização do Ta

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

      escreval("     A   B   C   D   E   F   G   H  ")

      // Fim da escrita do tabuleiro

      // ENTRADA

      escreval("==========================")

      escreval("Digite a posição da peça (ex:H1) :")
      leia(Pp)

      Pv <- caracpnum(copia(Pp,2,1))

      escolha copia(Pp,1,1)

      caso "A"
         Ph <- 1
      caso "B"
         Ph <- 2
      caso "C"
         Ph <- 3
      caso "D"
         Ph <- 4
      caso "E"
         Ph <- 5
      caso "F"
         Ph <- 6
      caso "G"
         Ph <- 7
      caso "H"
         Ph <- 8

      fimescolha

      // Fim da entrada

      // Processamento de casas válidas

      se (T[Pv,Ph] = " ") entao

         escreval("Não há peças no local.")

         escreval("Digite qualquer coisa para escolher novamente.")
         leia(resposta)

      senao

         se (Tpb[Pv, Ph]) entao

            br <- verdadeiro
            pr <- falso
            xr <- falso

            escolha T[Pv,Ph]

            caso "P"

               Pe

            caso "T"

               To

            caso "C"

               Ca

            caso "B"

               Bi

            caso "D"

               To
               Bi

            caso "R"

               Re

            fimescolha

            // Fim do processamento de casas válidas

            // Entrada da posição final

            escreval("Digite a posição para onde vai se mover (ex:H1) :")
            leia(Pp)
            Dv<-caracpnum(copia(Pp,2,1))

            escolha copia(Pp,1,1)

            caso "A"
               Dh <- 1
            caso "B"
               Dh <- 2
            caso "C"
               Dh <- 3
            caso "D"
               Dh <- 4
            caso "E"
               Dh <- 5
            caso "F"
               Dh <- 6
            caso "G"
               Dh <- 7
            caso "H"
               Dh <- 8

            fimescolha

            // Fim da entrada da posição final

            // Validação de xeque e xeque-mate

            se (pr) entao

               para L de 1 ate 8 faca

                  para M de 1 ate 8 faca

                     se (Tpp) entao

                        br <- verdadeiro
                        pr <- falso
                        xr <- verdadeiro

                        escolha T[Pv,Ph]

                        caso "P"

                           Pe

                        caso "T"

                           To

                        caso "C"

                           Ca

                        caso "B"

                           Bi

                        caso "D"

                           To
                           Bi

                        caso "R"

                           Re

                        fimescolha

                     fimse

                  fimpara

               fimpara

               // Fim da validação de xeque e xeque-mate

               // Movimentação da peça

               se (Dh = Ph) e (Dv = Pv) entao

                  escreval("Colocado de volta, nada foi feito. digite ENTER para prosseguir")
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

               // Fim da movimentação da peça

            fimse

         fimse

      ate (bo)

fimalgoritmo