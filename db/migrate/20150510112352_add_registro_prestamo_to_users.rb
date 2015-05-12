class AddRegistroPrestamoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :registro_prestamo, :text
  end
end
