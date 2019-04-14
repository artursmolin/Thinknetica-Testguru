class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: "Test", foreign_key: "author_id"

  scope :test_level, ->(level) {(where(level: level)}
  end
end
