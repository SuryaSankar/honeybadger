class User < OmniAuth::Identity::Models::ActiveRecord
  has_many :qpapers
  has_many :questions
  has_many :authentications
  has_secure_password

  
  validates_presence_of :password, :on => :create
  validates :name, presence: true, uniqueness: true, allow_nil: true

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, 
            format: { with: email_regex },
            uniqueness: { case_sensitive: false }, allow_nil: true	

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
	case auth.provider
		when 'facebook'
			puts auth
			puts auth.info.email
			puts auth.info.name
			random_password=rand(36**10).to_s(36)
			user=User.new(password: random_password, password_confirmation: random_password  )
			user.name = auth.info.name if auth.info.name.present?
			if auth['info'].has_key?('email')
				puts "yes"
				user.email = auth['info']['email']
			end
			user.save!
			return user
		when 'google_oauth2'
			puts auth
			puts auth.info.email
			puts auth.info.name
			random_password=rand(36**10).to_s(36)
			user=User.new(password: random_password, password_confirmation: random_password  )
			user.name = auth.info.name if auth.info.name.present?
			if auth['info'].has_key?('email')
				puts "yes"
				user.email = auth['info']['email']
			end
			user.save!
			return user
		when 'identity'
			puts auth['info']
			create(name: auth['info']['name'])
		else
			create(name: auth['info']['name'])
	end
    # you should handle here different providers data
    # eg. case auth['provider'] ..
    # IMPORTANT: when you're creating a user from a strategy that
    # is not identity, you need to set a password, otherwise it will fail
    # I use: user.password = rand(36**10).to_s(36)
  end

end
