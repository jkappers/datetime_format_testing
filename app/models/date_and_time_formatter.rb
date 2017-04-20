# Converts date and time instances to string representations according to the
# format specified by the format source.
class DateAndTimeFormatter
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
