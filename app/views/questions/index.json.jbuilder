json.array!(@questions) do |question|
  json.extract! question, :index, :show, :new, :edit, :create, :update, :destroy
  json.url question_url(question, format: :json)
end
