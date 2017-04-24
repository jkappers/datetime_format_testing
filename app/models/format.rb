class Format < Struct.new :format_string, :friendly_format_string
  def self.all
    @all ||= [
      new('%m/%d/%Y','MM/DD/YYYY'),
      new('%m/%d/%Y %l:%M %p', 'MM/DD/YYYY 12:30 AM')
    ]
  end
end
