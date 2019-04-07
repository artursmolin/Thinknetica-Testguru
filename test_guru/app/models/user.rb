class User < ApplicationRecord
  has_many :tests, through: :user_tests, :dependent => :destroy
  has_many :tests, through: :test_authors, :dependent => :destroy

  def test_level(level)
    Test.joins("JOIN user_tests ON tests.id = user_tests.test_id").
      where(user_tests: { user_id: self.id }, tests: { level: level })
  end
end
