CREATE DATABASE BD_LojaCD
USE BD_LojaCD

CREATE TABLE CDs(
    COD_CD INT NOT NULL,
    Nome_CD VARCHAR(120) NOT NULL,
    Dt_Compra DATE NOT NULL,
    Valor_Pago FLOAT NOT NULL,
    Local_Compra VARCHAR(150) NOT NULL,
    Album VARCHAR(3) NOT NULL,    
    PRIMARY KEY(COD_CD)
);

CREATE TABLE Musica(
    COD_CD INT NOT NULL,
    Numero_Musica INT NOT NULL,
    Nome_Musica VARCHAR(120) NOT NULL,
    Artista VARCHAR(100) NOT NULL,
    Tempo INT,
    FOREIGN KEY (COD_CD) REFERENCES CDs(COD_CD)
);

INSERT INTO CDs (COD_CD, Nome_CD, Dt_Compra, Valor_Pago, Local_Compra, Album)
VALUES
(1, 'Greatest Hits', '2023-01-15', 25.99, 'Amazon', 'sim'),
(2, 'Pop Anthems', '2023-03-05', 19.99, 'Music Store', 'sim'),
(3, 'Classic Rock Collection', '2023-05-20', 18.50, 'Online Store', 'não'),
(4, 'Best of Jazz', '2023-07-10', 22.75, 'Local Record Shop', 'sim'),
(5, '90s Hits', '2023-09-02', 16.99, 'CD Warehouse', 'não'),
(6, 'Indie Vibes', '2023-11-18', 21.30, 'Music Festival', 'sim'),
(7, 'Hip Hop Essentials', '2024-01-07', 24.50, 'Online Store', 'sim'),
(8, 'Country Classics', '2024-02-29', 20.25, 'Local Market', 'não'),
(9, 'Electronic Beats', '2024-04-15', 23.00, 'Tech Store', 'sim'),
(10, 'Reggae Vibes', '2024-06-08', 17.75, 'Record Fair', 'não');

INSERT INTO Musica (COD_CD, Numero_Musica, Nome_Musica, Artista, Tempo)
VALUES
(1, 1, 'Bohemian Rhapsody', 'Queen', 355),
(1, 2, 'Don''t Stop Believin''', 'Journey', 251),
(1, 3, 'Hotel California', 'Eagles', 390),
(2, 1, 'Billie Jean', 'Michael Jackson', 294),
(2, 2, 'Like a Prayer', 'Madonna', 351),
(2, 3, 'Sweet Child o'' Mine', 'Guns N'' Roses', 356),
(3, 1, 'Stairway to Heaven', 'Led Zeppelin', 482),
(3, 2, 'Imagine', 'John Lennon', 183),
(3, 3, 'Smells Like Teen Spirit', 'Nirvana', 301),
(4, 1, 'Take Five', 'Dave Brubeck', 324),
(4, 2, 'So What', 'Miles Davis', 562),
(4, 3, 'My Favorite Things', 'John Coltrane', 822),
(5, 1, 'Smells Like Teen Spirit', 'Nirvana', 301),
(5, 2, 'Wannabe', 'Spice Girls', 172),
(5, 3, 'I Want It That Way', 'Backstreet Boys', 213),
(6, 1, 'Loser', 'Beck', 235),
(6, 2, 'Creep', 'Radiohead', 235),
(6, 3, 'No Rain', 'Blind Melon', 217),
(7, 1, 'Lose Yourself', 'Eminem', 326),
(7, 2, 'California Love', '2Pac', 285),
(7, 3, 'Gin and Juice', 'Snoop Dogg', 211),
(8, 1, 'Take Me Home, Country Roads', 'John Denver', 188),
(8, 2, 'The Gambler', 'Kenny Rogers', 212),
(8, 3, 'Ring of Fire', 'Johnny Cash', 157),
(9, 1, 'Around the World', 'Daft Punk', 429),
(9, 2, 'Blue Monday', 'New Order', 449),
(9, 3, 'One More Time', 'Daft Punk', 320),
(10, 1, 'Could You Be Loved', 'Bob Marley', 237),
(10, 2, 'Redemption Song', 'Bob Marley', 229),
(10, 3, 'No Woman, No Cry', 'Bob Marley', 429);


-- EX01 
SELECT * FROM CDs;

-- EX02
SELECT Nome_CD , Dt_Compra FROM CDs ORDER BY Nome_CD;


-- EX03
SELECT Nome_CD , Dt_Compra FROM CDs ORDER BY Dt_Compra DESC;


-- EX04
SELECT Nome_CD , Dt_Compra, Valor_Pago FROM CDs ORDER BY Valor_Pago DESC;


-- EX05
SELECT SUM(Valor_Pago) AS Soma_Valor FROM CDs;


-- EX06
SELECT * FROM Musica WHERE COD_CD = 1;

-- EX07
SELECT Nome_Musica, Artista FROM Musica;


-- EX08
SELECT Numero_Musica, Nome_Musica, Tempo FROM MUSICA WHERE COD_CD = 5 ORDER BY Numero_Musica;


-- EX09
SELECT COUNT(Numero_Musica) FROM Musica;

-- EX10
SELECT Nome_Musica FROM Musica WHERE Artista = 'JOSÉ PEDRO';

-- EX11
SELECT Nome_CD FROM CDs WHERE Local_Compra = 'SUBMARINO';

-- EX12
SELECT * FROM Musica ORDER BY Nome_Musica;

-- EX13
SELECT * FROM CDs WHERE Album = 'SIM';

-- EX14
SELECT AVG(Valor_Pago) AS Media_Valor FROM CDs

-- INNER JOIN EX1
SELECT CDs.Nome_CD, Musica.Nome_Musica
FROM CDs INNER JOIN Musica
ON CDs.COD_CD = Musica.COD_CD

-- INNER JOIN EX2
SELECT CDs.Nome_CD, Musica.Nome_Musica
FROM CDs INNER JOIN Musica
ON CDs.COD_CD = Musica.COD_CD
WHERE Musica.Numero_Musica=1

-- Sub Query
SELECT Nome_CD, Valor_Pago
From CDs
Where Valor_Pago = (
Select Max(Valor_Pago) 
From CDs )

-- Group By
SELECT COD_CD, Nome_Musica, SUM(Tempo) as Tempo_Total
From Musica
GROUP BY COD_CD, Nome_Musica;

SELECT COD_CD, SUM(Tempo) as Tempo_Total
From Musica
GROUP BY COD_CD;

SELECT Album, Count(*) as Quantidade_CDs
From CDs
Group By Album;

SELECT COD_CD, Count(*) as Quantidade_Musicas
From Musica
GROUP BY COD_CD;
