# Parses date and time strings using a format source. The format source must
# implement a date_format and time_format property or method that returns a
# valid date/time format string.
class ValueFormatter
  def initialize(format_source)
    @format_source = format_source
  end

  # Create a Date instance using the format source's date format string
  def date(obj)
    obj.strftime @format_source.date_format
  end

  # Create a Time instance using the format source's time format string
  def time(obj)
    obj.strftime @format_source.time_format
  end
end
