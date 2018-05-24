require './lib/book'
require './lib/author'
require './lib/book'

class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(b_title)
    @books.any? do |book|
      book.title == b_title
    end
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def retrieve_last_name(full_name)
    split_names = full_name.partition(' ')
    split_names.last
  end

  def find_by_author(full_name)
    last_name = retrieve_last_name(full_name)
    book_hash = {}
    @books.each do |book|
      if book.author_last_name == last_name
        book_hash[book.title] = book
      end
    end
    return book_hash
  end

  def retrieve_book_pub_year(book)
    split_publication_date = book.publication_date.partition(', ')
    split_publication_date.last
  end

  def find_by_publication_date(p_year)
    book_hash = {}
    @books.each do |book|
      publication_year = retrieve_book_pub_year(book)
      if publication_year == p_year
        book_hash[book.title] = book
      end
    end
    return book_hash
  end
end
