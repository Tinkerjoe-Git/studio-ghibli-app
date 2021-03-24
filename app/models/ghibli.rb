class Ghibli < ActiveRecord::Base
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods
end