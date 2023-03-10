json.extract! appointment, :id, :type, :title, :duration, :datetime, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
