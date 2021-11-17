---------AP TD_simd LOUGANI FAOUZI--------

---------------------
Version de base -O1:
---------------------

-dotprod_1:
 Une analyse du fichier assembleur nous donne
 la branche d'instructions de la fonction dotprod_1: 
 .L3 
         addsd	%xmm0, %xmm1
         movsd	(%rdi,%rax,8), %xmm0
	 mulsd	(%rsi,%rax,8), %xmm0
=>On deduit que les instructions SIMD x86 sont utilisées de facon scalaire ,on est dans le cas"scalar double precision"car les données sont des doubles 

-dotprod_11 et -dotprod_22:: 
De la meme maniere on deduit que:
=>les instructions SIMD x86 sont utilisées de facon scalaire ,on est dans le cas"scalar simple precision" car on manipule des flottants

-dotprod_2 etdotprod_3:
=>les instructions SIMD x86 sont utilisées de facon scalaire ,on est dans le cas"scalar double precision"car les données sont des doubles 

-dotprod_4:
=>les instructions SIMD x86 sont utilisées de facon vectorielle,packed simple precision
la fonction dotprod_4 est ecrite en instructions SEE (SIMD x86) donc elle est par defaut vectorisée. 
-----------------------
Version legerement optimisee -O2:
-----------------------
Une analyse des fichiers assembleur nous conduit a voir qu'il ya une petite optimisation mais il ya pas de vecotrisation donc on a les memes resultats que dans Version de base -O1

----------------------
Version optimisee -O3:
----------------------
-dotprod_1:
On voit aprés analyse qu'il ya une vectorisation 
.L4:
	movupd	(%rdi,%rax), %xmm1
	movupd	(%rsi,%rax), %xmm2
	addq	$16, %rax
	mulpd	%xmm2, %xmm1
	addpd	%xmm1, %xmm0
=>les instructions SIMD x86 sont utilisées de facon vectorielle
=>packed double precision car on manipule des doubles 

-dotprod_11 et dotprod_22:
les instructions SIMD x86 sont utilisées de facon vectorielle, on est dans le cas du "packed simple precision". 

-dotprod_2 et dotprod_3:
les instructions SIMD x86 sont utilisées de facon vectorielle,on est dans le cas "packed double precision"

-dotprod_4:
malgrés qu'elle est par defaut vectorisée mais d'aprés 
.p2align 4,,10
	.p2align 3
=>aligement de données on deduit qu'il ya une vectorisation en plus . 


Remarque:J'ai ajouté (-fopt-info-vec-optimized) a mon makefile 
pour avoir la ligne ou se trouve la boulce vectorisée afin de s'assurer des resultats du fichier dotprod.s
Donc :optimisiation -O3 =>vectorisation des boucles 

------------------------------------
Version fortement optimisee -Ofast:
------------------------------------
On a une vectorisation maximale ,plus de celle de (Version optimisee -O3)
Les resultats sont les memes de -O3 pour la Version fortement optimisee -Ofast pour les instructions SIMD x86

------------------------------------
Version kamikaze:
------------------------------------
une analyse est la suivante:
-funroll-loops:Cette option agrandit le code et peut ou non le rendre plus rapide
-mtune=native: ajustera le code optimisé pour qu'il s'exécute le mieux pour le chipset actuel.
-march=native: oblige le compilateur à generer un code machine correspendant au processeur sur lequel il s'execute lors de l'optimisation du code 
-ftree-vectorize:vectorisation par defaut 

Donc :Les resultats seront plus meilleurs,adequats,que les 4 versions precedentes(-O1,-O2,-O3,-Ofast)
il ya toujours la vectorisation .


Resulats:
-En general augmenter l'optimisation => meilleur vectorisation 
-La vectorisation s’active avec −ftree−vectorize OU par défaut avec −O3 
-Vectoriseur automatique(sse ou avx) permettent d'améliorer les performances du code.









	
  

