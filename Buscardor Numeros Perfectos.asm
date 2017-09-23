	.text
	.globl  main
	
main:
	
	 ori      $1,$0,1        #  C
	 ori      $2,$0,0        #  S
	 ori      $3,$0,0        #  Comparacion beq
	 ori	  $26,$0,200	 #	Limite de verificacion
	 ori	  $28,$0,0		 #  Valor a cargar en memoria
	 lui      $27,0x1000     #  punto de carga
	 lw       $15,0($27)     #  N cargar valor a comparar
	 sll      $0,$0,0
	 sll      $0,$0,0

vuelta:
	 beq	  $15, $26, finalnovamas
	 sll      $0,$0,0
	 slt	  $7, $1, $15
	 bne	  $3, $7, verdad
	 sll      $0,$0,0
	 beq	  $2, $15, perfecto
	 sll      $0,$0,0
	 j noperfecto
	   
	 
verdad:
	 div	  $15, $1
	 mfhi	  $8
	 beq	  $0, $8, contarcs
	 sll      $0,$0,0
	 addiu	  $1, $1, 1
	 j vuelta
	 sll      $0,$0,0
	 
	 contarcs:
		addu		$2, $2, $1
		addiu		$1, $1, 1
		j vuelta
		sll      $0,$0,0
		
perfecto:
	 addiu	$27, $27, 4
	 sw		$15, 0($27)
	 sll      $0,$0,0
	 addiu	$15, $15, 2
	 ori      $1,$0,1        #  C
	 ori      $2,$0,0        #  S
	 j vuelta
	 sll    $0,$0,0

noperfecto:
	 sll      $0,$0,0
	 sll      $0,$0,0
	 addiu	$15, $15, 2
	 ori      $1,$0,1        #  C
	 ori      $2,$0,0        #  S
	 j vuelta
	 sll      $0,$0,0

	 
finalnovamas:
	 sll      $0,$0,0
	 sll      $0,$0,0
	 
	 
.data
N:				.word 2
isperfect:		.word 0