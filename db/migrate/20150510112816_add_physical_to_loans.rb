class AddPhysicalToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :physical, :boolean
  end
end
