class User < ApplicationRecord
    has_many :posts
    validates :name, presence: {message: "Can't be blank"}
    # before_save :doSomething
    protected 
    def doSomething
        self.name.upcase!
    end
end
