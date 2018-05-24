require './lib/book'

class Author
  attr_reader :first_name,
              :last_name,
              :books
  def initialize(a_info = {first_name: "Charlotte", last_name: "Bronte"})
    @first_name = a_info[:first_name]
    @last_name = a_info[:last_name]
    @books = []
  end

  def add_book(b_title, p_date)
    new_book = Book.new({author_first_name: first_name, author_last_name: last_name, title: b_title, publication_date: p_date})
    @books << new_book
    return new_book
  end
end
