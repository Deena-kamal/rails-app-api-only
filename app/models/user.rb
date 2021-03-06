class User < ApplicationRecord
    # encrypt password -> this adds methods to authenticate against a bcrypt password. It's this mechanism that requires us to have a password_digest attribute
    has_secure_password
    has_paper_trail

    # Model associations
    has_many :todos, foreign_key: :created_by
    # Validations
    validates_presence_of :name, :email, :password_digest
end
