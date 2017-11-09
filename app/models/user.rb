class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable, :lockable

  has_one :profile

  # set roles
  enum role: [:user, :banned, :publisher, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

# Adding and removing books from a "Favourites book" list

  has_many :favourite_books, dependent: :destroy
  # has_many :books, through: :favourite_books

  # creates a new favourite_book row with book_id and user_id
  def favourite_book!(book)
    self.favourite_books.create!(book_id: book.id)
  end

  # destroys a favourite_book with matching book_id and user_id
  def unfavourite_book!(book)
    favourite_book = self.favourite_books.find_by_book_id(book.id)
    favourite_book.destroy!
  end

  # returns true of false if a book is favourite_booked by user
  def favourite_book?(book)
    self.favourite_books.find_by_book_id(book.id)
  end


# Adding and removing books from a "Want to read" list

  has_many :reading_lists, dependent: :destroy
  # has_many :books, through: :reading_lists

  def reading_list!(book)
    self.reading_lists.create!(book_id: book.id)
  end

  def remove_reading_list!(book)
    reading_list = self.reading_lists.find_by_book_id(book.id)
    reading_list.destroy!
  end

  def reading_list?(book)
    self.reading_lists.find_by_book_id(book.id)
  end


# Adding and removing books from a "Have Read" list

  has_many :reads, dependent: :destroy
  # has_many :books, through: :reads

  def read!(book)
    self.reads.create!(book_id: book.id)
  end

  def unread!(book)
    read = self.reads.find_by_book_id(book.id)
    read.destroy!
  end

  def read?(book)
    self.reads.find_by_book_id(book.id)
  end
  
end
