-- Создание базы данных
CREATE DATABASE LibraryManagement;

USE LibraryManagement;

-- Таблица пользователей
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Таблица ролей
CREATE TABLE Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL
);

-- Таблица связи пользователей и ролей
CREATE TABLE UserRoles (
    UserRoleID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    RoleID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Таблица книг
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    PublishedYear INT NOT NULL,
    Genre VARCHAR(100),
    CopiesAvailable INT DEFAULT 0
);

-- Таблица жанров
CREATE TABLE Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(100) NOT NULL UNIQUE
);

-- Таблица связи книг и жанров
CREATE TABLE BookGenres (
    BookGenreID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    GenreID INT NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Таблица заказов
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Таблица деталей заказов
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    BookID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Таблица отзывов
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    BookID INT NOT NULL,
    ReviewText TEXT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Таблица авторов
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL UNIQUE
);

-- Таблица связи книг и авторов
CREATE TABLE BookAuthors (
    BookAuthorID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    AuthorID INT NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Таблица издательств
CREATE TABLE Publishers (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    PublisherName VARCHAR(255) NOT NULL UNIQUE
);

-- Таблица связи книг и издательств
CREATE TABLE BookPublishers (
    BookPublisherID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    PublisherID INT NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- Таблица хранения аудиокниг
CREATE TABLE Audiobooks (
    AudiobookID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    AudioFilePath VARCHAR(500),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Таблица библиотек
CREATE TABLE Libraries (
    LibraryID INT AUTO_INCREMENT PRIMARY KEY,
    LibraryName VARCHAR(255) NOT NULL UNIQUE,
    Location VARCHAR(500)
);

-- Таблица связи книг и библиотек
CREATE TABLE LibraryBooks (
    LibraryBookID INT AUTO_INCREMENT PRIMARY KEY,
    LibraryID INT NOT NULL,
    BookID INT NOT NULL,
    Copies INT DEFAULT 0,
    FOREIGN KEY (LibraryID) REFERENCES Libraries(LibraryID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Вставка данных в роли
INSERT INTO Roles (RoleName) VALUES ('Админ'), ('Пользователь');

-- Вставка данных в пользователей
INSERT INTO Users (UserName, Password, Email) VALUES
('AdminUser', 'adminpass', 'admin@library.com'),
('JohnDoe', 'johndoe123', 'johndoe@example.com');

-- Вставка данных в UserRoles
INSERT INTO UserRoles (UserID, RoleID) VALUES
(1, 1), -- Админ
(2, 2); -- Обычный пользователь

-- Вставка данных в жанры
INSERT INTO Genres (GenreName) VALUES
('Художественная литература'), ('Нон-фикшн'), ('Детектив'), ('Научная фантастика'), ('Фэнтези');

-- Вставка данных в авторов
INSERT INTO Authors (AuthorName) VALUES
('Джордж Оруэлл'), ('Джоан Роулинг'), ('Агата Кристи'), ('Айзек Азимов');

-- Вставка данных в книги
INSERT INTO Books (Title, Author, PublishedYear, Genre, CopiesAvailable) VALUES
('1984', 'Джордж Оруэлл', 1949, 'Художественная литература', 10),
('Гарри Поттер и философский камень', 'Джоан Роулинг', 1997, 'Фэнтези', 15),
('Убийство в Восточном экспрессе', 'Агата Кристи', 1934, 'Детектив', 7),
('Основание', 'Айзек Азимов', 1951, 'Научная фантастика', 5);

-- Вставка данных в библиотеки
INSERT INTO Libraries (LibraryName, Location) VALUES
('Центральная библиотека', 'ул. Главная, 123, Центр города'),
('Западная библиотека', 'ул. Западная, 456, Западный район');

-- Связь книг и библиотек
INSERT INTO LibraryBooks (LibraryID, BookID, Copies) VALUES
(1, 1, 5),
(1, 2, 10),
(2, 3, 3),
(2, 4, 2);
