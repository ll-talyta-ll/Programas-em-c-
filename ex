.data
	c: . word 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 #definindo o vetor de tamanho = 15
.text 

	.main:
	la, $a0, c
	jal imprime
	
	imprime:
	 	li $v0, 4
	 	syscall
	 	
	 	
