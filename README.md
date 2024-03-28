# Génération du site "On The Road Again"

Le site est statiquement généré en utilisant le logiciel [Hugo](https://gohugo.io/) qui est basé sur le langage _Go_ (mais bien sûr vous n'aurez pas à faire du _Go_). Ces 2 logiciels sont disponibles les paquetages Linux standards mais sont aussi accessibles sur les autres OS.


## Organisation

Le site est stocké sur GitHub [ici](https://github.com/hcasse/ontheroadagain).

Le plan est le suivant :

1. Vous ramenez ou vous mettez à jour le site.

```sh
$ git clone git@github.com:hcasse/ontheroadagain.git
```
ou
```sh
$ cd ontheroadagain
$ git pull
```

2. Vous modifiez ou vous ajoutez des pages.

```sh
$ cd ontheroadagain
$ git add NOUVELLE_PAGE
```

3. vous pushez sur github.

```sh
$ cd ontheroadagain
$ git commit -a -m "MESSAGE"
$ git push
```



4. Vous me prévenez de vos modifications sur Discord.

5. Dans les jours qui suivent, je met à jour le site disponible [ici](https://secil.univ-tlse3.fr/ontheroadagain/).

**Pour cela bien sûr, il faut que vous me donniez votre identifiant _github_ pour que je vous associe au projet.**




## Organisation des pages

Les pages à proprement parler sont dans le répertoire `content` organisé de la manière suivante :

* `authors` contient un répertoire par auteur (voir ci-dessous).
* `blogs` contient les blogs dans des sous-répertoires par auteur.
* `docs` contient les pages de documentation.
* `posts` contient des messages génériques.

Comme vous l'auriez peut être remarqué, les pages sont décrites en [MarkDown](https://daringfireball.net/projects/markdown/) et utilisent donc l'extension `.md`.



## Produire vos pages

### Personnaliser votre page auteur

Le répertoire `authors/AUTEUR` contient la description de l'auteur. Il s'agit d'une page de description de l'auteur en MarkDown avec une icone associée, pour l'instant, `anonymous.png`. Vous pouvez bien sûr remplacer cette image par celle que vous voulez (n'oubliez pas de la pousser).

### Ajouter une page de blog

Chaque auteur a un répertoire dans `blogs` qui contient un message initial dans la page `first.md`. Bien sûr, vous pouvez mettre à jour cette page.

Vous pourrez ensuite créer autant de pages que vous voudrez dans ce répertoire avec les images que vous voulez. Il ne faudra juste pas oublier de pousser sur GitHub les fichiers ajoutés.

### Format des pages

Le format des pages est le suivant:
```
---
title: TITRE DE LA PAGE
author: AUTEUR
draft: false
image: blogs/AUTEUR/IMAGE
credit: IMAGE-CREDIT
date: YYYY-MM-DD
---

TEXTE MARKDOWN

```

La ligne `credit` n'est pas indispensable mais quand j'utilise des images [Flickr](https://www.flickr.com), je met ici l'URL de l'auteur de l'image.


## Tester

Pour tester les pages que vous avez créées (avec le reste du site),
taper:

```sh
$ make serve
```

Le site va être généré en local sur votre machine et vous trouverez l'adresse locale sur la dernière ligne:

```
Web Server is available at http://localhost:XXX/ontheroadagain/ (bind address 127.0.0.1)
```

Il suffit de copier l'adresse dans votre browser préféré. Notez que la génération est dynamique : à mesure que vous modifiez ou que vous ajoutez des pages, elles sont mises à jour dans le browser.
