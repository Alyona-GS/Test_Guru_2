class Test < ApplicationRecord
  has_many :test_users
  has_many :questions
  has_many :users, through: :test_users

  belongs_to :category
  belongs_to :author, class_name: "User"

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  scope :easy,   -> { all_with_level(0..1) }
  scope :medium, -> { all_with_level(2..4) }
  scope :hard,   -> { all_with_level(5..Float::INFINITY) }

  scope :all_with_level, ->(level) { where(level: level) }

  scope :all_from, -> (category) {
    joins(:category).where('categories.title = ?', category)
  }

  def self.title_from(category)
    self.all_from(category).order(title: :desc).pluck(:title)
  end
end
