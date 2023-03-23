require 'rspec'
require_relative '../classes/book'
require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'

describe Book do
  context 'When testing Book class' do
    book_genre = Genre.new('Terror')
    book_author = Author.new('Juan', 'Sanchez')
    book_label = Label.new('The book', 'red')
    book = Book.new(book_genre, book_author, book_label, '2021-01-01', 'He')

    it 'The genre of book should be "Terror"' do
      expect(book.genre.name).to eq('Terror')
    end

    it 'The author name of book should be "Juan"' do
      expect(book.author.first_name).to eq('Juan')
    end

    it 'The title of book should be "The book"' do
      expect(book.label.title).to eq('The book')
    end

    it 'can_be_archived method should return false' do
      book.cover_state = 'good'
      expect(book.can_be_archived?).to eq(false)
    end

    it 'can_be_archived method should return true' do
      book.cover_state = 'bad'
      expect(book.can_be_archived?).to eq(true)
    end
  end
end
