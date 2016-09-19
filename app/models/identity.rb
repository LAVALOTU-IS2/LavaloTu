class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
 
  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end

  def facebook
  #puts self.token
   @facebook ||= Koala::Facebook::API.new(self.acces_token,'bf6979189d4be46172aa81ef9e4ae06a')
    @facebook.get_connections('me',"friends?fields=id,name,picture.type(large)", api_version: "v2.7") 
    #puts @facebook.get_connections("me","books")
    #puts @facebook.get_connections("me","friends")
	end 

end
