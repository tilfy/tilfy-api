user = User.create!(email: "user@localhost.com", password: "123456")
category = Category.create!(name: "CatTest")
post = Post.create!(user_id: user.id, title: "Title Test", content: "Content Test", category_id: category.id)
comment = Comment.create!(user_id: user.id, post_id: post.id, content: 'Content Test')