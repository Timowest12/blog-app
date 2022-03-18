object @post
attributes :id, :title, :text

child :comments do
    attributes :id, :text, :username, :user_id, :post_id
end