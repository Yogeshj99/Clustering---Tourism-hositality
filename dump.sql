create database batch5_RA;
use batch5_RA;

-- Movies Tables 
CREATE TABLE Directors (
    director_id INT PRIMARY KEY,
    name VARCHAR(255)
);
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    director_id INT,
    release_date DATE,
    box_office_million DECIMAL(10, 2),
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100)
);
CREATE TABLE Movie_Genres (
    movie_id INT,
    genre_id INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
    PRIMARY KEY (movie_id, genre_id)
);
INSERT INTO Directors (director_id, name) VALUES
(1, 'Christopher Nolan'),
(2, 'Sofia Coppola'),
(3, 'Martin Scorsese'),
(4, 'Denis Villeneuve'),
(5, 'Ava DuVernay'),
(6, 'Wes Anderson'),
(7, 'Quentin Tarantino');

INSERT INTO Movies (movie_id, title, director_id, release_date, box_office_million) VALUES
(1, 'Time to Wander', 1, '2023-04-15', 150),
(2, 'The Silent Ocean', 2, '2023-05-20', 210),
(3, 'A Dream of Spring', 3, '2023-06-05', 95),
(4, 'Spacebound', 1, '2023-06-22', 300),
(5, 'The Last Light', 4, '2023-07-01', 185);
INSERT INTO Movies (movie_id, title, director_id, release_date, box_office_million) VALUES
(6, 'Echoes of Tomorrow', 5, '2023-08-15', 120),
(7, 'Whispers in the Wind', 6, '2023-09-01', 135),
(8, 'Forever and a Day', 5, '2023-10-23', 220),
(9, 'The Hidden Truth', 7, '2023-11-05', 190),
(10, 'Beyond the Horizon', 2, '2023-12-15', 250);


INSERT INTO Genres (genre_id, genre_name) VALUES
(1, 'Science Fiction'),
(2, 'Drama'),
(3, 'Thriller'),
(4, 'Fantasy'),
(5, 'Adventure');

INSERT INTO Movie_Genres (movie_id, genre_id) VALUES
(1, 1),
(1, 5),
(2, 2),
(3, 4),
(3, 2),
(4, 1),
(5, 3),
(5, 2);
INSERT INTO Movie_Genres (movie_id, genre_id) VALUES
(6, 2),
(6, 3),
(7, 4),
(7, 5),
(8, 1),
(9, 3),
(10, 1),
(10, 5);

-- Product Supplier 
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    quantity INT,
    supplier_id INT
);

INSERT INTO products (product_name, category, price, quantity, supplier_id) VALUES
('Laptop', 'Electronics', 1200.00, 50, 1),
('Smartphone', 'Electronics', 800.00, 100, 2),
('Tablet', 'Electronics', 500.00, 30, 3),
('Headphones', 'Electronics', 100.00, 200, 1),
('Keyboard', 'Electronics', 50.00, 150, 2),
('Chair', 'Furniture', 200.00, 80, 4),
('Desk', 'Furniture', 300.00, 40, 5),
('Sofa', 'Furniture', 700.00, 20, 4),
('Bed', 'Furniture', 1000.00, 30, 5),
('T-shirt', 'Clothing', 20.00, 300, 6),
('Jeans', 'Clothing', 50.00, 150, 7),
('Dress', 'Clothing', 80.00, 100, 8),
('Shoes', 'Clothing', 70.00, 200, 6);

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    city VARCHAR(100)
);

INSERT INTO suppliers (supplier_name, city) VALUES
('Supplier A', 'New York'),
('Supplier B', 'Los Angeles'),
('Supplier C', 'Chicago'),
('Supplier D', 'Houston'),
('Supplier E', 'Miami'),
('Supplier F', 'San Francisco'),
('Supplier G', 'Seattle');

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(15)
);
INSERT INTO Customers (customer_id, customer_name, email, phone_number) VALUES
(1, 'John Doe', 'johndoe@example.com', '555-1234'),
(2, 'Jane Smith', 'janesmith@example.com', '555-5678'),
(4, 'Dhoni', 'Dhoni@example.com', '555-5675'),
(5, 'Tulkar', 'tu;kar@example.com', '555-1235'),
(6, 'Naveen', 'naveen@example.com', '555-5675'),
(7, 'Stephen Jhon', 'Stephen@example.com', '555-1254'),
(8, 'Usha', 'usha@example.com', '555-5578');

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    quantity INT,
    transaction_date DATE,    
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Transactions (product_id, customer_id, quantity, transaction_date) VALUES
(1, 1, 2, '2023-01-01'),
(2, 2, 1, '2023-01-01'),
(3, 2, 1, '2023-01-01'),
(3, 1, 2, '2023-01-02'),
(4, 7, 1, '2023-01-02'),
(4, 6, 1, '2023-01-03'),
(5, 4, 2, '2023-01-04'),
(6, 2, 1, '2023-01-06'),
(7, 5, 1, '2023-01-07'),
(7, 6, 2, '2023-01-15'),
(8, 7, 1, '2023-01-16'),
(8, 7, 1, '2023-01-17'),
(6, 1, 2, '2023-01-15'),
(5, 2, 1, '2023-01-16');

-- Election 
CREATE TABLE Candidates (
    candidate_id INT PRIMARY KEY,
    name VARCHAR(100),
    party VARCHAR(50)
);


CREATE TABLE Constituencies (
    constituency_id INT PRIMARY KEY,
    name VARCHAR(100),
    state VARCHAR(50)
);

CREATE TABLE Election_Results (
    result_id INT PRIMARY KEY,
    constituency_id INT,
    candidate_id INT,
    votes INT,
    election_year INT,
    FOREIGN KEY (constituency_id) REFERENCES Constituencies(constituency_id),
    FOREIGN KEY (candidate_id) REFERENCES Candidates(candidate_id)
);

INSERT INTO Candidates (candidate_id, name, party) VALUES
(1, 'Neha Singh', 'BJP'),
(2, 'Amit Patel', 'INC'),
(3, 'Rajesh Kumar', 'AAP'),
(4, 'Sunita Yadav', 'SP'),
(5, 'Manoj Tiwari', 'BSP'),
(6, 'Anjali Rao', 'DMK'),
(7, 'Bhaskar Das', 'TMC'),
(8, 'Chetan Reddy', 'YSRCP'),
(9, 'Divya Prakash', 'JD(U)'),
(10, 'Eshaan Pillai', 'NCP');

INSERT INTO Constituencies (constituency_id, name, state) VALUES
(1, 'Varanasi', 'Uttar Pradesh'),
(2, 'Amethi', 'Uttar Pradesh'),
(3, 'Raipur', 'Chhattisgarh'),
(4, 'Kolkata North', 'West Bengal'),
(5, 'Chennai Central', 'Tamil Nadu'),
(6, 'Gandhinagar', 'Gujarat'),
(7, 'Bhopal', 'Madhya Pradesh'),
(8, 'Lucknow Central', 'Uttar Pradesh'),
(9, 'Bangalore South', 'Karnataka'),
(10, 'Patna Sahib', 'Bihar');

INSERT INTO Election_Results (result_id, constituency_id, candidate_id, votes, election_year) VALUES
(1, 1, 1, 50000, 2022),
(2, 1, 2, 45000, 2022),
(3, 1, 1, 55000, 2023),
(4, 1, 2, 46000, 2023),
(5, 1, 1, 62000, 2024),
(6, 1, 2, 48000, 2024),
(7, 2, 3, 35000, 2022),
(8, 2, 4, 34000, 2022),
(9, 2, 3, 37000, 2023),
(10, 2, 4, 36000, 2023),
(11, 2, 3, 39000, 2024),
(12, 2, 4, 38000, 2024),
(13, 3, 5, 30000, 2022),
(14, 3, 6, 28000, 2022),
(15, 3, 5, 31000, 2023),
(16, 3, 6, 29000, 2023),
(17, 3, 5, 33000, 2024),
(18, 3, 6, 30000, 2024);

-- Teacher Students

CREATE TABLE Teachers (
    TeacherID INT AUTO_INCREMENT PRIMARY KEY,
    TeacherName VARCHAR(255) NOT NULL
);
CREATE TABLE Classes (
    ClassID INT AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(255) NOT NULL,
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);
CREATE TABLE Grades (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    Subject VARCHAR(255) NOT NULL,
    Score INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Teachers (TeacherName) VALUES 
('John Smith'),
('Jane Doe'),
('Emily Johnson');
INSERT INTO Teachers (TeacherName) VALUES ('Ram'),('Vivek');

INSERT INTO Classes (ClassName, TeacherID) VALUES 
('Mathematics', 1),
('Science', 2),
('History', 3);
INSERT INTO Students (Name, ClassID) VALUES 
('Alice Brown', 1),
('Bob White', 2),
('Charlie Green', NULL),  -- This student is not registered in any class
('Daisy Black', 3);
iNSERT INTO Students (Name, ClassID) VALUES 
('Jane Doe',3),('Emily Johnson',1);
INSERT INTO Grades (StudentID, Subject, Score) VALUES 
(1, 'Mathematics', 85),
(1, 'Science', 90),
(2, 'Science', 75),
(3, 'History', 88),
(4, 'Mathematics', 92),
(4, 'History', 81);