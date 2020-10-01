# TP 2 - Bash

## Question 1 : Manipulation de fichiers

1. Afficher de la liste de tous les fichiers en fonction de la date (plus vieux au plus récent)
```
ls -tr
```

2. Afficher la liste de tous les fichiers de façon à ce qu'elle soit lisible par l'homme
```
ls -lh
```

3. Afficher la liste des fichiers du répertoire courant et mettre le résultat dans un fichier res1.txt
```
ls > res1.txt
```

4. Compter le nombre de ligne dans res1.txt
```
wc -l res1.txt
```

## Question 2 : Affichage sélectif

1. Afficher la ou les lignes contenant le mot `loopback` dans `/etc/networks`
```
grep loopback /etc/networks
```

2. Afficher le contenu de `/usr/lib/sysctl.d/50-default.conf`
```
cat /usr/lib/sysctl.d/50-default.conf
```

3. Modifier le fichier `/usr/lib/sysctl.d/50-default.conf`
```
su - root
nano /usr/lib/sysctl.d/50-default.conf
exit
```

## Question 3 : Droits par défaut

1. Les droits d'un fichier
Commandes
```
touch test.txt
ls -l test.txt
```
Résultat
```
-rw-r--r-- 1 tchadelicard tchadelicard 0 oct.   1 14:36 test.txt
```
La commande umask 022 retire le droit d'écriture pour le group `tchadelicard` et le retire également pour tout le monde. En octal 2 correspond à l'écriture et 0 correpond à ne rien faire. Donc par défaut les fichiers de l'utilisateur sont crées avec 

2. Les droits d'un répertoire
Commandes
```
mkdir test
ls -dl test
```
Résultat
```
drwxr-xr-x  2 tchadelicard tchadelicard  4096 oct.   1 14:40 test
```
Le d indique que c'est un répertoire, rwx indique que l'utilisateur peut lire écrire et lire à travers ce dossier. Le grouep du dossier ici `tchadelicard` peut lire et passer à travers le dossier et tout le monde peut juste passer à travers le dossier. Ceci correponds à ce que nous avons fait en faisant un `umask 022`, c'est à dire retirer l'écriture sur le groupe et tout le monde.

3. Modifier les droits par défaut (rw pour l'utilisateur, r pour le groupe, aucun droit pour le groupe)
Commandes
```
umask 026
touch test.txt
ls -l test.txt
```
Résultat
```
-rw-r----- 1 tchadelicard tchadelicard 0 oct.   1 14:54 test.txt
```
Nous pouvons bien voir le fait que notre utilisateur a les droits de lectueur et d'écriture, le groupe le droit de lecture, et tout le monde aucun droits.

4. Modifier les droits par défaut (aucun droits pour tout le monde)
Commandes
```
umask 666
touch test.txt
ls -l test.txt
```
Résultat
```
---------- 1 tchadelicard tchadelicard 0 oct.   1 14:54 test.txt
```
Nous pouvons bien voir le fait qu'il y a aucune permission pour qui que ce soit

5. Est-il possible de le supprimer ?

Oui, il est possible de le supprimer

## Question 4 : Droits et fichiers

1. Editer les droits d'un fichier en root (r pour l'utilisateur, r pour le groupe, rien pour les autres)
Commandes
```
touch test.txt
chmod 440 test.txt
ls -l test.txt
```
Résultat
```
-r--r----- 1 root root 0 oct.   1 15:11 test.txt
```

2. Écrire dans le fichier `/root/test.txt`

Il est impossible de lire lire ou d'écriture dans le fichier `test.txt`

3. Authorisé l'utilisateur `tchadelicard` à lire et écrire le fichier test.txt

Commandes
```
chmod 446 test.txt
ls -l test.txt
```
Résultat
```
-r--r--rw- 1 root root 0 oct.   1 15:11 test.txt
```
Toujours impossible de lire le fichier `/root/test.txt` mais ceci est normal le fichier est dans le répertoire `/root` et le laisser passer n'est pas actif sur le répertoire. Si le fichier est placé ailleurs, cela fonctionne. 

## Question 5 : Recherche dans un fichier

1. `grep monsieur file.txt`

Résultat
```
1- monsieur dupont
2- monsieur durant
```

On obtient les résultats 1 et 2 car grep est sensible à la casse, c'est à dire qu'il prends en compte si c'est une majuscule ou une minuscule.

2. `grep monsieur file.txt | wc -l`

Résultat
```
2
```
On obtient bien deux lignes comme en haut, le résultat est cohérent avec la question 1.

3. `grep -i monsieur file.txt | wc`

Résultat
```
3 9 57
```

Il nous affiche qu'il y a 3 lignes ce qui est normal vu qu'on fait une recherche qui n'est pas sensible à la casse avec le terme `monsieur` donc il affiche toutes les lignes avec `monsieur` mais même celles écrites avec des majuscules. Il nous dit qu'il y a 9 mots car chaque lignes contient 3 mots donc 3 * 3 = 9, le chiffre au début de la ligne compte comme un mot. Pour finir 57 est la quantité de bytes et chaque caractère correspond à un byte donc nous avons 57 caractères

4. `grep -i monsieur file.txt | wc > resultats.txt`

La commande redirige le résultat le résultat de la commande dans le fichier `resultats.txt` la sortie standard est envoyé dans le fichier texte.

## Question 6 : Carnet téléphonique

1. Afficher le carnet d'adresse tiré par ordre alphabétique

Commande
```
sort -d telephone.txt
```

Résultat
```
Boulanger       Lili    936-074
Boulanger       Nadia   936-645
Boulez  Pierre  456-765
Cochereau       Pierre  738-876
Duruflé Pierre  267-736
```

2. Afficher le nombre de personnes dans le répertoire

Commande
```
wc -l telephone.txt
```

Résultat
```
5 telephone.txt
```

3. Afficher toutes les lignes concernant les `Boulanger`

Commande
```
grep Boulanger telephone.txt
```

Résultat
```
Boulanger       Nadia   936-645
Boulanger       Lili    936-074
```

4. Afficher toutes les lignes ne concernant pas les `Boulanger`

Commande
```
grep -v Boulanger telephone.txt
```

Résultat
```
Boulez  Pierre  456-765
Duruflé Pierre  267-736
Cochereau       Pierre  738-876
```

5. Afficher uniquement le numéro des `Boulanger`

Commande
```
grep Boulanger telephone.txt | cut -f 3
```

Résultat
```
936-645
936-074
```

6. Afficher uniquement le numéro de `Lili Boulanger` tout en étant insensible à la casse

Commande
```
grep -i "boulanger[[:blank:]]lili" telephone.txt | cut -f 3```
```

Résultat
```
936-074
```

### Question 7 : Date

1. Afficher la date courante

Commande
```
date
```

Résultat
```
jeu. 01 oct. 2020 16:52:26 CEST
```

2. Afficher le calendrier du mois courant

Commande
```
cal
```

Résultat
```
    Octobre 2020
di lu ma me je ve sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31
```

3. Afficher le calendrier de septembre 1810

Commande
```
cal september 1810
```

Résultat
```
   Septembre 1810
di lu ma me je ve sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30
```

4. Afficher le calendrier de septembre 1752

Commande
```
cal september 1752
```

Résultat
```
   Septembre 1752
di lu ma me je ve sa
       1  2 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
```

## Question 8 : Configuration du bash

1. 
