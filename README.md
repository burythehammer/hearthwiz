# hearthWiz

A light website for tracking and managing Hearthstone card collections, written in Ruby &amp; Rails.

A personal project intended to be deployed on my own website.

Planned features for the near future:
- View a list of hearthstone cards, preferably with some useful filters
- View a page with details about a particular hearthstone card
- Ability to login and maintain a persistant presence. Salting and SHA hashing of passwords for MVP.
- A personal list to maintain your own private collection of hearthstone cards
- Simple and quick 'add' page so that users can add their own cards as they open packs
- Simple deck builder and maintainer
- Some sort of deck import function from popular websites
- Quick ways to add hearthstone cards from your collection (search as you type?)

The site will probably be using the Hearthstone JSON project to parse card data into the database, though I suspect some cleanup will be required to get it into my intended database schema.