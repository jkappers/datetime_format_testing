##
# options:
#  format[Format]
#
class TimeStringValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    time_format = options[:format].call record
    parsed_value = parse_time value, time_format.format_string

    unless [DateTime, Date].any? { |kind| parsed_value.is_a? kind }
      record.errors.add attribute, :invalid_format, humanized_format: date_format.humanized_format_string
    end
  end

  private

  def parse_time(value, format_string)
    DateTime.strptime value, format_string
  rescue
    value
  end
end
