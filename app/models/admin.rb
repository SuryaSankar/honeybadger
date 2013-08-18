class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable, :recoverable, :rememberable
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,   :trackable, :validatable
end
