require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
  def test_it_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, charlotte_bronte
  end

  def test_author_starts_with_no_books_written
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    actual = charlotte_bronte.books

    assert_equal [], actual
  end

  def test_author_can_write_a_book
    book = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Jane Eyre", publication_date: "October 16, 1847"})
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    actual = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847").title
    expected = book.title

    assert_equal expected, actual
  end

  def test_author_who_writes_a_book_is_added_to_their_book_list
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    actual1 = charlotte_bronte.books
    expected1 = []

    assert_equal expected1, actual1

    charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    actual2 = charlotte_bronte.books[0].title
    expected2 = "Jane Eyre"

    assert_equal expected2, actual2
  end

  def test_author_who_writes_a_2nd_book_is_added_to_their_book_list
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    actual1 = charlotte_bronte.books
    expected1 = []

    assert_equal expected1, actual1

    charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    actual2 = charlotte_bronte.books[0].title
    expected2 = "Jane Eyre"

    assert_equal expected2, actual2

    charlotte_bronte.add_book("Villette", "1853")
    actual3 = charlotte_bronte.books[1].title
    expected3 = "Villette"
    
    assert_equal expected3, actual3
  end



end
