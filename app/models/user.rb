class User
  include FormatPreference
  include ActiveModel::Model

  attr_accessor :id, :birth_date, :name, :created_at

  with_options presence: true do |m|
    m.validates :birth_date
    m.validates :created_at
  end

  def self.current
    new
  end

  def save
    true
  end

  def self.find(id)
    new.tap do |u|
      u.id = id
      u.name = 'Joshua Kappers'
      u.birth_date = Date.today.iso8601
      u.created_at = DateTime.now.iso8601
    end
  end
end
