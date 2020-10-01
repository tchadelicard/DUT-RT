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
ls -l | grep test
```
Résultat
```
drwxr-xr-x  2 tchadelicard tchadelicard  4096 oct.   1 14:40 test
```
Le d indique que c'est un répertoire, rwx indique que l'utilisateur peut lire écrire et lire à travers ce dossier. Le grouep du dossier ici `tchadelicard` peut lire et passer à travers le dossier et tout le monde peut juste passer à travers le dossier. Ceci correponds à ce que nous avons fait en faisant un `umask 022`, c'est à dire retirer l'écriture sur le groupe et tout le monde.
3. Modifier les droits par défaut (rw pour l'utilisateur, r pour le groupe, aucun droit pour le groupe)
Commandes
```
umask 037
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
umask 777
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
