class User < ApplicationRecord
  def test_level(user_id, level)
    Test.joins("INNER JOIN user_tests ON tests.id = user_tests.test_id").
    where(tests: {user_id: user_id, level: level})
  end
end
