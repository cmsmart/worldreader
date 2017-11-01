# The Literature Map

### Data issues

#### Countries and regions
I thought about whether only countries should be considered unique or should regions be included (for example, would Puerto Rico be included in America, and Martinique in France?). I went with regions as unique reaading destinations as well.

#### Author's country
Ideally an author would only have a relationship with one country, so that any associated books could be linked specifically to that country. In reality, there are many authors that have some kind of dual or multi country identity, so while this application only creates a one to many relationship, it really should be able to cope with a many to many relationship. 

#### ISBN and book identity
An ISBN is a unique identifier for a book, but it is also unique to edition and reprintings of a single book, so that a book with one title and author might have multiple ISBNs. Therefore, the title and the author combined needs to be the unique identifier for a book.