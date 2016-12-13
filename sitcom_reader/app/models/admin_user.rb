class AdminUser < ApplicationRecord

  has_secure_password

  scope :sorted, lambda { order('username ASC') }

  # #public b/c it's going to get called in a view?
  # def name
  #   "#{first_name} #{last_name}"
  # end

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  # validates :first_name, :presence => true,
  #                        :length => { :maximum => 25 }
  # validates :last_name, :presence => true,
  #                       :length => { :maximum => 50 }
  validates :username, :length => { :within => 3..25 },
                       :uniqueness => true
  validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => EMAIL_REGEX,
                    :confirmation => true

  # validate :custom_method
  #
  # private
  #
  # def custom_method
  #   if test_case
  #     errors.add(:attribute, "message")
  #   end
  # end

end
