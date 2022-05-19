#Talyta Scaramuzzo - TIA: 32079915
.data
fim: .asciiz "\nFIM"
novalinha: .asciiz "\n"
espaco: .asciiz " "

vetorX: 
.align 2 #tipo word;
.space 24#espaco em bytes;

vetorY:
.align 2 #tipo word;
.space 24 #espaco em bytes;

vetorZ:
.align 2 #tipo word;
.space 24 #espaco em bytes;

.text

	li $t0, 0 #indice do vetor;
	li $t2, 24 #o limite de espaço máximo dentro dos vetores, x,y e z;


lacoX: #este é um laço para que possamos inserir valores no vetorX;
	beq $t0, $t2, loadreset # o $t0 será igual a $t2 e posteriormente será zerado;

	li $v0, 5 #realiza-se uma leitura de inteiros;
	syscall #um comando para realizar a instrução anterior;
	move $t1, $v0 #move-se o valor do registrador $t1 para $v0;

	sw $t1, vetorX($t0) #descolocamento:(armazenando)$t1 para $t0;
	addi $t0, $t0, 4 #word => 4Bytes/ elemento do vetorX;
	addi $t1, $t1, 1
	j lacoX#retorno para o lacoX

loadreset: #devemos resetar o vetorX, para que possamos criar e armazenar valores no vetorY;
	li $t0, 0 

lacoY: 
	beq $t0, $t2, comparacao1 # compara se $t0=$t2
	
	li $v0, 5 #leitura de inteiros
	syscall #comando para realizar a instrução anterior;
	move $t1, $v0 #move-se o valor de $v0 para $t1;

	sw $t1, vetorY($t0) #Armazena-se o valor de $t1 para o endereço $t0;
	addi $t0, $t0, 4 
	addi $t1, $t1, 1
	j lacoY # retorna para o loop lacoY;

comparacao1:
	li $t0, 0 #retira/reseta o valor do registrador $t0;
comparacao:
	beq $t0, $t2, printaX #printa caso $t0 = $t2;	 
	lw $t3, vetorX($t0) #carrega-se todo o conteúdo do índice para $t3;
	lw $t4, vetorY($t0) #carrega-se todo o conteúdo do índice para $t4;

	slt $t5,  $t3,  $t4 #descobre-se o menor valor;
	beqz $t5, menorY #if $t4<t3, vamos para menorY;

menorX:
	sw $t4, vetorZ($t0) #carrega-se o conteúdo do índice ´para $t4;
	addi $t0, $t0, 4
	j comparacao # Voltando para o compara
menorY:
	sw $t3, vetorZ($t0) #carrega-se o conteúdo do índice para $t3;
	addi $t0, $t0, 4
	j comparacao #Voltando para o comparacao
printaX: 
li $t0, 0

laco_printaX:
	beq $t0, $t2, printaY
	lw $t6, vetorX($t0)

	li $v0, 1
	la $a0, ($t6)
	syscall #print do vetorX

	li $v0, 4
	la $a0, espaco
	syscall

	addi $t0, $t0, 4 
	j laco_printaX

printaY:
	li $t0, 0
	li $v0, 4
	la $a0, novalinha
	syscall

laco_printaY:
	beq $t0, $t2, printaZ
	lw $t6, vetorY($t0)

	li $v0, 1
	la $a0, ($t6)
	syscall #print do vetorY

	li $v0, 4
	la $a0, espaco
	syscall

	addi $t0, $t0, 4
	j laco_printaY

printaZ:
	li $t0, 0
	li $v0, 4
	la $a0, novalinha
	syscall

lacoprintarZ:
	beq $t0, $t2, termino
	lw $t6, vetorZ($t0)

	li $v0, 1
	la $a0, ($t6)
	syscall #print do vetorZ

	li $v0, 4
	la $a0, espaco
	syscall

	addi $t0, $t0 , 4
	j lacoprintarZ

termino:
	li $v0, 4
	la $a0, fim
	syscall #fim da execução do programa 
