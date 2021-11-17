Version de base -O1:

-dotprod_1:
on a  dotprod.s
 (ICI vous rentrez dans le fichier assembleur directement lui ecrire le premier add.. )contenant 
         addsd	%xmm0, %xmm1
         movsd	(%rdi,%rax,8), %xmm0
Donc les instructions SIMD x86 sont utilisées de facon scalaire ,comme données sont de type double donc on  "scalar double precision" 
 
-dotprod_2:
Meme cas comme le precedent ,les instructions SIMD x86 sont utilisées de facon scalaire,donc scalar double precision (doubles)


Version de base -O2:
malgrés il ya une petite optimisation (dans le fichier assembleur ) mais il ya pas de vecotrisation donc on a les memes resultats precedents .


Version optimisee -O3:


-dotprod_1:
Donc:les instructions SIMD x86 sont utilisées de facon vectorielle et on a "packed double precision" (des variables doubles) 

-dotprod_2:
les instructions SIMD x86 sont utilisées de facon vectorielle
packed double precision car on manipule des doubles 

en utilisant -O3 on a une vectorisation.


Version fortement optimisee -Ofast:

vectorisation et optimisation meilleurs que -O3 
les resultats obtenus en -O3 restent inchangés .


Version kamikaze:
vectorisation assurée,optimisé pour notre chipset ce qui donne les meilleurs resultats que les 4 versions precedentes

donc optimisation et vectorisation kamikaze>-Ofast>-O3>-O2>-O1












	
  

