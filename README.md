# Test technique Wimova
*Utilisation de SwiftUI et Combine et cible du projet : iOS 14*

## Organisation 
- Création du datamodel et de la structure de notre produit
- Initialiser le Presenter et Interactor
- Création des Views
- Récupérer les données JSON depuis le lien : https://dummyjson.com/products/search?q=phone
- Création d'un filtre
- Initialiser le Router
- Afficher le deuxième écran avec tous les détails du produit
- Créer un bouton qui permet le retour en arrière 
- Afficher les images

## Procédés
J'ai commencé par suivre les tutoriels de la documentation officiel de SwiftUI : https://developer.apple.com/tutorials/swiftui

J'ai utilisé les LandmarkRow, LandmarkList et LandmarkDetail comme base pour mes Views.

En ce qui concerne l'architecture de type clean (VIPER), j'ai eu beaucoup mal à comprendre au début l'utilité et comment l'implémenter. 
L'exemple d'architecture qui m'a été donné m'a énormément aidé et j'ai complété ceci avec ce site : https://www.kodeco.com/8440907-getting-started-with-the-viper-architecture-pattern

### Organisation de mon architecture
- Dans le dossier Entities
	- La structure d'un produit
	- le DataModel
- Dans le dossier VIPER
	- Interactor
	- ProductPresenter
	- Router
- Dans le dossier View
	- ProductList
	- ProductRow
	- ProductDetails

## Mes principales difficultés
Mes premières difficultés ont été de comprendre tous les termes du sujet.
J'ai fais un maximum de recherche et j'ai suivi les tutoriels SwiftUI pour comprendre un maximum le contexte.

Cependant avec les tutoriels certaines notions manquaient comme la mise en place d'une architecture VIPER. Comme expliquée ci dessus, j'ai pu surmontée cette difficulté grâce à l'exemple qui m'a été donné ainsi que des recherches personnels. 

Ensuite il m'a été difficile de mettre en place une fonction permettant de récupérer les données depuis le lien : https://dummyjson.com/products/search?q=phone à l'aide de dataTask mais également les images des produits.

Je suis assez familière avec les fonctions asynchrones cependant je n'étais pas sûre de comment utiliser dataTask. 
Encore actuellement je ne suis pas encore sûre de comment placer mon DispatchQueue.main.async pour la fonction getProducts car j'ai un warning en ce qui concerne le "background thread".

Lorsque j'utilise dataTask, je l'utilise avec un completionHandler qui va me permettre de récupérer le "data", la "reponse" et l'erreur s'il y en a une. 
Et c'est lorsque je devais exploiter le "data" que je n'étais pas sûre de moi et que j'ai mis beaucoup de temps à savoir l'utiliser notamment pour récupérer des données JSON.




