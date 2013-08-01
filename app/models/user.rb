class User < OmniAuth::Identity::Models::ActiveRecord
  has_many :qpapers
  has_many :questions
  has_many :authentications
  has_secure_password

  
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_uniqueness_of :name

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
            format: { with: email_regex },
            uniqueness: { case_sensitive: false }

  before_create { generate_token(:auth_token) }  
    
  def generate_token(column)  
    begin  
      self[column] = SecureRandom.urlsafe_base64  
    end while User.exists?(column => self[column])  
    puts "finished generate token"
  end 

  def send_password_reset  
    generate_token(:password_reset_token)  
    self.password_reset_sent_at = Time.zone.now  
    save!  
    UserMailer.password_reset(self).deliver  
  end 

  def self.create_with_omniauth(auth)
    # you should handle here different providers data
    # eg. case auth['provider'] ..
    create(name: auth['info']['name'])
    # IMPORTANT: when you're creating a user from a strategy that
    # is not identity, you need to set a password, otherwise it will fail
    # I use: user.password = rand(36**10).to_s(36)
  end

end
