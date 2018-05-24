class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date
  def initialize(b_info = {author_first_name: f_name, author_last_name: l_name, title: b_title, publication_date: p_date})
      @author_first_name = b_info[:author_first_name]
      @author_last_name = b_info[:author_last_name]
      @title = b_info[:title]
      @publication_date = b_info[:publication_date]
  end

end
