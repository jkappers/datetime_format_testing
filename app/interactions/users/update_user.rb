class UpdateUser < AppInteraction
  object :user

  string :name
  string :birth_date

  interface :format_preference,
            methods: %i(date_format)

  validates :birth_date, date_string: {
    format: ->(interaction) { interaction.format_preference.date_format }
  }

  def execute
    user.name = name if name?
    user.birth_date = preferred_format_parser.date(birth_date) if birth_date?

    unless user.save
      errors.merge! user.errors
    end

    user
  end

  private

  def preferred_format_parser
    PreferredFormatParser.new format_preference
  end
end
