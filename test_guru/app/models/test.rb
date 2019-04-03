class Test < ApplicationRecord
  def self.by_category(category_name)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").
    where(categories: {title: category_name}).
    order(title: :desc).pluck(:title)
  end
end
