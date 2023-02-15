# Participantes: Jo�o Victor Nogueira de Souza e Jos� L�zaro Marques De Lima Filho
.data 
	entrada: .word 0 #guarda o valor lido pelo teclado
	fatorial: .word 1 #guarda o resultado do fatorial
	msg1: .asciiz "Insira um n�mero inteiro: "
	msg2: .asciiz "O fatorial de "
	msg3: .asciiz " � igual a "
	msg4: .asciiz " O n�mero n�o pode ser negativo"
.text
.globl main

main:
	#imprime a mensagem pedindo o n�mero
	la $a0, msg1	
	li $v0, 4
	syscall
	
	#ler o n�mero e armazena em v0
	la $v0, 5
	syscall
	
	#verifica se o n�mero n�o � menor que zero
	blt $v0, $zero, erro
	
	#copia o valor de v0 para t0
	move $t0, $v0
	#copia o valor lido de v0 para a v�riavel entrada
	sw $t0,  entrada
	
	#atribui o valor 1 para o registrador t1
	#registrador t1 guardar� o valor do fatorial durante o loop
	li $t1, 1
	loop:
		beq $t0, $zero, end #verifica se $t0 � igual a zero, se sim, encerra o loop
		mul $t1, $t1, $t0       
		addi $t0, $t0, -1	       
		j loop		       #volta para o in�cio do loop 
		
	erro:
		#imprime a mensagem de erro
		la $a0, msg4
		li $v0, 4
		syscall
		
		#encerra o programa
		li $v0, 10
		syscall
end:		
	#copia o valor de t1 para a vari�vel fatorial
	sw $t1, fatorial
	
	#imprime a primeira parte da sa�da
	la $a0, msg2
	li $v0, 4
	syscall
	
	#imprime o n�mero lido
	lw $a0, entrada
	li $v0, 1
	syscall
	
	#imprime a segunda parte da sa�da
	la $a0, msg3
	li $v0, 4
	syscall
	
	#imprime o fatorial do n�mero lido
	lw $a0, fatorial
	li $v0, 1
	syscall
	
	#encerra o programa
	li $v0, 10
	syscall
