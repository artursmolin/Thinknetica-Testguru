class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, :dependent => :destroy
  has_many :users, through: :user_tests, :dependent => :destroy
  has_many :users, through: :test_authors, :dependent => :destroy


  def self.by_category(category_name)
    joins("INNER JOIN categories ON tests.category_id = categories.id").
      where(categories: { title: category_name }).
      order(title: :desc).pluck(:title)
  end
end
