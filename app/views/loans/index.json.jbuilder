json.array!(@loans) do |loan|
  json.extract! loan, :id, :user_id, :book_id, :loandate, :loanreturn
  json.url loan_url(loan, format: :json)
end
