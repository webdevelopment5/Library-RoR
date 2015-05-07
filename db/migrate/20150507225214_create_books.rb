class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :ISBN
      t.string :Author
      t.string :Title
      t.boolean :physical
      t.boolean :electronic
      t.datetime :loanDate
      t.datetime :returnDate

      t.timestamps
    end
  end
end
