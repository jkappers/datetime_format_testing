# Parses date and time strings using a format source. The format source must
# implement a date_format and time_format property or method that returns a
# valid date/time format string.
class PreferredFormatParser
  def initialize(format_preference)
    @format_preference = format_preference
  end

  # Create a Date instance using the format source's date format string
  def date(str)
    DateTime.strptime str, @format_preference.date_format.format_string
  rescue
    str
  end

  # Create a Time instance using the format source's time format string
  def time(str)
    Time.strptime str, @format_preference.time_format.format_string
  rescue
    str
  end
end
