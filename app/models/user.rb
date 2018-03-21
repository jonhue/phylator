class User < ApplicationRecord

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    notification_target

    attr_accessor :calculation_id

    has_many :calculations
    has_many :purchases

end
