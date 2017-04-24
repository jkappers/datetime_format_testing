# Converts date and time instances to string representations according to the
# format specified by the format source.
class PreferredFormatFormatter
  def initialize(format_preference)
    @format_preference = format_preference
  end

  # Create a Date instance using the format source's date format string
  def date(obj)
    obj.strftime @format_preference.date_format.format_string
  end

  # Create a Time instance using the format source's time format string
  def time(obj)
    obj.strftime @format_preference.time_format.format_string
  end
end
