class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter, :facebook]
  
  has_one :identity, dependent: :destroy
  has_many :order
  has_many :places, dependent: :destroy
  validates :phone, :presence => true, :length => { :minimum => 7 }, format: { with: /\d/, message: "Debe ingresar un numero"}
  validates :name, :lastname, :presence => true
  #validates_presence_of :uid, :provider
  #validates_uniqueness_of :uid, :scope => :provider
  enum role:{
    "User"  => 0,
    "Admin" => 1
  }

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity=Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
 
    if user.nil?
      email = auth.info.email
      user = User.find_by(email: email) if email
      names = auth.info.name.split(" ")
      name= names[0]
      lastname= names[1]
      phone = '3136064521'
      acces_token= auth.credentials.token
      puts auth.info.first_name
      image= auth.info.image
      provider = auth.provider
      uid= auth.uid
      # Create the user if is a new registration
      if user.nil?
        password = Devise.friendly_token[0,20]
        if auth.provider == 'facebook'
          user = User.new(
            email: email ? email : "#{auth.uid}@change-me.com",
            password: password,
            password_confirmation: password,
            name: name,
            lastname: lastname,
            phone: phone,
            uid: uid,
            provider:provider,
            acces_token:acces_token,
            image:image
          )
          user.skip_confirmation!
        elsif auth.provider == 'twitter'
          user = User.new(
            email: "#{auth.uid}@change-me.com",
            password: password,
            password_confirmation: password,
            name: name,
            lastname: lastname,
            phone: phone,
            image: image,
            provider: provider,
            uid: uid,
            acces_token:acces_token
          )
          user.skip_confirmation!
        end
      end
      user.skip_confirmation!
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

  def friends
     @friends ||= Koala::Facebook::API.new(self.acces_token,'bf6979189d4be46172aa81ef9e4ae06a')
      @friends.get_connections('me',"friends?fields=id,name,picture.type(normal)", api_version: "v2.7") 
  end 
end