defmodule Factory do
  use ExMachina.Ecto, repo: PhxLibrary.Repo
  alias PhxLibrary.{Library, Author, Book}

  def library_factory do
    %Library{
      name: "Kalunga",
      address: "Rua dos padeiros"
    }
  end

  def author_factory do
    %Author{
      name: "Pix",
      email: "a@a",
      library: build(:library)
    }
  end

  def book_factory do
    %Book{
      title: "Title",
      author: build(:author)
    }
  end
end
