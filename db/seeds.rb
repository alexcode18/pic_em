Post.destroy_all
Author.destroy_all
Tag.destroy_all

#Author data
username = ["MonkeyButt", "BillyBob", "GlamourT"]
img_url = ["http://www.curiousblend.com/monkey.jpg","http://www.kboing.com.br/fotos/imagens/4f79f2197dc84.jpg","http://lecitykitty.com/wp-content/uploads/2014/05/audrey-2.jpg"]
bio = ["I like big butts...", "Howdy, Y'all", "Everything has Beauty."]
location = ["Nashville, TN", "New York, NY", "Los Angeles, CA"]
tag_id = [1,2,3]

#Post data
post_url = ["https://s-media-cache-ak0.pinimg.com/736x/79/98/b2/7998b2fb3df0920e55b8b02c6e1c0f6d.jpg","https://s-media-cache-ak0.pinimg.com/236x/b7/3f/80/b73f806301204a9d2f40c7b17b2fa599.jpg","https://s-media-cache-ak0.pinimg.com/236x/9f/6d/dc/9f6ddc77d790fbed6d95899f59191824.jpg"]
title = ["Pin-Up", "Old Penn Station", "Castle!"]
words = ["Elvgrin", "Photograph", "Neuschwanstein"]

#Tag data
tag_name = ["women","architecture","beauty","art","sexy","fun","sports","science","movies", "landscape", "illustration"]


#Authors
monkey = Author.create({
	username: username[0],
	img_url: img_url[0],
	bio: bio[0],
	location: location[0],
	password: "happy"
});

billy = Author.create({
	username: username[1],
	img_url: img_url[1],
	bio: bio[1],
	location: location[1],
	password: "happy"
});

glamour = Author.create({
	username: username[2],
	img_url: img_url[2],
	bio: bio[2],
	location: location[2],
	password: "happy"
});

#Posts
post1 = Post.create({
	img_url: post_url[0],
	title: title[0],
	words: words[0]
});

post2 = Post.create({
	img_url: post_url[1],
	title: title[1],
	words: words[1]
});

post3 = Post.create({
	img_url: post_url[2],
	title: title[2],
	words: words[2]
});

#Tags
tag1 = Tag.create({
	name: tag_name[0]
});

tag2 = Tag.create({
	name: tag_name[1]
});

tag3 = Tag.create({
	name: tag_name[2]
});

post1.tags << tag1
post2.tags << tag2
post3.tags << tag3

post1.author = monkey
post1.save
#########
# monkey.posts << post1
##########
post2.author = billy
post2.save
post3.author = glamour
post3.save
