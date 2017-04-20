class User
  include ActiveModel::Model

  attr_accessor :id, :birth_date, :created_at

  with_options presence: true, date_or_time: true do |m|
    m.validates :birth_date
    m.validates :created_at
  end

  def is_a_date
  end

  def date_format
    '%m/%d/%Y'
  end

  def time_format
    '%m/%d/%Y %l:%M %p'
  end

  def friendly_date_format
    'MM/DD/YYYY'
  end

  def friendly_time_format
    'MM/DD/YYYY 12:30 AM'
  end

  def self.current
    new
  end

  def self.find(id)
    new.tap do |u|
      u.id = id
      u.birth_date = Date.today.iso8601
      u.created_at = DateTime.now.iso8601
    end
  end
end
