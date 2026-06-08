-- =====================
-- PHÂN QUYỀN
-- =====================

CREATE TABLE Roles(
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50)
);

CREATE TABLE Users(
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    RoleID INT,
    Username VARCHAR(50) UNIQUE,
    PasswordHash VARCHAR(255),
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Avatar VARCHAR(255),
    Status TINYINT DEFAULT 1,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(RoleID) REFERENCES Roles(RoleID)
);

-- =====================
-- ĐỊA CHỈ
-- =====================

CREATE TABLE Addresses(
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ReceiverName VARCHAR(100),
    ReceiverPhone VARCHAR(20),
    AddressDetail TEXT,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

-- =====================
-- DANH MỤC
-- =====================

CREATE TABLE Categories(
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100),
    Description TEXT
);

-- =====================
-- THƯƠNG HIỆU
-- =====================

CREATE TABLE Brands(
    BrandID INT AUTO_INCREMENT PRIMARY KEY,
    BrandName VARCHAR(100),
    Description TEXT
);

-- =====================
-- NHÀ CUNG CẤP
-- =====================

CREATE TABLE Suppliers(
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address TEXT
);

-- =====================
-- SẢN PHẨM
-- =====================

CREATE TABLE Products(
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT,
    BrandID INT,
    SupplierID INT,

    ProductName VARCHAR(255),
    Description LONGTEXT,

    Price DECIMAL(12,2),
    SalePrice DECIMAL(12,2),

    Quantity INT DEFAULT 0,

    Thumbnail VARCHAR(255),

    Status TINYINT DEFAULT 1,

    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(CategoryID)
    REFERENCES Categories(CategoryID),

    FOREIGN KEY(BrandID)
    REFERENCES Brands(BrandID),

    FOREIGN KEY(SupplierID)
    REFERENCES Suppliers(SupplierID)
);

CREATE TABLE ProductImages(
    ImageID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    ImageURL VARCHAR(255),

    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID)
);

CREATE TABLE Carts(
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

CREATE TABLE CartItems(
    CartItemID INT AUTO_INCREMENT PRIMARY KEY,
    CartID INT,
    ProductID INT,
    Quantity INT,

    FOREIGN KEY(CartID)
    REFERENCES Carts(CartID),

    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID)
);

CREATE TABLE Coupons(
    CouponID INT AUTO_INCREMENT PRIMARY KEY,
    CouponCode VARCHAR(50),
    DiscountPercent DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    Quantity INT
);

CREATE TABLE Orders(
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    AddressID INT,
    CouponID INT NULL,

    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    TotalAmount DECIMAL(12,2),

    PaymentMethod VARCHAR(50),

    PaymentStatus VARCHAR(30),

    ShippingStatus VARCHAR(30),

    OrderStatus VARCHAR(30),

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID),

    FOREIGN KEY(AddressID)
    REFERENCES Addresses(AddressID),

    FOREIGN KEY(CouponID)
    REFERENCES Coupons(CouponID)
);

CREATE TABLE OrderDetails(
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,

    Price DECIMAL(12,2),
    Quantity INT,
    Subtotal DECIMAL(12,2),

    FOREIGN KEY(OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID)
);

CREATE TABLE Shipments(
    ShipmentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,

    ShippingCompany VARCHAR(100),

    TrackingNumber VARCHAR(100),

    ShippingDate DATETIME,

    DeliveredDate DATETIME,

    Status VARCHAR(30),

    FOREIGN KEY(OrderID)
    REFERENCES Orders(OrderID)
);

CREATE TABLE Reviews(
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ProductID INT,

    Rating INT,

    Comment TEXT,

    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID),

    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID)
);

CREATE TABLE Posts(
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,

    Title VARCHAR(255),

    Content LONGTEXT,

    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

CREATE TABLE Comments(
    CommentID INT AUTO_INCREMENT PRIMARY KEY,
    PostID INT,
    UserID INT,

    Content TEXT,

    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(PostID)
    REFERENCES Posts(PostID),

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

CREATE TABLE Tickets(
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,

    Subject VARCHAR(255),

    Content TEXT,

    Status VARCHAR(30),

    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

CREATE TABLE Notifications(
    NotificationID INT AUTO_INCREMENT PRIMARY KEY,

    UserID INT,

    Title VARCHAR(255),

    Content TEXT,

    IsRead BOOLEAN DEFAULT FALSE,

    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

CREATE TABLE Logs(
    LogID INT AUTO_INCREMENT PRIMARY KEY,

    UserID INT,

    Action VARCHAR(255),

    LogTime DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);
