class FindUser < AppInteraction
  integer :id

  def execute
    user = User.find id
    user.birth_date = DateTime.iso8601 user.birth_date
    user.created_at = DateTime.iso8601 user.created_at
    user
  end
end
