UQAM Unit
=========

Outil pour semi-automatisé la validation des résultats des programmes exécutables par le shell.

Simplement, le script permet d'envoyer des entrées automatiquement à votre programme et vous permet ensuite de consulter les résultats avec les résultats attendus.

Le programme ne valide pas si le résultat est bon c'est à vous de le constater.

Fonctionnement
==============
1. Créez un dossier test au même endroit que votre fichier exécutable
2. Créer un fichier test dans le dossier test ("Ex.: Graphe_Validation_Erreur.txt")
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