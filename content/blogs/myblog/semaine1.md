---
title: Semaine 1
author: "My Blog"
draft: false
image: blogs/myblog/semaine1.jpg
---

Vous avez besoin de [Hugo](https://gohugo.io/) pour générer le site (disponible sur toute bonne distribution Linux).


Il faut ramener les sources du site :
```bash
git clone git@github.com:hcasse/ontheroadagain.git
```

Pour créer votre blog, il suffit de répéter la structure :
* `content/blogs/myblog` -- ce répertoire doit être en minuscule,
* `content/authors/my-blog` -- nom de l'auteur en minuscule avec les espaces remplacés par des `-`.


Les pages doivent ressembler à ça :
```
---
title: Semaine 1
author: "My Blog"
draft: false
image: blogs/myblog/semaine1.jpg
---

Mon texte ici !
```

Vous mettez tout ce que vous voulez ici en [MarkDown](https://wprock.fr/guide/markdown-syntax/).

Pour mettre une image (placée dans votre répertoire):

```
![Image](../semaine1.jpg)
```

![Image](../semaine1.jpg)

Vous pouvez alors tested vos pages :
```bash
$ hugo serve
```

Le site serva visible à l'adresse : [http://localhost:1313/ontheroadagain/](http://localhost:1313/ontheroadagain/).

Après, vous pouvez commiter and pusher.
```bash
$ git commit -a
$ git push
```

Je mettrai à jour de temps en temps.

