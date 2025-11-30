CREATE TABLE Movie (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  genre VARCHAR(50),
  duration_minutes INT,
  release_date DATE
);

CREATE TABLE Theater (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  location VARCHAR(80)
);

CREATE TABLE Screen (
  id INT AUTO_INCREMENT PRIMARY KEY,
  theater_id INT NOT NULL,
  screen_number INT NOT NULL,
  total_seats INT,
  FOREIGN KEY (theater_id)
    REFERENCES Theater(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Seat (
  id INT AUTO_INCREMENT PRIMARY KEY,
  screen_id INT NOT NULL,
  seat_number INT NOT NULL,
  seat_type VARCHAR(20),
  FOREIGN KEY (screen_id)
    REFERENCES Screen(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Showtime (
  id INT AUTO_INCREMENT PRIMARY KEY,
  movie_id INT NOT NULL,
  screen_id INT NOT NULL,
  show_date DATE,
  show_time TIME,
  FOREIGN KEY (movie_id)
    REFERENCES Movie(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (screen_id)
    REFERENCES Screen(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE User (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(50) UNIQUE,
  password_hash VARCHAR(255)
);

CREATE TABLE Booking (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  showtime_id INT NOT NULL,
  booking_time DATETIME,
  total_price INT,
  FOREIGN KEY (user_id)
    REFERENCES User(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (showtime_id)
    REFERENCES Showtime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE BookedSeat (
  id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT NOT NULL,
  seat_id INT NOT NULL,
  FOREIGN KEY (booking_id)
    REFERENCES Booking(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (seat_id)
    REFERENCES Seat(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE MovieRating (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  movie_id INT NOT NULL,
  score INT,
  FOREIGN KEY (user_id)
    REFERENCES User(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (movie_id)
    REFERENCES Movie(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Admin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(50) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE Log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  admin_id INT NULL,
  user_id INT NULL,
  action_time DATETIME,
  FOREIGN KEY (admin_id)
    REFERENCES Admin(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (user_id)
    REFERENCES User(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

