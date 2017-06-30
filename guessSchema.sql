Create table users (
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) UNIQUE NOT NULL,
created_at TIMESTAMP DEFAULT NOW()
);

Create table photos (
id INT AUTO_INCREMENT PRIMARY KEY,
image_url VARCHAR(255) NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
user_id INT NOT NULL,
FOREIGN KEY(user_id) REFERENCES users(id)
);

Create table comments (
id INT AUTO_INCREMENT PRIMARY KEY,
comment_text VARCHAR(255),
created_at TIMESTAMP DEFAULT NOW(),
user_id INT NOT NULL,
FOREIGN KEY(user_id) REFERENCES users(id),
photo_id INT NOT NULL,
FOREIGN KEY(photo_id) REFERENCES photos(id)
);

Create table likes (
created_at TIMESTAMP DEFAULT NOW(),
user_id INT,
FOREIGN KEY(user_id) REFERENCES users(id),
photo_id INT,
FOREIGN KEY(photo_id) REFERENCES photos(id),
PRIMARY KEY(user_id, photo_id)
);

Create table tags (
id INT AUTO_INCREMENT PRIMARY KEY,
tag_name VARCHAR(255) UNIQUE,
created_at TIMESTAMP DEFAULT NOW()
);

Create table photo_tags (
photo_id INT NOT NULL,
FOREIGN KEY (photo_id) REFERENCES photos(id),
tag_id INT NOT NULL,
FOREIGN KEY (tag_id) REFERENCES taSELgs(id),
PRIMARY KEY (photo_id, tag_id)
);

Create table follows (
created_at TIMESTAMP DEFAULT NOW(),
follower_id INT,
FOREIGN KEY(follower_id) REFERENCES users(id),
followee_id INT,
FOREIGN KEY(followee_id) REFERENCES users(id),
PRIMARY KEY(follower_id, followee_id)
);

--PRIMARY KEY(user_id, photo_id) means only one can be associated to a unique user/photo combo