require 'faker'

FactoryGirl.define do
 
  # user schema:
    # t.string   "email",                  default: "", null: false
    # t.string   "encrypted_password",     default: "", null: false
    # t.string   "reset_password_token"
    # t.datetime "reset_password_sent_at"
    # t.datetime "remember_created_at"
    # t.integer  "sign_in_count",          default: 0,  null: false
    # t.datetime "current_sign_in_at"
    # t.datetime "last_sign_in_at"
    # t.string   "current_sign_in_ip"
    # t.string   "last_sign_in_ip"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.string   "username"
    # t.string   "provider"
    # t.string   "uid"
    # t.string   "affiliation"

  # Returns virtual attributes, not database attributes.
  factory :user do
    sequence(:email) {|n| Faker::Internet.email }
    sequence(:username) {|n| Faker::Internet.user_name } 
    sequence(:password) {|n| Faker::Internet.password(8) } 

    factory :idme_user do
      provider "IDme"
      sequence(:uid) {|n| Faker::Number.number(6) }
      sequence(:affiliation) {|n| n%2 > 0 ? "Retired" : "Veteran" } 
      
      factory :verified_idme_user do
        verified true
      end
    end
  end
  
end

