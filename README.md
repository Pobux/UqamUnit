UQAM Unit
=========

Outil pour semi-automatiser la validation des résultats des programmes exécutables par le shell.

Le script permet l'entrée automatique de paramètre à votre programme et vous permet ensuite de consulter les résultats avec les résultats attendus.

Le programme ne valide pas si le résultat est bon c'est à vous de le constater via les informations offertes par le programme.

Fonctionnement
==============
1. Créez un dossier test au même endroit que votre fichier exécutable
2. Créez un fichier test dans le dossier test ("Ex.: Graphe_Validation_Erreur.txt")
3. Lancez ./UqamUnit [votre programme]

Format des fichiers tests
=========================
```
1 Le nom de mon test
2 param1 param2 paramN
3 Résultat attendu
4
5 Le nom de mon deuxième test
6 param1
7 Résultat attendu
8
9
...
```

![Uqam Unit](http://pages.clibre.uqam.ca/pobe/Selection_009.png)
