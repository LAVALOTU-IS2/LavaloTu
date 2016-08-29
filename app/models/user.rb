class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter, :facebook]
  
  has_many :order
  has_many :place
  validates :phone, :presence => true, :length => { :minimum => 7 }, format: { with: /\d/, message: "Debe ingresar un numero"}
  validates :name, :lastname, :presence => true
  
  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    
 
    if user.nil?
      email = auth.info.email
      user = User.find_by(email: email) if email
      names = auth.info.name.split(" ")
      name= names[0]
      lastname= names[1]
      phone = "3132603143"
      # Create the user if it's a new registration
      if user.nil?
        password = Devise.friendly_token[0,20]
        if auth.provider == 'facebook'
          user = User.new(
            email: email ? email : "#{auth.uid}@change-me.com",
            password: password,
            password_confirmation: password,
            name: name,
            lastname: lastname,
            phone: phone
          )
        elsif auth.provider == 'twitter'
          user = User.new(
            email: "#{auth.uid}@change-me.com",
            password: password,
            password_confirmation: password,
            name: name,
            lastname: lastname,
            phone: phone
          )
        end
      end
      user.save!
    end
 
    if identity.user != user
      identity.user = user
      identity.save!
    end
    
    user
  end
 
  def email_verified?
    if self.email
      if self.email.split('@')[1] == 'change-me.com'
        return false
      else
        return true
      end
    else
      return false
    end
  end
end