# Twitter-App
## Objectif
L’objectif principal est de fournir aux utilisateurs une plateforme simple et sécurisée pour :
- Se connecter et interagir avec Mini Twitter via leur portefeuille blockchain.
- Publier des messages, voir et interagir avec les publications d'autres utilisateurs.
- Modifier leurs publications tout en respectant la transparence des données.
## Technologies Utilisées
- Solidity : Développement du contrat intelligent pour gérer les publications, les interactions et les droits d'édition.
- Web3.js : Connexion de l'interface web au contrat intelligent sur la blockchain Ethereum pour permettre les transactions.
- HTML/CSS/JavaScript : Conception de l'interface utilisateur pour garantir une expérience fluide et intuitive.
## Fonctionnalités
Voici les fonctionnalités principales implémentées dans Mini Twitter, conformément aux exigences :
###### a. Connexion au Wallet
- Lorsqu’un utilisateur accède à l’interface, il est invité à connecter son portefeuille Ethereum via un bouton "Se Connecter au Wallet".
- La connexion affiche l’adresse de l’utilisateur et lui permet d’interagir avec la DApp de manière sécurisée.
###### b. Changement d’Utilisateur
- L’utilisateur a la possibilité de déconnecter le portefeuille actuel et de se reconnecter avec un autre. Cela permet de basculer entre différents comptes Ethereum.
###### c. Fil d’Actualité
- Un fil d'actualité affiche toutes les publications des utilisateurs.
- Chaque post indique l'ID de l'utilisateur, le nombre de "likes" et de "dislikes".
###### d. Ajout d'un Post
- L'utilisateur peut ajouter un message en l'associant à son identifiant (adresse Ethereum). Ce message est ensuite stocké de manière immuable sur la blockchain.
- Le post comprend l’adresse de l’utilisateur.
###### e. Interaction (Like/Dislike)
- Chaque utilisateur peut aimer ou ne pas aimer les publications. Une seule interaction est permise par publication : si un utilisateur a "liké" une publication, il peut changer pour un "dislike" ou annuler son interaction, mais il ne peut pas en accumuler plusieurs.
- Le nombre total de "likes" et de "dislikes" est affiché pour chaque post, assurant une transparence totale.
###### f. Modification des Posts
- L’utilisateur ayant publié le message peut le modifier ultérieurement.
- Cette fonctionnalité est exclusivement réservée à l'auteur du message, et les autres utilisateurs n’ont aucun droit de modification

![image](https://github.com/IMANEELAOUFI/Twitter-App/blob/main/screen.png)

  
## Sécurité et Confidentialité
- Contrôle par le Propriétaire : L'utilisation des contrats intelligents garantit que seul le propriétaire de chaque publication a le droit de modification, assurant un contrôle complet sur ses données.
- Immutabilité et Transparence : Tous les posts et interactions sont stockés de manière immuable sur la blockchain, ce qui prévient toute falsification ou suppression de données par des tiers.
- Confidentialité des Interactions : En utilisant la blockchain, les données des utilisateurs sont sécurisées et leur vie privée est préservée, évitant les risques de collecte de données par une entité centralisée.
## Conclusion
Mini Twitter représente un exemple concret de l’application de la blockchain dans les réseaux sociaux, permettant aux utilisateurs de publier, d’interagir et de gérer leurs propres données en toute transparence. En intégrant les fonctionnalités principales de microblogging et en garantissant une sécurité accrue, Mini Twitter met en lumière les avantages des applications décentralisées pour les réseaux sociaux. Les perspectives d’amélioration de l'application laissent entrevoir un potentiel pour transformer davantage l'expérience utilisateur tout en répondant aux défis de scalabilité et de frais associés aux DApps sur Ethereum.
