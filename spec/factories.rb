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
    email "CPTWintersRET@example.mil"
    username "richarddwinters"
    password "EasyCo506"
    password_confirmation "EasyCo506"

    # factory :idme_user do
    #   provider "IDme"
    #   uid "12345"
    #   factory :verified_idme_user do
    #     affiliation "Retired"
    #   end
    # end
  end
  
end

