json.array!(@books) do |book|
  json.extract! book, :id, :ISBN, :Author, :Title, :physical, :electronic, :loanDate, :returnDate
  json.url book_url(book, format: :json)
end
