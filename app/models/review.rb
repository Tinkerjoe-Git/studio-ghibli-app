class Review < ActiveRecord::Base
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods
    belongs_to :user
    
    validates :title, presence: true
    validates :content, presence: true
end