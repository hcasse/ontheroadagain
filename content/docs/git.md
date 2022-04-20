---
title: Système de Gestion de Version - GIT
author: "Hugues Casse"
tags: [git]
draft: false
date: 2022-04-20
image: docs/git.jpg
---

# En théorie

Un _Système de Gestion de Version_ (SGV)  est un logiciel permettant :
* de conserver l'historique  des sources d'une application (modifications + auteur),
* de développer en parallèle et de synchroniser l'état des sources.

Il est donc à tout moment de possible de revenir à une ancienne version des sources
ou de comprendre comment et quand un bug a été introduit. L'ensemble des sources et de leur historique est appelé **dépôt**.

[**git**](https://git-scm.com/) est un des multiples gestionnaires de version existant (SubVersion, Mercurial, Bazaar, CVS, etc) mais semble être celui qui va s'imposer. Il a été développé à la base par le créateur de Linux en réaction à la lenteur d'évolution  des autres gestionnaires et s'est  imposé.

Développer avec un SGV tel que **git** consiste lors de chaque phase incrémentale :
1. A ramener la version la plus à jour depuis le dépôt principal dans votre espace de développement.
2. Réaliser le développement.
3. Ajouter éventuellement les nouveaux fichiers.
4. Enregistrer la nouvelle version _cohérente_ des sources.
5. Envoyer cette nouvelle version vers le dépôt principal.

Lors de la dernière phase, on peut se rendre compte que les sources ont évolués à cause d'un autre développeur. On doit alors ramener la nouvelle version des sources et la _fusionner_ (_merge_ en anglais) avec la vesion locale. La plupart, cela est fait automatiquement mais des conflits peuvent apparaître et devrons être réglé manuellement par le développeur. Dans tous cas, il faut procéder à une nouvelle phase de test avant de redémarrer les étapes 4 et 5. 

Contrairement aux 2 grands poids-lourds vieillissant, CVS et SubVersion, **git** est dit décentralisé : chaque dépôt local peut évoluer séparément (supporter plusieurs version) avant de finalement être envoyé sur le dépôt principal. Cela permet de bénéficier de la fonctionnalité d'historique des sources durant le développement d'un incrément.


# Concrètement

Pour créer un dépôt local à partir d'un dépôt distant, il suffit de taper la commande :
```bash
$ git clone URL_DEPOT [NOM_REPERTOIRE]
```
Les paramètres variables sont en majuscule et ceux entre `[...]` sont optionnels.
A partir de là, toutes les commandes sont à lancer dans le répertoire ainsi créé.

Pour ramener la dernière version du dépôt principal, il suffit de taper:
```bash
$ git pull
```

On peut alors se mettre à développer. On remarquera que seuls certains fichiers (les sources) ont besoin d'être archivé : on n'archive typiquement pas les fichiers créés par le compilateur. Il faut donc dire à **git** quels sont les fichiers à ajouter au dépôt :
```bash
$ git add FICHIER
```

De même, pour supprimer un fichier du dépôt, on écrira :
```bash
$ git rm FICHIER
```

Enfin, on peut vouloir renommer un fichier :
```bash
$ git mv ANCIEN_NOM NOUVEAU_NOM
```

Bon, on est arrivé au bout du développement et du test d'un incrément et on veut créer une nouvelle version :
```bash
$ git commit -a -m "MESSAGE"
```
Pour chaque version, il est de bon ton d'expliquer les modifications introduites par l'incrément pour mieux comprendre l'évolution des sources, d'où la nécessité de mettre un _MESSAGE_.

Enfin, si on veut publier les sources sur le dépôt principal :
```bash
$ git push
```

Et voila. Et on recommence la procédure pour chaque nouvel incrément.

**Info :** toutes les informations du dépôt sont contenues dans le répertoire `.git`. Je vous déconseille donc d'y toucher.
