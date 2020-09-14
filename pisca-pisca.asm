;Pisca-pisca com liga desliga no uC8051
;09/09/2020-TDM2

;Definiçao de variaveis 
LED       bit   p1.7
LED1      bit   p1.5
SOn   bit   p1.0
;******************************************************
              org 00h
ini:
           setb p1.7
           setb p1.5
           jnb Son,$
           jb  Son,$ ;aguardar o acionamento para ligar 

           jnb Son,$   ;aguadar retorno da chave
           clr led1    ;LED1 começa ligado          
volta:    
           call tempo  ;chama rotina de gast
           cpl led     ;aciona a saida liga/desliga
           cpl led1    ;troca de estado da saida LED1
           call tempo;chamada rotina de tempo novamente 
           jmp  volta  ; continua piscando 
;*****************************************************
tempo:
           mov r0, #04
tt0:
           mov r1,#04
           jnb Son,ini 
           djnz r1,$
           djnz r0,tt0
           ret
;*************************************************
           end
                                
                   
          