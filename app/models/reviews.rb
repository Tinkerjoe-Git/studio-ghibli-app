class Reviews < ActiveRecord::Base
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods
    belongs_to :user
    
    validates :title, presence: true
    validates :description, presence: true
end