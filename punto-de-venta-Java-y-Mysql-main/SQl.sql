CREATE DATABASE abarrote;
USE ABARROTE;
 -- DROP DATABASE ABARROTE;

select * from config;

CREATE TABLE CLIENTES(
	ID INT NOT NULL,
	DNI VARCHAR(15) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    TELEFONO CHAR(10) NOT NULL,
    DIRECCION VARCHAR(20) NOT NULL
);

CREATE TABLE CONFIG(
	ID INT NOT NULL,
    RFC VARCHAR(25) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    TELEFONO CHAR(10) NOT NULL,
    DIRECCION VARCHAR(50) NOT NULL,
    MENSAJE VARCHAR(255) NOT NULL
);

drop table config;



CREATE TABLE DETALLE(
	ID INT NOT NULL,
    ID_PRO INT NOT NULL,
    CANTIDAD INT NOT NULL,
    PRECIO DECIMAL(10,2) NOT NULL,
    ID_VENTA INT NOT NULL
);

CREATE TABLE PRODUCTOS(
	ID INT NOT NULL,
    CODIGO VARCHAR(20) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    PROVEEDOR INT NOT NULL,
    STOCK INT NOT NULL,
    PRECIO DECIMAL(10,2) NOT NULL
);

CREATE TABLE PROVEEDOR(
	ID INT NOT NULL,
    RFC VARCHAR(15) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    TELEFONO CHAR(10) NOT NULL,
    DIRECCION VARCHAR(255) NOT NULL
);

CREATE TABLE USUARIOS(
	ID INT NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    CORREO VARCHAR(200) NOT NULL,
    PASS VARCHAR(50) NOT NULL,
    ROL VARCHAR(50) NOT NULL
);

INSERT INTO CONFIG VALUES(1,'NLA9912','NOELANI','4455669988','independencia','Gracias por su compra');

describe config;


INSERT INTO USUARIOS(NOMBRE,CORREO,PASS,ROL) VALUES('ESTEBAN','S19120154@alumnos.itsur.edu.mx','admin','Administrador');

CREATE TABLE VENTAS(
	ID INT NOT NULL,
    CLIENTE INT NOT NULL,
    VENDEDOR VARCHAR(60) NOT NULL,
    TOTAL DECIMAL(10,2) NOT NULL,
    FECHA VARCHAR(20) NOT NULL
);

-- ALTERS --
ALTER TABLE CLIENTES
	ADD PRIMARY KEY (ID);
    
ALTER TABLE CONFIG 
	ADD PRIMARY KEY(ID);
    
ALTER TABLE DETALLE
	ADD PRIMARY KEY(ID),
    ADD KEY ID_VENTA(ID_VENTA),
    ADD KEY ID_PRO(ID_PRO);

ALTER TABLE PRODUCTOS 
	ADD PRIMARY KEY(ID),
    ADD KEY PROVEEDOR(PROVEEDOR);
    
ALTER TABLE PROVEEDOR
		ADD PRIMARY KEY(ID);
        
ALTER TABLE USUARIOS
	ADD PRIMARY KEY(ID);
    
ALTER TABLE VENTAS
	ADD PRIMARY KEY(ID),
    ADD KEY CLIENTE(CLIENTE);
    
-- AUTO INCREMENT --
ALTER TABLE CLIENTES
	MODIFY ID INT(11) NOT NULL AUTO_INCREMENT;
    
ALTER TABLE CONFIG
	MODIFY ID INT(11) NOT NULL AUTO_INCREMENT;
    
ALTER TABLE DETALLE
	MODIFY ID INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE PRODUCTOS
	MODIFY ID INT(11) NOT NULL AUTO_INCREMENT;
    
ALTER TABLE PROVEEDOR
	MODIFY ID INT(11) NOT NULL AUTO_INCREMENT;
    
ALTER TABLE USUARIOS
	MODIFY ID INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE VENTAS
	MODIFY ID INT(11) NOT NULL AUTO_INCREMENT;
    
-- RESTRICCIONES --
ALTER TABLE DETALLE
  ADD CONSTRAINT detalle_ibfk_1 FOREIGN KEY (ID_PRO) REFERENCES PRODUCTOS (ID) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT detalle_ibfk_2 FOREIGN KEY (ID_VENTA) REFERENCES VENTAS (ID) ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE PRODUCTOS
  ADD CONSTRAINT productos_ibfk_1 FOREIGN KEY (PROVEEDOR) REFERENCES PROVEEDOR (ID) ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE VENTAS
  ADD CONSTRAINT ventas_ibfk_1 FOREIGN KEY (CLIENTE) REFERENCES CLIENTES (ID) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;


describe productos;

INSERT INTO PROVEEDOR (ID, RFC, NOMBRE, TELEFONO, DIRECCION) VALUES
(1, 'RFC001', 'Coca-Cola Company', '1234567890', '123 Main Street'),
(2, 'RFC002', 'PepsiCo Inc.', '9876543210', '456 Elm Avenue'),
(3, 'RFC003', 'Frito-Lay North America', '5551112222', '789 Oak Lane'),
(4, 'RFC004', 'Nestlé S.A.', '8887776666', '321 Pine Road'),
(5, 'RFC005', 'Unilever PLC', '9998887777', '654 Cedar Court'),
(6, 'RFC006', 'Procter & Gamble Co.', '4445556666', '987 Maple Drive'),
(7, 'RFC007', 'The Kraft Heinz Company', '2223334444', '210 Walnut Lane'),
(8, 'RFC008', 'Kellogg Company', '7778889999', '543 Cherry Street'),
(9, 'RFC009', 'Mars, Incorporated', '6665554444', '876 Birch Avenue'),
(10, 'RFC010', 'Mondelez International, Inc.', '2223334444', '579 Chestnut Road'),
(11, 'RFC011', 'Campbell Soup Company', '5554443333', '456 Sycamore Lane'),
(12, 'RFC012', 'Nestlé Waters North America', '7778889999', '321 Willow Drive'),
(13, 'RFC013', 'The Hershey Company', '8887776666', '654 Spruce Court'),
(14, 'RFC014', 'General Mills, Inc.', '1112223333', '987 Oak Street'),
(15, 'RFC015', 'Dr Pepper Snapple Group', '9998887777', '876 Elm Avenue'),
(16, 'RFC016', 'Danone S.A.', '2223334444', '543 Maple Road'),
(17, 'RFC017', 'The Coca-Cola Bottling Co.', '8887776666', '210 Pine Lane'),
(18, 'RFC018', 'Pepsi Bottling Ventures', '5554443333', '135 Walnut Street'),
(19, 'RFC019', 'Frito-Lay, Inc.', '7778889999', '864 Cedar Avenue'),
(20, 'RFC020', 'Colgate-Palmolive Company', '1112223333', '579 Cherry Lane');

-- Insertar productos ficticios
INSERT INTO PRODUCTOS (CODIGO, NOMBRE, PROVEEDOR, STOCK, PRECIO) VALUES
-- Productos para el proveedor con ID 1 (Coca-Cola Company)
('COC001', 'Refresco de cola 500ml', 1, 50, 2.99),
('COC002', 'Refresco de cola 2L', 1, 20, 5.99),
('COC003', 'Agua mineral 1L', 1, 100, 1.49),
('COC004', 'Bebida energética 250ml', 1, 30, 3.99),
('COC005', 'Jugo de naranja 1L', 1, 15, 4.49),

-- Productos para el proveedor con ID 2 (PepsiCo Inc.)
('PEP001', 'Refresco de cola 355ml', 2, 40, 1.99),
('PEP002', 'Refresco de cola 1.5L', 2, 25, 4.49),
('PEP003', 'Agua mineral con gas 500ml', 2, 80, 1.99),
('PEP004', 'Bebida energética 500ml', 2, 35, 3.99),
('PEP005', 'Papas fritas 200g', 2, 50, 2.49),

-- Productos para el proveedor con ID 3 (Frito-Lay North America)
('FLN001', 'Papas fritas sabor original 150g', 3, 60, 1.99),
('FLN002', 'Papas fritas sabor BBQ 150g', 3, 40, 1.99),
('FLN003', 'Papas fritas sabor jalapeño 150g', 3, 30, 1.99),
('FLN004', 'Tortilla chips 200g', 3, 70, 2.49),
('FLN005', 'Doritos sabor nacho 180g', 3, 55, 2.99),

-- Productos para el proveedor con ID 4 (Nestlé S.A.)
('NES001', 'Chocolate con leche 100g', 4, 75, 1.99),
('NES002', 'Barra de chocolate negro 70% cacao 50g', 4, 100, 1.49),
('NES003', 'Chicles de menta 10 unidades', 4, 200, 0.99),
('NES004', 'Leche condensada 400g', 4, 30, 2.99),
('NES005', 'Café soluble 200g', 4, 40, 4.99),

-- Productos para el proveedor con ID 5 (Unilever PLC)
('UNI001', 'Shampoo hidratante 250ml', 5, 20, 3.99),
('UNI002', 'Acondicionador suavizante 200ml', 5, 25, 4.49),
('UNI003', 'Jabón líquido corporal 500ml', 5, 30, 2.99),
('UNI004', 'Desodorante en aerosol 150ml', 5, 40, 2.99),
('UNI005', 'Crema facial humectante 50ml', 5, 15, 5.99);

-- Generar 30 datos ficticios para la tabla CLIENTES
INSERT INTO CLIENTES (DNI, NOMBRE, TELEFONO, DIRECCION) VALUES
('123456789A', 'Juan Pérez', '1234567890', 'Calle Principal 1'),
('987654321B', 'María Rodríguez', '9876543210', 'Avenida Central 5'),
('456789123C', 'Pedro Gómez', '5551112222', 'Calle Secundaria 10'),
('321654987D', 'Laura Torres', '8887776666', 'Avenida Norte 15'),
('789123456E', 'Carlos López', '9998887777', 'Calle Sur 20'),
('654321987F', 'Ana Martínez', '4445556666', 'Avenida Este 25'),
('987123654G', 'José Sánchez', '2223334444', 'Calle Oeste 30'),
('258963147H', 'Sofía Hernández', '7778889999', 'Avenida 123 35'),
('147852369I', 'Luis González', '6665554444', 'Calle 456 40'),
('369852147J', 'Lucía Ramírez', '2223334444', 'Avenida 789 45'),
('456123789K', 'Daniel Castro', '5554443333', 'Calle 123 50'),
('963258741L', 'Carolina Vargas', '7778889999', 'Avenida 456 55'),
('852741963M', 'Javier Mendoza', '8887776666', 'Calle 789 60'),
('741852963N', 'Paula Aguilar', '1112223333', 'Avenida 012 65'),
('369147852O', 'Andrés Ríos', '9998887777', 'Calle 345 70'),
('951753852P', 'Valentina Silva', '2223334444', 'Avenida 678 75'),
('753951852Q', 'Miguel Varela', '8887776666', 'Calle 901 80'),
('258369147R', 'Fernanda Paredes', '5554443333', 'Avenida 234 85'),
('147852369S', 'Gabriel Rojas', '7778889999', 'Calle 567 90'),
('654789123T', 'Mariana Rivas', '1112223333', 'Avenida 890 95'),
('852963741U', 'Diego Medina', '9998887777', 'Calle 1234 100'),
('369852741V', 'Alejandra Peña', '2223334444', 'Avenida 5678 105'),
('741369852W', 'Óscar Cordero', '8887776666', 'Calle 9012 110'),
('963852741X', 'Isabella León', '5554443333', 'Avenida 3456 115'),
('123987456Y', 'Mateo Contreras', '7778889999', 'Calle 7890 120'),
('987321654Z', 'Camila Cruz', '1112223333', 'Avenida 0123 125'),
('258741963AA', 'Emilio Ortega', '9998887777', 'Calle 3456 130'),
('456987123BB', 'Daniela Mora', '2223334444', 'Avenida 6789 135'),
('789321654CC', 'Sebastián Cárdenas', '8887776666', 'Calle 9012 140'),
('963147852DD', 'Valeria Escobar', '5554443333', 'Avenida 2345 145');


describe clientes;
select * from clientes;