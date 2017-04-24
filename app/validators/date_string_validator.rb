##
# options:
#  format[Format]
#
class DateStringValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    date_format = options[:format].call record
    parsed_value = parse_date value, date_format.format_string

    unless [DateTime, Date].any? { |kind| parsed_value.is_a? kind }
      record.errors.add attribute, format: date_format
    end
  end

  private

  def parse_date(value, format_string)
    DateTime.strptime value, format_string
  rescue
    value
  end
end
