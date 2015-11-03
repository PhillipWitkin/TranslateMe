#TranslateMe
###A web application by Team Meowth
Members: [Anna Rankin](http://github.com/annarankin), [Liz Fonseca](http://github.com/lizfonseca), [Colby Somerville](http://github.com/CSomerville), [Phillip Witkin](https://github.com/PhillipWitkin) and [Daniel Tomic](http://github.com/tomdanny)

##Project details for TranslateMe

###Check out our development backlog! [Trello Board](https://trello.com/b/ffOr3Vrl/knope-meowth)

###[Wireframes](/wireframes)

###[ERD](/img/LanguageAppERD.png)


**TranslateMe** is a single page web application which provides a fun and easy way for native and non-native English speakers with interests in foreign languages to explore translations of colloquial English phrases.

Each English phrase is displayed on a unique "card", which contains an explanation of the meaning of that phrase in English, and any number of translations of that phrase into another language. Translations include the phrase in the non-English language's alphabet, a phonetic spelling, and a literal English meaning of that translation.

The front end application was written in HTML, CSS and JavaScript using the Backbone.js library and consumes a Rails-powered API.

##Features

###User Authentication
- A Guest can create a username and password
- A User can sign with their username and password

TranslateMe features user login and authentication. Certain application features are available to guests, but user-specific functions are not accessible without signing in as a user.

###Guest Features
- A guest can view a list of cards, containing the English phrase, explanation, and when it was created. Any card on the list can be clicked to provide a view of the entire card which, shows all the translations for that phrase, and any category tags associated with that card.

- The card list can be viewed so that the cards are ordered by order of most recently created.

- A guest can view a list of all categories used to tag any of the cards.

- Each category, when clicked, yields a list of cards which are tagged with that category.

###User-Only Features
While signed in, users can access all guest features as well as the following additional functionality:

- A user can create a new card:

  A new card must contain an English phrase, not already defined on a card, and an explanation of that phrase. It can also contain one or more category tags.

- A user can add a translation to a card:
  The user selects a language to translate the phrase into and enters in the translation in the language's alphabet, the English pronunciation, and the literal meaning of the phrase.

- A user can "favorite" a card by clicking the star on the card.

- A user can view a list of cards they have selected as favorites


##Project details for TranslateMe

<!-- - Single Page Web application which consumes an api serving json  provided by rails for the main app, but performs server-side rendering for user-auethentication -->

###Data Structure

- Our [ERD](/img/LanguageAppERD.png) contains several many-to-many relationships. Our API relied heavily on ActiveRecord techniques to ensure each route provided correct, relevant, but not excessive information for each call the client-side made to the server. 

###Technologies:

- ####Backbone.js 
  - Application front-end uses Backbone.js and Underscore.js to create a MV*, as well as for logic and iteration related to DOM manipulation.
  - File structure - Our JavaScript files are separated and namespaced to organize various Backbone components. Each model, collection, router and view are defined in separate files and organized within distinct folders.

- ####Moment.js
  - Client-side JavaScript library used to format times and render modified times as a nicely displayed "time from now".