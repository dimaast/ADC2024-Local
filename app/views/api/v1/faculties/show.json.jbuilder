json.extract! @faculty, :id, :name, :created_at, :updated_at

json.set! :programs do
  json.array! @faculty.programs, partial: "api/v1/faculties/program", as: :program
end
