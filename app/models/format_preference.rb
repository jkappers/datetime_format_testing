module FormatPreference
  def date_format
    Format.all.first
  end

  def time_format
    Format.all.last
  end
end
