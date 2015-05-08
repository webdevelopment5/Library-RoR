class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.datetime :loandate
      t.datetime :loanreturn

      t.timestamps
    end
  end
end
