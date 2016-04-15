#!/bin/bash
# Outil de test automatisé, simple et portable
# Conçu pour tester les sorties du programme selon différentes entrées
# Antoine LeBel - 2016
#
# 1. Créer un dossier test
# 2. Créer un fichier, tenter de lui donner un nom significatif (Ex.: "testCycleGraphe.txt")
#   a. Il peut y avoir plusieurs tests par fichier (il est cependant recommendé de faire un test par fichier)
#   b. Un test possède toujours le format suivant:
#
#           [contexte_descriptionDuTest_RésultatAttendu]
#           [param1, param2, paramN]
#           [Expected]
#
#           [leNom_deMon_Test]
#           ...
#
#   [Expected] est seulement une string. Il n'y a pas de validation automatique entre le résultat obtenu et le résultat attendu.
#
# 3. Lancer ./UqamUnit [programme] [args**]
#
# TODO: Exemple makefile

#TODO, est-ce que le monde appelle leur script différemment?
prefix="./"

#Prise des arguments
ARGS=()
for arg in $*; do
    ARGS+=("$arg")
done

#Validation
arg_size=${#ARGS[*]}
if [ $arg_size = 0 ]; then
   echo "Aucun argument spécifié en paramètre" 
   exit
fi

if [ $arg_size -gt 1 ]; then
   echo "Inutile de passer des paramètres au programme. Vos fichiers test s'en occupe." 
   exit
fi

#Utilisation du préfixe pour lancer le program (./program)
program="$prefix${ARGS[0]}"
if [ ! -f $program ]; then
    echo "Le programme spécifié en paramètre est introuvable."
    exit
fi

if [ ! -d "test" ]; then
    echo "Le dossier test est inaccessible. Avez-vous créé un dossier test?"
    exit
fi

#Lecture des fichiers tests du dossier test
FILES=test/*
for f in $FILES; do
    echo "==================================";
    echo $f
    echo "=================================="; echo ""
    no_test=1
    no_line=$(wc -l < $f)
    test_start=1
    test_end=3
    
    while [ $no_line -ge $test_end ] 
    do
        output=($(sed -n "$test_start","$test_end"p $f))
        
        echo "$no_test : ${output[0]}"; #Output le nom du test
        echo "--------------------------------------"; echo ""
        echo "Résultat :"
        $program ${output[1]}; echo "" #lance le programme
        echo "Résultat attendu : ${output[2]}" #Expose le résultat attendu

        test_start=$((test_start+4))
        test_end=$((test_end+4))
        ((no_test++))
        echo ""
    done
    echo ""
done
