CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,            -- Mã sản phẩm, khóa chính, tự động tăng
    product_name VARCHAR(255) NOT NULL,                    -- Tên sản phẩm
    short_description TEXT,                                -- Mô tả ngắn gọn về sản phẩm
    full_description TEXT,                                 -- Mô tả chi tiết về sản phẩm
    price DECIMAL(10, 2) NOT NULL,                         -- Giá sản phẩm (2 chữ số sau dấu thập phân)
    image_url VARCHAR(255),                                -- Đường dẫn tới hình ảnh sản phẩm
    weight DECIMAL(10, 2),                                 -- Trọng lượng sản phẩm
    dimensions VARCHAR(255),                               -- Kích thước sản phẩm (Ví dụ: chiều dài, chiều rộng, chiều cao)
    category_id INT,                                       -- Mã danh mục sản phẩm (liên kết với bảng danh mục)
    brand_id INT,                                          -- Mã thương hiệu (liên kết với bảng thương hiệu)
    quantity_in_stock INT DEFAULT 0,                       -- Số lượng sản phẩm còn lại trong kho
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,        -- Thời gian tạo sản phẩm
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Thời gian cập nhật thông tin sản phẩm
    warranty_info TEXT,                                    -- Thông tin bảo hành sản phẩm
    payment_methods VARCHAR(255),                          -- Các phương thức thanh toán (ví dụ: thẻ tín dụng, chuyển khoản, COD)
    status ENUM('active', 'inactive', 'out_of_stock') DEFAULT 'active', -- Tình trạng sản phẩm (có thể là hoạt động, không hoạt động, hết hàng)
    shipping_info TEXT                                     -- Thông tin vận chuyển (ví dụ: thời gian giao hàng, phương thức vận chuyển)
);

-- Tạo bảng danh mục sản phẩm
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,            -- Mã danh mục
    category_name VARCHAR(255) NOT NULL,                    -- Tên danh mục
    description TEXT                                        -- Mô tả danh mục
);

-- Tạo bảng thương hiệu
CREATE TABLE brands (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,               -- Mã thương hiệu
    brand_name VARCHAR(255) NOT NULL,                       -- Tên thương hiệu
    brand_description TEXT                                  -- Mô tả thương hiệu
);

-- Tạo bảng đánh giá sản phẩm (nếu có)
CREATE TABLE product_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,              -- Mã đánh giá
    product_id INT,                                         -- Mã sản phẩm (liên kết với bảng products)
    user_id INT,                                            -- Mã người dùng (liên kết với bảng users)
    rating INT,                                             -- Đánh giá (ví dụ: 1 đến 5 sao)
    review_text TEXT,                                       -- Nội dung đánh giá
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,        -- Ngày đánh giá
    FOREIGN KEY (product_id) REFERENCES products(product_id), -- Liên kết với bảng sản phẩm
    FOREIGN KEY (user_id) REFERENCES users(user_id)        -- Liên kết với bảng người dùng
);




-- Thêm sản phẩm vào bảng products

-- Sản phẩm điện thoại iPhone 15 Pro
INSERT INTO products (product_name, short_description, full_description, price, image_url, weight, dimensions, category_id, brand_id, quantity_in_stock, warranty_info, payment_methods, status, shipping_info)
VALUES
('iPhone 15 Pro', 
 'Smartphone cao cấp của Apple với hiệu suất mạnh mẽ và camera 48MP.',
 'iPhone 15 Pro với màn hình 6.1 inch, chip A17 Pro, camera 48MP, và khả năng hỗ trợ 5G. Thiết kế sang trọng với chất liệu titanium.',
 999.99, 
 'https://example.com/images/iphone_15_pro.jpg', 
 0.204, 
 '146.7 x 71.5 x 7.65 mm', 
 1, 
 1, 
 50, 
 '1 năm bảo hành chính hãng', 
 'Thẻ tín dụng, chuyển khoản, COD', 
 'active', 
 'Giao hàng nhanh trong 3-5 ngày');

-- Sản phẩm điện thoại Samsung Galaxy S23
INSERT INTO products (product_name, short_description, full_description, price, image_url, weight, dimensions, category_id, brand_id, quantity_in_stock, warranty_info, payment_methods, status, shipping_info)
VALUES
('Samsung Galaxy S23', 
 'Điện thoại flagship của Samsung với màn hình AMOLED 120Hz và camera 200MP.',
 'Samsung Galaxy S23 trang bị màn hình Dynamic AMOLED 120Hz, chip Snapdragon 8 Gen 2, và camera 200MP với khả năng zoom quang 10x.',
 899.99, 
 'https://example.com/images/galaxy_s23.jpg', 
 0.169, 
 '146.3 x 70.9 x 7.6 mm', 
 1, 
 2,
 40, 
 '1 năm bảo hành chính hãng', 
 'Thẻ tín dụng, chuyển khoản, COD', 
 'active', 
 'Giao hàng nhanh trong 3-5 ngày');

-- Sản phẩm TV LG OLED C2 55 inch
INSERT INTO products (product_name, short_description, full_description, price, image_url, weight, dimensions, category_id, brand_id, quantity_in_stock, warranty_info, payment_methods, status, shipping_info)
VALUES
('LG OLED C2 55 inch', 
 'TV OLED siêu mỏng, chất lượng hình ảnh sắc nét với độ phân giải 4K.',
 'LG OLED C2 55 inch với công nghệ OLED Evo, hỗ trợ Dolby Vision và HDR10+, mang lại trải nghiệm xem tuyệt vời với hình ảnh sắc nét và màu sắc chân thực.',
 1499.99, 
 'https://example.com/images/lg_oled_c2.jpg', 
 18.5, 
 '1229 x 706 x 47 mm', 
 2,
 3, 
 30, 
 '2 năm bảo hành', 
 'Thẻ tín dụng, chuyển khoản, COD', 
 'active', 
 'Giao hàng miễn phí trong 5-7 ngày');

-- Sản phẩm TV Samsung QN90B Neo QLED 65 inch
INSERT INTO products (product_name, short_description, full_description, price, image_url, weight, dimensions, category_id, brand_id, quantity_in_stock, warranty_info, payment_methods, status, shipping_info)
VALUES
('Samsung QN90B Neo QLED 65 inch', 
 'TV QLED 4K với công nghệ Neo Quantum Processor 4K và âm thanh Dolby Atmos.',
 'Samsung QN90B 65 inch sử dụng công nghệ Neo QLED, với độ sáng vượt trội và màu đen sâu thẳm. Hỗ trợ Dolby Atmos mang đến âm thanh vòm sống động.',
 2199.99, 
 'https://example.com/images/samsung_qn90b.jpg', 
 25.5, 
 '1440 x 833.5 x 29.3 mm', 
 2, 
 2, 
 20, 
 '3 năm bảo hành', 
 'Thẻ tín dụng, chuyển khoản, COD', 
 'active', 
 'Giao hàng miễn phí trong 5-7 ngày');

-- Sản phẩm máy tính Apple MacBook Pro 16 inch M2 Pro
INSERT INTO products (product_name, short_description, full_description, price, image_url, weight, dimensions, category_id, brand_id, quantity_in_stock, warranty_info, payment_methods, status, shipping_info)
VALUES
('Apple MacBook Pro 16 inch M2 Pro', 
 'Laptop cao cấp với chip M2 Pro, màn hình Retina sắc nét và hiệu suất mạnh mẽ.',
 'MacBook Pro 16 inch với chip M2 Pro, màn hình Liquid Retina XDR, bộ nhớ 16GB và ổ SSD 512GB. Thiết kế mỏng nhẹ nhưng mạnh mẽ, phù hợp cho công việc chuyên nghiệp.',
 2499.99, 
 'https://example.com/images/macbook_pro_16.jpg', 
 2.1, 
 '355.7 x 247.6 x 16.8 mm', 
 3,
 1,
 25,
 '1 năm bảo hành chính hãng', 
 'Thẻ tín dụng, chuyển khoản, COD', 
 'active', 
 'Giao hàng miễn phí trong 5-7 ngày');



-- Thêm dữ liệu vào bảng brands (Thương hiệu)
INSERT INTO brands (brand_name, brand_description) VALUES
('Apple', 'Apple Inc. là công ty công nghệ nổi tiếng của Mỹ, với các sản phẩm như iPhone, MacBook, iPad, và Apple Watch.'),
('Samsung', 'Samsung Electronics là một tập đoàn đa quốc gia, nổi bật với các sản phẩm điện tử như điện thoại, TV, và thiết bị gia dụng.'),
('LG', 'LG Electronics là một công ty điện tử lớn của Hàn Quốc, nổi bật với các sản phẩm TV OLED, điện thoại, và thiết bị gia dụng.');




-- Thêm dữ liệu vào bảng categories (Danh mục)
INSERT INTO categories (category_name, description) VALUES
('Phones', 'Điện thoại di động, smartphone các loại.'),
('Television', 'Các loại TV, màn hình lớn, chất lượng hình ảnh cao.'),
('Computer', 'Máy tính bàn, laptop, máy tính xách tay và phụ kiện.');
