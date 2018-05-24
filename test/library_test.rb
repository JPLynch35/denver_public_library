require './test/test_helper'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test
  def test_it_exists
    dpl = Library.new

    assert_instance_of Library, dpl
  end

  def test_library_starts_with_no_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new
    actual = dpl.books

    assert_equal [], actual
  end

  def test_can_add_a_book_to_library_collections
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    actual = dpl.books[0].title

    assert_equal "Jane Eyre", actual
  end

  def test_can_add_multiple_books_to_library_collections
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    actual1 = dpl.books[0].title

    assert_equal "Jane Eyre", actual1

    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    actual2 = dpl.books
    actual3 = dpl.books[1].title
    actual4 = dpl.books[2].title

    assert_instance_of Array, actual2
    assert_equal "To Kill a Mockingbird", actual3
    assert_equal "Villette", actual4
  end

  def test_can_use_include_method_on_library
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    actual1 = dpl.include?("To Kill a Mockingbird")
    actual2 = dpl.include?("A Connecticut Yankee in King Arthur's Court")

    assert actual1
    refute actual2
  end

  def test_card_catologue_alphebetizes_books_by_authors_last_name
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    actual = dpl.card_catalogue.last.author_last_name

    assert_equal "Lee", actual
  end

  def test_retrieve_last_name_correctly_outputs_last_name
    dpl = Library.new
    actual = dpl.retrieve_last_name("Billy Bob")

    assert_equal "Bob", actual
  end

  def test_find_by_author_returns_found_hash_of_books
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    hash = dpl.find_by_author("Charlotte Bronte")
    actual = hash["Villette"].author_last_name

    assert_equal "Bronte", actual
  end

  def test_retrieve_book_pub_year_outputs_year
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
    dpl = Library.new
    actual = dpl.retrieve_book_pub_year(book)

    assert_equal "1960", actual
  end

  def test_find_by_publication_date_returns_found_hash_of_books
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    hash = dpl.find_by_publication_date("1960")
    split_publication_date = hash["To Kill a Mockingbird"].publication_date.partition(', ')
    actual = split_publication_date.last
    
    assert_equal "1960", actual
  end

end
