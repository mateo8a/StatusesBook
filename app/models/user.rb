class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :profile_name, presence: true, 
                           uniqueness: true, 
                           format: {
                           	with: /A-Za-z0-9_-./,
                           	message: 'Format your profile name correctly or else you cannot use the best app ever!'
                           }

  has_many :statuses

  def full_name
  	first_name + " " + last_name
  end
end
