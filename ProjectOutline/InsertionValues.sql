INSERT INTO Movie (title, genre, duration_minutes, release_date) VALUES
('Inception', 'Sci-Fi', 148, '2010-07-16'),
('Interstellar', 'Sci-Fi', 169, '2014-11-07');

INSERT INTO Theater (name, location) VALUES
('Star Cineplex', 'Bashundhara City'),
('Blockbuster Cinema', 'Jamuna Future Park');

INSERT INTO Screen (theater_id, screen_number, total_seats) VALUES
(1, 1, 120),
(2, 3, 160);

INSERT INTO Seat (screen_id, seat_number, seat_type) VALUES
(1, 1, 'Regular'),
(1, 2, 'Premium');

INSERT INTO Showtime (movie_id, screen_id, show_date, show_time) VALUES
(1, 1, '2025-12-01', '14:30:00'),
(2, 2, '2025-12-01', '18:00:00');

INSERT INTO User (name, phone, email, password_hash) VALUES
('Rafiq', '01700000000', 'rafiq@example.com', 'hash123'),
('Sadia', '01811111111', 'sadia@example.com', 'hash456');

INSERT INTO Booking (user_id, showtime_id, booking_time, total_price) VALUES
(1, 1, '2025-11-30 13:20:00', 400),
(2, 2, '2025-11-30 15:10:00', 600);

INSERT INTO BookedSeat (booking_id, seat_id) VALUES
(1, 1),
(2, 2);

INSERT INTO MovieRating (user_id, movie_id, score) VALUES
(1, 1, 9),
(2, 2, 10);

INSERT INTO Admin (email, password_hash) VALUES
('admin1@example.com', 'adminhash1'),
('admin2@example.com', 'adminhash2');

INSERT INTO Log (admin_id, user_id, action_time) VALUES
(1, NULL, '2025-11-30 10:00:00'),
(NULL, 1, '2025-11-30 11:45:00');

