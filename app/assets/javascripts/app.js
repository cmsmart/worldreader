// Algolia autocomplete search field with links to authors and books

var client = algoliasearch("YFHQLSX107", "7703b1da55e995ed5ea72e594dfb7ec2")
var books = client.initIndex('Book');
var authors = client.initIndex('Author');

autocomplete('#aa-search-input', {}, [
    {
      source: autocomplete.sources.hits(books, { hitsPerPage: 3 }),
      displayKey: 'title',
      templates: {
        header: '<div class="aa-suggestions-category">Books</div>',
        suggestion: function(suggestion) {
          return '<a href="/books/' +  suggestion._highlightResult.id_to_string.value + '">' +
            suggestion._highlightResult.title.value + '</a><span>';
            }
      }
    },
    {
      source: autocomplete.sources.hits(authors, { hitsPerPage: 3 }),
      displayKey: 'name',
      templates: {
        header: '<div class="aa-suggestions-category">Authors</div>',
        suggestion: function(suggestion) {
            return '<a href="/authors/' +  suggestion._highlightResult.id_to_string.value + '">' +
            suggestion._highlightResult.name.value + '</a><span>';
            }
      }
    }
]);
