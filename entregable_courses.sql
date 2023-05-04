-- create database cursos with owner hermez;

/*
 * Users
 * 	name = varchar(max 30), required
 * 	email = varchar(max 150)
 * 	password = varchar, required
 * 	age = smallint. requires, 
 * Course
 *	title = varchar(100), required,
 *	description = text
 *	level (principiantes, medios, avanzados)
 *	Teacher = varchar(100)
 * Course video
 * 	title = varchar
 * 	url
 * Categories
 * 	name = ('programacion', 'fisica', 'matematicas')
 * Roles
 * 	name ('student', 'teacher', 'admin')
 * 
 * 
 * pivote_courses_categories
 * 	category_id
 * 	course_id
 * 
 * // Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table course {
  id varchar
  title varchar
  description text
  level varchar
  teacher_id varchar
  level_id varchar
  created_at timestamp 
}

Table level {
  id integer
  name varchar
}

Table user {
  id integer [primary key]
  name varchar
  password varchar
  age smallint
  rol_id integer
  created_at timestamp
}

Table category {
  id integer [primary key]
  name varchar
  created_at timestamp
}

Table course_video {
  id integer [primary key]
  title varchar
  url varchar
  created_at timestamp
}

Table role {
  id integer
  name varchar
}

Table categories_courses {
  category_id varchar
  course_id varchar
}

Ref: role.id < user.rol_id // many-to-one

Ref: user.id > course.teacher_id

Ref: level.id > course.level_id

// Ref: users.id < follows.followed_user_id

// Ref: "follows"."following_user_id" < "follows"."followed_user_id"
 * 
 * 
 */

create table users (
	id int primary key,
    name varchar(30),
    email varchar(150),
    age smallint,
    password varchar(100),
);

create table rol (
	id int primary key,
    name varchar(30),
);

create table course (
	id int primary key,
    title varchar(30),
    description text,
    level_id int foreign key level(id),
    teacher_id int foreign key user(id),
);

create table course_video (
	id int primary key,
    title varchar(30),
    url varchar(30),
);

create table categories_courses (
	id int primary key,
	category_id int foreign key category(id),
	course_id int foreign key course(id),
);

create table categories (
	id int primary key,
    name varchar(40),
);

create table level (
    id int primary key,
	name varchar(30),
);

INSERT INTO user VALUES (
	'Braulio',
    'brau@gmail.com',
    21,
    'Gen23'
);

INSERT INTO course VALUES (
    'Braulio',
    'Lechuga',
    21,
    'Gen23'
);

INSERT INTO categories VALUES (
	1,
	'Programming',
), (
	2,
	'Science',
), (
	3,
	'Soft skills',
);

INSERT INTO course_video VALUES (
    1,
	'Python vars',
	'https:12234.com'
), (
    2,
	'Python loop',
	'https:12234.com'
), (
    3,
	'Python functions',
	'https:12234.com'
);

INSERT INTO rol VALUES (
    1,
    'student'
), (
    2,
    'teacher'
), (
    3,
    'admin'
);

INSERT INTO level VALUES (
    1,
    'Basic'
), (
    2,
    'medium'
), (
    3,
    'hard'
);

select * from level;



