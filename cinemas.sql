CREATE TABLE users (
    id_user SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    admin BOOLEAN NOT NULL DEFAULT FALSE
);


CREATE TABLE cinemas (
    id_cinema SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
);

CREATE TABLE rooms (
    id_room SERIAL PRIMARY KEY,
    id_cinema INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    ability INT NOT NULL,
    FOREIGN KEY (id_cinema) REFERENCES cinemas(id_cinema)
);

CREATE TABLE movies (
    id_movie SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    gender VARCHAR(100) NOT NULL
);

CREATE TABLE sessions (
    id_session SERIAL PRIMARY KEY,
    id_movie INT NOT NULL,
    id_room INT NOT NULL,
    date_heure TIMESTAMP NOT NULL,
    tarif_plein DECIMAL(5,2) NOT NULL,
    tarif_etudiant DECIMAL(5,2) NOT NULL,
    tarif_enfant DECIMAL(5,2) NOT NULL,
    places_disponibles INT NOT NULL,
    FOREIGN KEY (id_movie) REFERENCES movies(id_movie),
    FOREIGN KEY (id_room) REFERENCES rooms(id_room)
);


CREATE TABLE reservations (
    id_reservation SERIAL PRIMARY KEY,
    id_user INT NOT NULL,
    id_session INT NOT NULL,
    nombre_tickets INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    date_reservation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_session) REFERENCES sessions(id_session)
);

INSERT INTO users (id_user, name, lastname, email, password, admin) VALUES
    (DEFAULT, 'Dupont', 'Thomas', 'thomas.dupont@gmail.com', 'motdepasse', FALSE),
    (DEFAULT, 'Dupont', 'Marie', 'marie.dupont@gmail.com', 'mdp123', TRUE);

INSERT INTO cinemas (id_cinema, name, address, city) VALUES
    (DEFAULT, 'Cinema MK3 - Paris', '1 Rue du Paris', 'Paris'),
    (DEFAULT, 'Cinema MK3 - Lyon', '1 Avenue de Lyon', 'Lyon'),
    (DEFAULT, 'Cinema MK3 - Marseille', '1 rue de Marseille', 'Marseille');

INSERT INTO rooms (id_room, id_cinema, name, ability) VALUES
    (DEFAULT, 1, 'Salle 1', 100),
    (DEFAULT, 2, 'Salle C', 80),
    (DEFAULT, 1, 'Salle C', 120),
    (DEFAULT, 3, 'Salle J', 90);

INSERT INTO movies (id_movie, title, duration, gender) VALUES
    (DEFAULT, 'Maman j'ai raté l'avion', 1h00, 'Comedy'),
    (DEFAULT, 'Maman j'ai encore raté l'avion', 1h30, 'Comedy'),
    (DEFAULT, 'Titanic', 1h20, 'Dramatic');

INSERT INTO sessions (id_session, id_movie, id_room, date_heure, tarif_plein, tarif_etudiant, tarif_enfant, places_disponibles) VALUES
    (DEFAULT, 1, 1, '2024-04-05 18:00:00', 9.20, 7.60, 5.90, 90),
    (DEFAULT, 2, 2, '2024-04-06 20:00:00', 9.20, 7.60, 5.90, 80),
    (DEFAULT, 3, 3, '2024-04-07 15:00:00', 9.20, 7.60, 5.90, 100);


INSERT INTO reservations (id_reservation, id_user, id_session, nombre_tickets, total, date_reservation) VALUES
    (DEFAULT, 1, 1, 2, 20.00, '2024-04-04 14:30:00'),
    (DEFAULT, 2, 2, 3, 33.00, '2024-04-05 10:15:00');
