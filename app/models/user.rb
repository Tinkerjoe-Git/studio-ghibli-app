class User < ActiveRecord::Base
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods
    has_secure_password
    has_many :reviews

    validates :username, presence: true, uniqueness: true, length: { minimum: 4 }, format: { with: /\A[a-zA-Z]+\z/, message: "cannot contain blank space, numbers, or special characters" }
    validates :password, presence: true, length: { in: 6..20 }
    
    def slug
        self.username.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        self.all.find{ |user| user.slug == slug }
    end

end