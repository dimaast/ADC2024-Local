class User < ApplicationRecord
  #можно включить подтверждение по почте, логины через соцсети, трекинг с какого адреса пришел
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  has_many :
        #  has_one: role
        #  has_one: profile не работает пока

end
