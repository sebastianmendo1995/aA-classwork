class PostSub < ApplicationRecord
  
  belongs_to :post,
    inverse_of: :post_subs

  belongs_to :sub,
    inverse_of: :post_subs

end
