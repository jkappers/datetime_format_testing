module FormatPreference
  def date_format
    Format.new '%m/%d/%Y','MM/DD/YYYY'
  end

  def time_format
    Format.new '%m/%d/%Y %l:%M %p', 'MM/DD/YYYY 12:30 AM'
  end
end
