json.array!(@notes) do |note|
  json.extract! note, :note, :user_id, :notedate
  json.url note_url(note, format: :json)
end