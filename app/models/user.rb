class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  serialize :registro_prestamo, Array
  has_many :loans, dependent: :destroy
  has_many :wishes, dependent: :destroy
  #devise :database_authenticatable, :registerable,
   #      :recoverable, :rememberable, :trackable, :validatable
         
end
