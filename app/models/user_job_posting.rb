class UserJobPosting < ApplicationRecord
    belongs_to :user 
    belongs_to :job_posting 
end
