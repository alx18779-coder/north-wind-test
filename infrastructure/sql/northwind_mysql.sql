-- Auto-converted from northwind_pg.sql to MySQL dialect
SET FOREIGN_KEY_CHECKS=0;
--
-- PostgreSQL database dump
--







---
--- drop tables
---


DROP TABLE IF EXISTS customer_customer_demo;
DROP TABLE IF EXISTS customer_demographics;
DROP TABLE IF EXISTS employee_territories;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shippers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS territories;
DROP TABLE IF EXISTS us_states;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS employees;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories (
    category_id smallint NOT NULL,
    category_name character varying(VARCHAR5) NOT NULL,
    description text,
    picture bytea
);


--
-- Name: customer_customer_demo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customer_customer_demo (
    customer_id character varying(5) NOT NULL,
    customer_type_id character varying(5) NOT NULL
);


--
-- Name: customer_demographics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customer_demographics (
    customer_type_id character varying(5) NOT NULL,
    customer_desc text
);


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customers (
    customer_id character varying(5) NOT NULL,
    company_name character varying(4BLOB) NOT NULL,
    contact_name character varying(3BLOB),
    contact_title character varying(3BLOB),
    address character varying(6BLOB),
    city character varying(VARCHAR5),
    region character varying(VARCHAR5),
    postal_code character varying(VARCHARBLOB),
    country character varying(VARCHAR5),
    phone character varying(24),
    fax character varying(24)
);


--
-- Name: employees; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE employees (
    employee_id smallint NOT NULL,
    last_name character varying(2BLOB) NOT NULL,
    first_name character varying(VARCHARBLOB) NOT NULL,
    title character varying(3BLOB),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(6BLOB),
    city character varying(VARCHAR5),
    region character varying(VARCHAR5),
    postal_code character varying(VARCHARBLOB),
    country character varying(VARCHAR5),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255)
);


--
-- Name: employee_territories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE employee_territories (
    employee_id smallint NOT NULL,
    territory_id character varying(2BLOB) NOT NULL
);




--
-- Name: order_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE order_details (
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    order_id smallint NOT NULL,
    customer_id character varying(5),
    employee_id smallint,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via smallint,
    freight real,
    ship_name character varying(4BLOB),
    ship_address character varying(6BLOB),
    ship_city character varying(VARCHAR5),
    ship_region character varying(VARCHAR5),
    ship_postal_code character varying(VARCHARBLOB),
    ship_country character varying(VARCHAR5)
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    product_id smallint NOT NULL,
    product_name character varying(4BLOB) NOT NULL,
    supplier_id smallint,
    category_id smallint,
    quantity_per_unit character varying(2BLOB),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL
);


--
-- Name: region; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE region (
    region_id smallint NOT NULL,
    region_description character varying(6BLOB) NOT NULL
);


--
-- Name: shippers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shippers (
    shipper_id smallint NOT NULL,
    company_name character varying(4BLOB) NOT NULL,
    phone character varying(24)
);



--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE suppliers (
    supplier_id smallint NOT NULL,
    company_name character varying(4BLOB) NOT NULL,
    contact_name character varying(3BLOB),
    contact_title character varying(3BLOB),
    address character varying(6BLOB),
    city character varying(VARCHAR5),
    region character varying(VARCHAR5),
    postal_code character varying(VARCHARBLOB),
    country character varying(VARCHAR5),
    phone character varying(24),
    fax character varying(24),
    homepage text
);


--
-- Name: territories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE territories (
    territory_id character varying(2BLOB) NOT NULL,
    territory_description character varying(6BLOB) NOT NULL,
    region_id smallint NOT NULL
);


--
-- Name: us_states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE us_states (
    state_id smallint NOT NULL,
    state_name character varying(VARCHARBLOBBLOB),
    state_abbr character varying(2),
    state_region character varying(5BLOB)
);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO categories VALUES (1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales', 'NULL');
INSERT INTO categories VALUES (2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', 'NULL');
INSERT INTO categories VALUES (3, 'Confections', 'Desserts, candies, and sweet breads', 'NULL');
INSERT INTO categories VALUES (4, 'Dairy Products', 'Cheeses', 'NULL');
INSERT INTO categories VALUES (5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal', 'NULL');
INSERT INTO categories VALUES (6, 'Meat/Poultry', 'Prepared meats', 'NULL');
INSERT INTO categories VALUES (7, 'Produce', 'Dried fruit and bean curd', 'NULL');
INSERT INTO categories VALUES (8, 'Seafood', 'Seaweed and fish', 'NULL');


--
-- Data for Name: customer_customer_demo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customer_demographics; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO customers VALUES ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '122VARCHAR9', 'Germany', 'VARCHAR3VARCHAR-VARCHARVARCHAR74321', 'VARCHAR3VARCHAR-VARCHARVARCHAR76545');
INSERT INTO customers VALUES ('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', NULL, 'VARCHAR5VARCHAR21', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO customers VALUES ('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'México D.F.', NULL, 'VARCHAR5VARCHAR23', 'Mexico', '(5) 555-3932', NULL);
INSERT INTO customers VALUES ('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '12VARCHAR Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-675VARCHAR');
INSERT INTO customers VALUES ('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Order Administrator', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'VARCHAR921-12 34 65', 'VARCHAR921-12 34 67');
INSERT INTO customers VALUES ('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '683VARCHAR6', 'Germany', 'VARCHAR621-VARCHAR846VARCHAR', 'VARCHAR621-VARCHAR8924');
INSERT INTO customers VALUES ('BLONP', 'Blondesddsl père et fils', 'Frédérique Citeaux', 'Marketing Manager', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France', '88.6VARCHAR.15.31', '88.6VARCHAR.15.32');
INSERT INTO customers VALUES ('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28VARCHAR23', 'Spain', '(91) 555 22 82', '(91) 555 91 99');
INSERT INTO customers VALUES ('BONAP', 'Bon app''', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France', '91.24.45.4VARCHAR', '91.24.45.41');
INSERT INTO customers VALUES ('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(6VARCHAR4) 555-4729', '(6VARCHAR4) 555-3745');
INSERT INTO customers VALUES ('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212', NULL);
INSERT INTO customers VALUES ('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina', '(1) 135-5555', '(1) 135-4892');
INSERT INTO customers VALUES ('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'México D.F.', NULL, 'VARCHAR5VARCHAR22', 'Mexico', '(5) 555-3392', '(5) 555-7293');
INSERT INTO customers VALUES ('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', NULL, '3VARCHAR12', 'Switzerland', 'VARCHAR452-VARCHAR76545', NULL);
INSERT INTO customers VALUES ('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', 'VARCHAR5432-VARCHAR43', 'Brazil', '(11) 555-7647', NULL);
INSERT INTO customers VALUES ('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199');
INSERT INTO customers VALUES ('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52VARCHAR66', 'Germany', 'VARCHAR241-VARCHAR39123', 'VARCHAR241-VARCHAR59428');
INSERT INTO customers VALUES ('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', NULL, '44VARCHARVARCHARVARCHAR', 'France', '4VARCHAR.67.88.88', '4VARCHAR.67.89.89');
INSERT INTO customers VALUES ('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-VARCHAR297', '(171) 555-3373');
INSERT INTO customers VALUES ('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria', '7675-3425', '7675-3426');
INSERT INTO customers VALUES ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Orós, 92', 'Sao Paulo', 'SP', 'VARCHAR5442-VARCHAR3VARCHAR', 'Brazil', '(11) 555-9857', NULL);
INSERT INTO customers VALUES ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28VARCHAR34', 'Spain', '(91) 555 94 44', '(91) 555 55 93');
INSERT INTO customers VALUES ('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Assistant Sales Agent', '184, chaussée de Tournai', 'Lille', NULL, '59VARCHARVARCHARVARCHAR', 'France', '2VARCHAR.16.1VARCHAR.16', '2VARCHAR.16.1VARCHAR.17');
INSERT INTO customers VALUES ('FOLKO', 'Folk och fä HB', 'Maria Larsson', 'Owner', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'VARCHAR695-34 67 21', NULL);
INSERT INTO customers VALUES ('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany', 'VARCHAR89-VARCHAR87731VARCHAR', 'VARCHAR89-VARCHAR877451');
INSERT INTO customers VALUES ('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', NULL, '44VARCHARVARCHARVARCHAR', 'France', '4VARCHAR.32.21.21', '4VARCHAR.32.21.2VARCHAR');
INSERT INTO customers VALUES ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', NULL, '1VARCHAR1VARCHARVARCHAR', 'Italy', 'VARCHAR11-498826VARCHAR', 'VARCHAR11-4988261');
INSERT INTO customers VALUES ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535');
INSERT INTO customers VALUES ('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Cataluña, 23', 'Barcelona', NULL, 'VARCHAR8VARCHAR22', 'Spain', '(93) 2VARCHAR3 456VARCHAR', '(93) 2VARCHAR3 4561');
INSERT INTO customers VALUES ('GODOS', 'Godos Cocina Típica', 'José Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain', '(95) 555 82 82', NULL);
INSERT INTO customers VALUES ('GOURL', 'Gourmet Lanchonetes', 'André Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil', '(11) 555-9482', NULL);
INSERT INTO customers VALUES ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA', '(5VARCHAR3) 555-7555', NULL);
INSERT INTO customers VALUES ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1VARCHAR81', 'Venezuela', '(2) 283-2951', '(2) 283-3397');
INSERT INTO customers VALUES ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil', '(21) 555-VARCHARVARCHAR91', '(21) 555-8765');
INSERT INTO customers VALUES ('HILAA', 'HILARION-Abastos', 'Carlos Hernández', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela', '(5) 555-134VARCHAR', '(5) 555-1948');
INSERT INTO customers VALUES ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(5VARCHAR3) 555-6874', '(5VARCHAR3) 555-2376');
INSERT INTO customers VALUES ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333');
INSERT INTO customers VALUES ('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL);
INSERT INTO customers VALUES ('KOENE', 'Königlich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany', 'VARCHAR555-VARCHAR9876', NULL);
INSERT INTO customers VALUES ('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de l''Europe', 'Versailles', NULL, '78VARCHARVARCHARVARCHAR', 'France', '3VARCHAR.59.84.1VARCHAR', '3VARCHAR.59.85.11');
INSERT INTO customers VALUES ('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France', '61.77.61.1VARCHAR', '61.77.61.11');
INSERT INTO customers VALUES ('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '19VARCHARVARCHAR Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(6VARCHAR4) 555-3392', '(6VARCHAR4) 555-7293');
INSERT INTO customers VALUES ('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(5VARCHAR9) 555-7969', '(5VARCHAR9) 555-6221');
INSERT INTO customers VALUES ('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany', 'VARCHAR69-VARCHAR245984', 'VARCHAR69-VARCHAR245874');
INSERT INTO customers VALUES ('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', NULL);
INSERT INTO customers VALUES ('LILAS', 'LILA-Supermercado', 'Carlos González', 'Accounting Manager', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela', '(9) 331-6954', '(9) 331-7256');
INSERT INTO customers VALUES ('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93');
INSERT INTO customers VALUES ('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(5VARCHAR3) 555-9573', '(5VARCHAR3) 555-9646');
INSERT INTO customers VALUES ('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy', 'VARCHAR35-64VARCHAR23VARCHAR', 'VARCHAR35-64VARCHAR231');
INSERT INTO customers VALUES ('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-118VARCHAR', 'Belgium', '(VARCHAR2) 2VARCHAR1 24 67', '(VARCHAR2) 2VARCHAR1 24 68');
INSERT INTO customers VALUES ('MEREP', 'Mère Paillarde', 'Jean Fresnière', 'Marketing Assistant', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-8VARCHAR54', '(514) 555-8VARCHAR55');
INSERT INTO customers VALUES ('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig', NULL, 'VARCHAR4179', 'Germany', 'VARCHAR342-VARCHAR23176', NULL);
INSERT INTO customers VALUES ('NORTS', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 3VARCHARVARCHAR Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-253VARCHAR');
INSERT INTO customers VALUES ('OCEAN', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 2VARCHAR-A', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina', '(1) 135-5333', '(1) 135-5535');
INSERT INTO customers VALUES ('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA', '(9VARCHAR7) 555-7584', '(9VARCHAR7) 555-288VARCHAR');
INSERT INTO customers VALUES ('OTTIK', 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany', 'VARCHAR221-VARCHAR644327', 'VARCHAR221-VARCHAR765721');
INSERT INTO customers VALUES ('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Owner', '265, boulevard Charonne', 'Paris', NULL, '75VARCHAR12', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77');
INSERT INTO customers VALUES ('PERIC', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico', '(5) 552-3745', '(5) 545-3745');
INSERT INTO customers VALUES ('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria', '6562-9722', '6562-9723');
INSERT INTO customers VALUES ('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL);
INSERT INTO customers VALUES ('QUEDE', 'Que Delícia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545');
INSERT INTO customers VALUES ('QUEEN', 'Queen Cozinha', 'Lúcia Carvalho', 'Marketing Assistant', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil', '(11) 555-1189', NULL);
INSERT INTO customers VALUES ('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany', 'VARCHAR372-VARCHAR35188', NULL);
INSERT INTO customers VALUES ('RANCH', 'Rancho grande', 'Sergio Gutiérrez', 'Sales Representative', 'Av. del Libertador 9VARCHARVARCHAR', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina', '(1) 123-5555', '(1) 123-5556');
INSERT INTO customers VALUES ('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA', '(5VARCHAR5) 555-5939', '(5VARCHAR5) 555-362VARCHAR');
INSERT INTO customers VALUES ('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy', 'VARCHAR522-556721', 'VARCHAR522-556722');
INSERT INTO customers VALUES ('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil', '(21) 555-3412', NULL);
INSERT INTO customers VALUES ('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'Genève', NULL, '12VARCHAR3', 'Switzerland', 'VARCHAR897-VARCHAR34214', NULL);
INSERT INTO customers VALUES ('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran Vía, 1', 'Madrid', NULL, '28VARCHARVARCHAR1', 'Spain', '(91) 745 62VARCHARVARCHAR', '(91) 745 621VARCHAR');
INSERT INTO customers VALUES ('SANTG', 'Santé Gourmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern', NULL, '411VARCHAR', 'Norway', 'VARCHAR7-98 92 35', 'VARCHAR7-98 92 47');
INSERT INTO customers VALUES ('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA', '(2VARCHAR8) 555-8VARCHAR97', NULL);
INSERT INTO customers VALUES ('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646');
INSERT INTO customers VALUES ('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Owner', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', '31 12 34 56', '31 13 35 57');
INSERT INTO customers VALUES ('SPECD', 'Spécialités du monde', 'Dominique Perrier', 'Marketing Manager', '25, rue Lauriston', 'Paris', NULL, '75VARCHAR16', 'France', '(1) 47.55.6VARCHAR.1VARCHAR', '(1) 47.55.6VARCHAR.2VARCHAR');
INSERT INTO customers VALUES ('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA', '(3VARCHAR7) 555-468VARCHAR', '(3VARCHAR7) 555-6525');
INSERT INTO customers VALUES ('SUPRD', 'Suprêmes délices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium', '(VARCHAR71) 23 67 22 2VARCHAR', '(VARCHAR71) 23 67 22 21');
INSERT INTO customers VALUES ('THEBI', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '972VARCHAR1', 'USA', '(5VARCHAR3) 555-3612', NULL);
INSERT INTO customers VALUES ('THECR', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '598VARCHAR1', 'USA', '(4VARCHAR6) 555-5834', '(4VARCHAR6) 555-8VARCHAR83');
INSERT INTO customers VALUES ('TOMSP', 'Toms Spezialitäten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'Münster', NULL, '44VARCHAR87', 'Germany', 'VARCHAR251-VARCHAR31259', 'VARCHAR251-VARCHAR35695');
INSERT INTO customers VALUES ('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico', '(5) 555-2933', NULL);
INSERT INTO customers VALUES ('TRADH', 'Tradição Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', 'VARCHAR5634-VARCHAR3VARCHAR', 'Brazil', '(11) 555-2167', '(11) 555-2168');
INSERT INTO customers VALUES ('TRAIH', 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98VARCHAR34', 'USA', '(2VARCHAR6) 555-8257', '(2VARCHAR6) 555-2174');
INSERT INTO customers VALUES ('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark', '86 21 32 43', '86 22 33 44');
INSERT INTO customers VALUES ('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France', '78.32.54.86', '78.32.54.87');
INSERT INTO customers VALUES ('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de l''Abbaye', 'Reims', NULL, '511VARCHARVARCHAR', 'France', '26.47.15.1VARCHAR', '26.47.15.11');
INSERT INTO customers VALUES ('WANDK', 'Die Wandernde Kuh', 'Rita Müller', 'Sales Representative', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany', 'VARCHAR711-VARCHAR2VARCHAR361', 'VARCHAR711-VARCHAR35428');
INSERT INTO customers VALUES ('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland', '981-443655', '981-443655');
INSERT INTO customers VALUES ('WELLI', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil', '(14) 555-8122', NULL);
INSERT INTO customers VALUES ('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Owner', '3VARCHAR5 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(2VARCHAR6) 555-4112', '(2VARCHAR6) 555-4115');
INSERT INTO customers VALUES ('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki', NULL, '2124VARCHAR', 'Finland', '9VARCHAR-224 8858', '9VARCHAR-224 8858');
INSERT INTO customers VALUES ('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa', NULL, 'VARCHAR1-VARCHAR12', 'Poland', '(26) 642-7VARCHAR12', '(26) 642-7VARCHAR12');


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO employees VALUES (1, 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-VARCHAR8', '1992-VARCHAR5-VARCHAR1', '5VARCHAR7 - 2VARCHARth Ave. E.\nApt. 2A', 'Seattle', 'WA', '98122', 'USA', '(2VARCHAR6) 555-9857', '5467', 'NULL', 'Education includes a BA in psychology from Colorado State University in 197VARCHAR.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (2, 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-VARCHAR2-19', '1992-VARCHAR8-14', '9VARCHAR8 W. Capital Way', 'Tacoma', 'WA', '984VARCHAR1', 'USA', '(2VARCHAR6) 555-9482', '3457', 'NULL', 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', NULL, 'http://accweb/emmployees/fuller.bmp');
INSERT INTO employees VALUES (3, 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-VARCHAR8-3VARCHAR', '1992-VARCHAR4-VARCHAR1', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98VARCHAR33', 'USA', '(2VARCHAR6) 555-3412', '3355', 'NULL', 'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2, 'http://accweb/emmployees/leverling.bmp');
INSERT INTO employees VALUES (4, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-VARCHAR9-19', '1993-VARCHAR5-VARCHAR3', '411VARCHAR Old Redmond Rd.', 'Redmond', 'WA', '98VARCHAR52', 'USA', '(2VARCHAR6) 555-8122', '5176', 'NULL', 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', 2, 'http://accweb/emmployees/peacock.bmp');
INSERT INTO employees VALUES (5, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-VARCHAR3-VARCHAR4', '1993-1VARCHAR-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', 'NULL', 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management.  He is fluent in French.', 2, 'http://accweb/emmployees/buchanan.bmp');
INSERT INTO employees VALUES (6, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-VARCHAR7-VARCHAR2', '1993-1VARCHAR-17', 'Coventry House\nMiner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428', 'NULL', 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (7, 'King', 'Robert', 'Sales Representative', 'Mr.', '196VARCHAR-VARCHAR5-29', '1994-VARCHAR1-VARCHAR2', 'Edgeham Hollow\nWinchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', 'NULL', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled Selling in Europe, he was transferred to the London office in March 1993.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (8, 'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-VARCHAR1-VARCHAR9', '1994-VARCHAR3-VARCHAR5', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '981VARCHAR5', 'USA', '(2VARCHAR6) 555-1189', '2344', 'NULL', 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (9, 'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-VARCHAR1-27', '1994-11-15', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452', 'NULL', 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', 5, 'http://accweb/emmployees/davolio.bmp');


--
-- Data for Name: employee_territories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO employee_territories VALUES (1, 'VARCHAR6897');
INSERT INTO employee_territories VALUES (1, '19713');
INSERT INTO employee_territories VALUES (2, 'VARCHAR1581');
INSERT INTO employee_territories VALUES (2, 'VARCHAR173VARCHAR');
INSERT INTO employee_territories VALUES (2, 'VARCHAR1833');
INSERT INTO employee_territories VALUES (2, 'VARCHAR2116');
INSERT INTO employee_territories VALUES (2, 'VARCHAR2139');
INSERT INTO employee_territories VALUES (2, 'VARCHAR2184');
INSERT INTO employee_territories VALUES (2, '4VARCHAR222');
INSERT INTO employee_territories VALUES (3, '3VARCHAR346');
INSERT INTO employee_territories VALUES (3, '314VARCHAR6');
INSERT INTO employee_territories VALUES (3, '32859');
INSERT INTO employee_territories VALUES (3, '336VARCHAR7');
INSERT INTO employee_territories VALUES (4, '2VARCHAR852');
INSERT INTO employee_territories VALUES (4, '274VARCHAR3');
INSERT INTO employee_territories VALUES (4, '27511');
INSERT INTO employee_territories VALUES (5, 'VARCHAR29VARCHAR3');
INSERT INTO employee_territories VALUES (5, 'VARCHAR796VARCHAR');
INSERT INTO employee_territories VALUES (5, 'VARCHAR8837');
INSERT INTO employee_territories VALUES (5, '1VARCHARVARCHAR19');
INSERT INTO employee_territories VALUES (5, '1VARCHARVARCHAR38');
INSERT INTO employee_territories VALUES (5, '11747');
INSERT INTO employee_territories VALUES (5, '1445VARCHAR');
INSERT INTO employee_territories VALUES (6, '85VARCHAR14');
INSERT INTO employee_territories VALUES (6, '85251');
INSERT INTO employee_territories VALUES (6, '98VARCHARVARCHAR4');
INSERT INTO employee_territories VALUES (6, '98VARCHAR52');
INSERT INTO employee_territories VALUES (6, '981VARCHAR4');
INSERT INTO employee_territories VALUES (7, '6VARCHAR179');
INSERT INTO employee_territories VALUES (7, '6VARCHAR6VARCHAR1');
INSERT INTO employee_territories VALUES (7, '8VARCHAR2VARCHAR2');
INSERT INTO employee_territories VALUES (7, '8VARCHAR9VARCHAR9');
INSERT INTO employee_territories VALUES (7, '9VARCHAR4VARCHAR5');
INSERT INTO employee_territories VALUES (7, '94VARCHAR25');
INSERT INTO employee_territories VALUES (7, '941VARCHAR5');
INSERT INTO employee_territories VALUES (7, '95VARCHARVARCHAR8');
INSERT INTO employee_territories VALUES (7, '95VARCHAR54');
INSERT INTO employee_territories VALUES (7, '95VARCHAR6VARCHAR');
INSERT INTO employee_territories VALUES (8, '19428');
INSERT INTO employee_territories VALUES (8, '44122');
INSERT INTO employee_territories VALUES (8, '45839');
INSERT INTO employee_territories VALUES (8, '534VARCHAR4');
INSERT INTO employee_territories VALUES (9, 'VARCHAR3VARCHAR49');
INSERT INTO employee_territories VALUES (9, 'VARCHAR38VARCHAR1');
INSERT INTO employee_territories VALUES (9, '48VARCHAR75');
INSERT INTO employee_territories VALUES (9, '48VARCHAR84');
INSERT INTO employee_territories VALUES (9, '483VARCHAR4');
INSERT INTO employee_territories VALUES (9, '55113');
INSERT INTO employee_territories VALUES (9, '55439');


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO order_details VALUES (1VARCHAR248, 11, 14, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR248, 42, 9.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR248, 72, 34.7999992, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR249, 14, 18.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR249, 51, 42.4VARCHARVARCHARVARCHARVARCHAR15, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR25VARCHAR, 41, 7.69999981, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR25VARCHAR, 51, 42.4VARCHARVARCHARVARCHARVARCHAR15, 35, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR25VARCHAR, 65, 16.7999992, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR251, 22, 16.7999992, 6, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR251, 57, 15.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR251, 65, 16.7999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR252, 2VARCHAR, 64.8VARCHARVARCHARVARCHARVARCHAR31, 4VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR252, 33, 2, 25, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR252, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR253, 31, 1VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR253, 39, 14.3999996, 42, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR253, 49, 16, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR254, 24, 3.5999999, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR254, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 21, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR254, 74, 8, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR255, 2, 15.1999998, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR255, 16, 13.8999996, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR255, 36, 15.1999998, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR255, 59, 44, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR256, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR256, 77, 1VARCHAR.3999996, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR257, 27, 35.VARCHAR999985, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR257, 39, 14.3999996, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR257, 77, 1VARCHAR.3999996, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR258, 2, 15.1999998, 5VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR258, 5, 17, 65, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR258, 32, 25.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 6, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR259, 21, 8, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR259, 37, 2VARCHAR.7999992, 1, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR26VARCHAR, 41, 7.69999981, 16, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR26VARCHAR, 57, 15.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR26VARCHAR, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR26VARCHAR, 7VARCHAR, 12, 21, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR261, 21, 8, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR261, 35, 14.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR262, 5, 17, 12, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR262, 7, 24, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR262, 56, 3VARCHAR.3999996, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR263, 16, 13.8999996, 6VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR263, 24, 3.5999999, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR263, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 6VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR263, 74, 8, 36, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR264, 2, 15.1999998, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR264, 41, 7.69999981, 25, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR265, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR265, 7VARCHAR, 12, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR266, 12, 3VARCHAR.3999996, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR267, 4VARCHAR, 14.6999998, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR267, 59, 44, 7VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR267, 76, 14.3999996, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR268, 29, 99, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR268, 72, 27.7999992, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR269, 33, 2, 6VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR269, 72, 27.7999992, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR27VARCHAR, 36, 15.1999998, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR27VARCHAR, 43, 36.7999992, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR271, 33, 2, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR272, 2VARCHAR, 64.8VARCHARVARCHARVARCHARVARCHAR31, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR272, 31, 1VARCHAR, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR272, 72, 27.7999992, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR273, 1VARCHAR, 24.7999992, 24, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR273, 31, 1VARCHAR, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR273, 33, 2, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR273, 4VARCHAR, 14.6999998, 6VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR273, 76, 14.3999996, 33, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR274, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR274, 72, 27.7999992, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR275, 24, 3.5999999, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR275, 59, 44, 6, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR276, 1VARCHAR, 24.7999992, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR276, 13, 4.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR277, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR277, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR278, 44, 15.5, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR278, 59, 44, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR278, 63, 35.VARCHAR999985, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR278, 73, 12, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR279, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR28VARCHAR, 24, 3.5999999, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR28VARCHAR, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR28VARCHAR, 75, 6.19999981, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR281, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 1, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR281, 24, 3.5999999, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR281, 35, 14.3999996, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR282, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR282, 57, 15.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR283, 15, 12.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR283, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR283, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR283, 72, 27.7999992, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR284, 27, 35.VARCHAR999985, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR284, 44, 15.5, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR284, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR284, 67, 11.1999998, 5, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR285, 1, 14.3999996, 45, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR285, 4VARCHAR, 14.6999998, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR285, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 36, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR286, 35, 14.3999996, 1VARCHARVARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR286, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR287, 16, 13.8999996, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR287, 34, 11.1999998, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR287, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR288, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR288, 68, 1VARCHAR, 3, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR289, 3, 8, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR289, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR29VARCHAR, 5, 17, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR29VARCHAR, 29, 99, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR29VARCHAR, 49, 16, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR29VARCHAR, 77, 1VARCHAR.3999996, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR291, 13, 4.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR291, 44, 15.5, 24, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR291, 51, 42.4VARCHARVARCHARVARCHARVARCHAR15, 2, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR292, 2VARCHAR, 64.8VARCHARVARCHARVARCHARVARCHAR31, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR293, 18, 5VARCHAR, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR293, 24, 3.5999999, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR293, 63, 35.VARCHAR999985, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR293, 75, 6.19999981, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR294, 1, 14.3999996, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR294, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR294, 43, 36.7999992, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR294, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR294, 75, 6.19999981, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR295, 56, 3VARCHAR.3999996, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR296, 11, 16.7999992, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR296, 16, 13.8999996, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR296, 69, 28.7999992, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR297, 39, 14.3999996, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR297, 72, 27.7999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR298, 2, 15.1999998, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR298, 36, 15.1999998, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR298, 59, 44, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR298, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR299, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR299, 7VARCHAR, 12, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHARVARCHAR, 66, 13.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHARVARCHAR, 68, 1VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR1, 4VARCHAR, 14.6999998, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR1, 56, 3VARCHAR.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR2, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR2, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR2, 43, 36.7999992, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR3, 4VARCHAR, 14.6999998, 4VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR3, 65, 16.7999992, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR3, 68, 1VARCHAR, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR4, 49, 16, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR4, 59, 44, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR4, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR5, 18, 5VARCHAR, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR5, 29, 99, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR5, 39, 14.3999996, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR6, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR6, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR6, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR7, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR7, 68, 1VARCHAR, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR8, 69, 28.7999992, 1, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR8, 7VARCHAR, 12, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR9, 4, 17.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR9, 6, 2VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR9, 42, 11.1999998, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR9, 43, 36.7999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR3VARCHAR9, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR31VARCHAR, 16, 13.8999996, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR31VARCHAR, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR311, 42, 11.1999998, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR311, 69, 28.7999992, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR312, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR312, 43, 36.7999992, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR312, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR312, 75, 6.19999981, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR313, 36, 15.1999998, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR314, 32, 25.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 4VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR314, 58, 1VARCHAR.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR314, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR315, 34, 11.1999998, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR315, 7VARCHAR, 12, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR316, 41, 7.69999981, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR316, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR317, 1, 14.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR318, 41, 7.69999981, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR318, 76, 14.3999996, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR319, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR319, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR319, 76, 14.3999996, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR32VARCHAR, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR321, 35, 14.3999996, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR322, 52, 5.5999999, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR323, 15, 12.3999996, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR323, 25, 11.1999998, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR323, 39, 14.3999996, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR324, 16, 13.8999996, 21, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR324, 35, 14.3999996, 7VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR324, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR324, 59, 44, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR324, 63, 35.VARCHAR999985, 8VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR325, 6, 2VARCHAR, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR325, 13, 4.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR325, 14, 18.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR325, 31, 1VARCHAR, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR325, 72, 27.7999992, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR326, 4, 17.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR326, 57, 15.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR326, 75, 6.19999981, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR327, 2, 15.1999998, 25, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR327, 11, 16.7999992, 5VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR327, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 35, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR327, 58, 1VARCHAR.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR328, 59, 44, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR328, 65, 16.7999992, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR328, 68, 1VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR329, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR329, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 8, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR329, 38, 21VARCHAR.8VARCHARVARCHARVARCHARVARCHAR3, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR329, 56, 3VARCHAR.3999996, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR33VARCHAR, 26, 24.8999996, 5VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR33VARCHAR, 72, 27.7999992, 25, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR331, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR332, 18, 5VARCHAR, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR332, 42, 11.1999998, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR332, 47, 7.5999999, 16, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR333, 14, 18.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR333, 21, 8, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR333, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 4VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR334, 52, 5.5999999, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR334, 68, 1VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR335, 2, 15.1999998, 7, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR335, 31, 1VARCHAR, 25, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR335, 32, 25.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 6, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR335, 51, 42.4VARCHARVARCHARVARCHARVARCHAR15, 48, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR336, 4, 17.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 18, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR337, 23, 7.19999981, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR337, 26, 24.8999996, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR337, 36, 15.1999998, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR337, 37, 2VARCHAR.7999992, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR337, 72, 27.7999992, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR338, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR338, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR339, 4, 17.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR339, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 7VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR339, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR34VARCHAR, 18, 5VARCHAR, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR34VARCHAR, 41, 7.69999981, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR34VARCHAR, 43, 36.7999992, 4VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR341, 33, 2, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR341, 59, 44, 9, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR342, 2, 15.1999998, 24, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR342, 31, 1VARCHAR, 56, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR342, 36, 15.1999998, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR342, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR343, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR343, 68, 1VARCHAR, 4, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR343, 76, 14.3999996, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR344, 4, 17.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR344, 8, 32, 7VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR345, 8, 32, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR345, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 8VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR345, 42, 11.1999998, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR346, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 36, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR346, 56, 3VARCHAR.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR347, 25, 11.1999998, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR347, 39, 14.3999996, 5VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR347, 4VARCHAR, 14.6999998, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR347, 75, 6.19999981, 6, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR348, 1, 14.3999996, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR348, 23, 7.19999981, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR349, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR35VARCHAR, 5VARCHAR, 13, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR35VARCHAR, 69, 28.7999992, 18, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR351, 38, 21VARCHAR.8VARCHARVARCHARVARCHARVARCHAR3, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR351, 41, 7.69999981, 13, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR351, 44, 15.5, 77, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR351, 65, 16.7999992, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR352, 24, 3.5999999, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR352, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR353, 11, 16.7999992, 12, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR353, 38, 21VARCHAR.8VARCHARVARCHARVARCHARVARCHAR3, 5VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR354, 1, 14.3999996, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR354, 29, 99, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR355, 24, 3.5999999, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR355, 57, 15.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR356, 31, 1VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR356, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR356, 69, 28.7999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR357, 1VARCHAR, 24.7999992, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR357, 26, 24.8999996, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR357, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 8, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR358, 24, 3.5999999, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR358, 34, 11.1999998, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR358, 36, 15.1999998, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR359, 16, 13.8999996, 56, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR359, 31, 1VARCHAR, 7VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR359, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 8VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR36VARCHAR, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR36VARCHAR, 29, 99, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR36VARCHAR, 38, 21VARCHAR.8VARCHARVARCHARVARCHARVARCHAR3, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR36VARCHAR, 49, 16, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR36VARCHAR, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR361, 39, 14.3999996, 54, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR361, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 55, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR362, 25, 11.1999998, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR362, 51, 42.4VARCHARVARCHARVARCHARVARCHAR15, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR362, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR363, 31, 1VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR363, 75, 6.19999981, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR363, 76, 14.3999996, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR364, 69, 28.7999992, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR364, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR365, 11, 16.7999992, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR366, 65, 16.7999992, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR366, 77, 1VARCHAR.3999996, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR367, 34, 11.1999998, 36, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR367, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR367, 65, 16.7999992, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR367, 77, 1VARCHAR.3999996, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR368, 21, 8, 5, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR368, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 13, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR368, 57, 15.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR368, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 35, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR369, 29, 99, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR369, 56, 3VARCHAR.3999996, 18, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR37VARCHAR, 1, 14.3999996, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR37VARCHAR, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR37VARCHAR, 74, 8, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR371, 36, 15.1999998, 6, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR372, 2VARCHAR, 64.8VARCHARVARCHARVARCHARVARCHAR31, 12, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR372, 38, 21VARCHAR.8VARCHARVARCHARVARCHARVARCHAR3, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR372, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 7VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR372, 72, 27.7999992, 42, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR373, 58, 1VARCHAR.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 8VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR373, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 5VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR374, 31, 1VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR374, 58, 1VARCHAR.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR375, 14, 18.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR375, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR376, 31, 1VARCHAR, 42, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR377, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR377, 39, 14.3999996, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR378, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR379, 41, 7.69999981, 8, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR379, 63, 35.VARCHAR999985, 16, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR379, 65, 16.7999992, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR38VARCHAR, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 18, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR38VARCHAR, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR38VARCHAR, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 6, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR38VARCHAR, 7VARCHAR, 12, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR381, 74, 8, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR382, 5, 17, 32, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR382, 18, 5VARCHAR, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR382, 29, 99, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR382, 33, 2, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR382, 74, 8, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR383, 13, 4.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR383, 5VARCHAR, 13, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR383, 56, 3VARCHAR.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR384, 2VARCHAR, 64.8VARCHARVARCHARVARCHARVARCHAR31, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR384, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR385, 7, 24, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR385, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR385, 68, 1VARCHAR, 8, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR386, 24, 3.5999999, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR386, 34, 11.1999998, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR387, 24, 3.5999999, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR387, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR387, 59, 44, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR387, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR388, 45, 7.5999999, 15, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR388, 52, 5.5999999, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR388, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR389, 1VARCHAR, 24.7999992, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR389, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR389, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR389, 7VARCHAR, 12, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR39VARCHAR, 31, 1VARCHAR, 6VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR39VARCHAR, 35, 14.3999996, 4VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR39VARCHAR, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 45, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR39VARCHAR, 72, 27.7999992, 24, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR391, 13, 4.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR392, 69, 28.7999992, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR393, 2, 15.1999998, 25, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR393, 14, 18.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 42, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR393, 25, 11.1999998, 7, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR393, 26, 24.8999996, 7VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR393, 31, 1VARCHAR, 32, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR394, 13, 4.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR394, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR395, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 28, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR395, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 7VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR395, 69, 28.7999992, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR396, 23, 7.19999981, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR396, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR396, 72, 27.7999992, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR397, 21, 8, 1VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR397, 51, 42.4VARCHARVARCHARVARCHARVARCHAR15, 18, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR398, 35, 14.3999996, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR398, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 12VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR399, 68, 1VARCHAR, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR399, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR399, 76, 14.3999996, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR399, 77, 1VARCHAR.3999996, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHARVARCHAR, 29, 99, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHARVARCHAR, 35, 14.3999996, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHARVARCHAR, 49, 16, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR1, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR1, 56, 3VARCHAR.3999996, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR1, 65, 16.7999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR1, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR2, 23, 7.19999981, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR2, 63, 35.VARCHAR999985, 65, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR3, 16, 13.8999996, 21, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR3, 48, 1VARCHAR.1999998, 7VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR4, 26, 24.8999996, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR4, 42, 11.1999998, 4VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR4, 49, 16, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR5, 3, 8, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR6, 1, 14.3999996, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR6, 21, 8, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR6, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 42, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR6, 36, 15.1999998, 5, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR6, 4VARCHAR, 14.6999998, 2, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR7, 11, 16.7999992, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR7, 69, 28.7999992, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR7, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR8, 37, 2VARCHAR.7999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR8, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR8, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR9, 14, 18.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR4VARCHAR9, 21, 8, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR41VARCHAR, 33, 2, 49, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR41VARCHAR, 59, 44, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR411, 41, 7.69999981, 25, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR411, 44, 15.5, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR411, 59, 44, 9, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR412, 14, 18.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR413, 1, 14.3999996, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR413, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR413, 76, 14.3999996, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR414, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 18, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR414, 33, 2, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR415, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR415, 33, 2, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR416, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR416, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR416, 57, 15.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR417, 38, 21VARCHAR.8VARCHARVARCHARVARCHARVARCHAR3, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR417, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 2, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR417, 68, 1VARCHAR, 36, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR417, 77, 1VARCHAR.3999996, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR418, 2, 15.1999998, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR418, 47, 7.5999999, 55, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR418, 61, 22.7999992, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR418, 74, 8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR419, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 6VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR419, 69, 28.7999992, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR42VARCHAR, 9, 77.5999985, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR42VARCHAR, 13, 4.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 2, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR42VARCHAR, 7VARCHAR, 12, 8, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR42VARCHAR, 73, 12, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR421, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 4, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR421, 26, 24.8999996, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR421, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR421, 77, 1VARCHAR.3999996, 1VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR422, 26, 24.8999996, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR423, 31, 1VARCHAR, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR423, 59, 44, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR424, 35, 14.3999996, 6VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR424, 38, 21VARCHAR.8VARCHARVARCHARVARCHARVARCHAR3, 49, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR424, 68, 1VARCHAR, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR425, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 1VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR425, 76, 14.3999996, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR426, 56, 3VARCHAR.3999996, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR426, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR427, 14, 18.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR428, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR429, 5VARCHAR, 13, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR429, 63, 35.VARCHAR999985, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR43VARCHAR, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 45, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR43VARCHAR, 21, 8, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR43VARCHAR, 56, 3VARCHAR.3999996, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR43VARCHAR, 59, 44, 7VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR431, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 5VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR431, 4VARCHAR, 14.6999998, 5VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR431, 47, 7.5999999, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR432, 26, 24.8999996, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR432, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR433, 56, 3VARCHAR.3999996, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR434, 11, 16.7999992, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR434, 76, 14.3999996, 18, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR435, 2, 15.1999998, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR435, 22, 16.7999992, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR435, 72, 27.7999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR436, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR436, 56, 3VARCHAR.3999996, 4VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR436, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR436, 75, 6.19999981, 24, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR437, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR438, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 15, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR438, 34, 11.1999998, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR438, 57, 15.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 15, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR439, 12, 3VARCHAR.3999996, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR439, 16, 13.8999996, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR439, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR439, 74, 8, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR44VARCHAR, 2, 15.1999998, 45, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR44VARCHAR, 16, 13.8999996, 49, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR44VARCHAR, 29, 99, 24, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR44VARCHAR, 61, 22.7999992, 9VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR441, 27, 35.VARCHAR999985, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR442, 11, 16.7999992, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR442, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 8VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR442, 66, 13.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR443, 11, 16.7999992, 6, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR443, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR444, 17, 31.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR444, 26, 24.8999996, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR444, 35, 14.3999996, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR444, 41, 7.69999981, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR445, 39, 14.3999996, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR445, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR446, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 12, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR446, 24, 3.5999999, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR446, 31, 1VARCHAR, 3, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR446, 52, 5.5999999, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR447, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR447, 65, 16.7999992, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR447, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR448, 26, 24.8999996, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR448, 4VARCHAR, 14.6999998, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR449, 1VARCHAR, 24.7999992, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR449, 52, 5.5999999, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR449, 62, 39.4VARCHARVARCHARVARCHARVARCHAR15, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR45VARCHAR, 1VARCHAR, 24.7999992, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR45VARCHAR, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 6, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR451, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 12VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR451, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 35, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR451, 65, 16.7999992, 28, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR451, 77, 1VARCHAR.3999996, 55, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR452, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR452, 44, 15.5, 1VARCHARVARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR453, 48, 1VARCHAR.1999998, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR453, 7VARCHAR, 12, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR454, 16, 13.8999996, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR454, 33, 2, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR454, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR455, 39, 14.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR455, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR455, 61, 22.7999992, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR455, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR456, 21, 8, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR456, 49, 16, 21, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR457, 59, 44, 36, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR458, 26, 24.8999996, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR458, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR458, 43, 36.7999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR458, 56, 3VARCHAR.3999996, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR458, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR459, 7, 24, 16, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR459, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR459, 72, 27.7999992, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR46VARCHAR, 68, 1VARCHAR, 21, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR46VARCHAR, 75, 6.19999981, 4, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR461, 21, 8, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR461, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 28, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR461, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 6VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR462, 13, 4.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 1, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR462, 23, 7.19999981, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR463, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR463, 42, 11.1999998, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR464, 4, 17.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 16, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR464, 43, 36.7999992, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR464, 56, 3VARCHAR.3999996, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR464, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR465, 24, 3.5999999, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR465, 29, 99, 18, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR465, 4VARCHAR, 14.6999998, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR465, 45, 7.5999999, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR465, 5VARCHAR, 13, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR466, 11, 16.7999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR466, 46, 9.6VARCHARVARCHARVARCHARVARCHARVARCHAR38, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR467, 24, 3.5999999, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR467, 25, 11.1999998, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR468, 3VARCHAR, 2VARCHAR.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR468, 43, 36.7999992, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR469, 2, 15.1999998, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR469, 16, 13.8999996, 35, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR469, 44, 15.5, 2, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR47VARCHAR, 18, 5VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR47VARCHAR, 23, 7.19999981, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR47VARCHAR, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR471, 7, 24, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR471, 56, 3VARCHAR.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR472, 24, 3.5999999, 8VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR472, 51, 42.4VARCHARVARCHARVARCHARVARCHAR15, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR473, 33, 2, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR473, 71, 17.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR474, 14, 18.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR474, 28, 36.4VARCHARVARCHARVARCHARVARCHAR15, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR474, 4VARCHAR, 14.6999998, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR474, 75, 6.19999981, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR475, 31, 1VARCHAR, 35, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR475, 66, 13.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 6VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR475, 76, 14.3999996, 42, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR476, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 2, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR476, 7VARCHAR, 12, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR477, 1, 14.3999996, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR477, 21, 8, 21, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR477, 39, 14.3999996, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR478, 1VARCHAR, 24.7999992, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR479, 38, 21VARCHAR.8VARCHARVARCHARVARCHARVARCHAR3, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR479, 53, 26.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR479, 59, 44, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR479, 64, 26.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR48VARCHAR, 47, 7.5999999, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR48VARCHAR, 59, 44, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR481, 49, 16, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR481, 6VARCHAR, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR482, 4VARCHAR, 14.6999998, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR483, 34, 11.1999998, 35, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR483, 77, 1VARCHAR.3999996, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR484, 21, 8, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR484, 4VARCHAR, 14.6999998, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR484, 51, 42.4VARCHARVARCHARVARCHARVARCHAR15, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR485, 2, 15.1999998, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR485, 3, 8, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR485, 55, 19.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR485, 7VARCHAR, 12, 6VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR486, 11, 16.7999992, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR486, 51, 42.4VARCHARVARCHARVARCHARVARCHAR15, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR486, 74, 8, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR487, 19, 7.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR487, 26, 24.8999996, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR487, 54, 5.9VARCHARVARCHARVARCHARVARCHARVARCHAR1, 24, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR488, 59, 44, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR488, 73, 12, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR489, 11, 16.7999992, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR489, 16, 13.8999996, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR49VARCHAR, 59, 44, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR49VARCHAR, 68, 1VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR49VARCHAR, 75, 6.19999981, 36, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR491, 44, 15.5, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR491, 77, 1VARCHAR.3999996, 7, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR492, 25, 11.1999998, 6VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR492, 42, 11.1999998, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR493, 65, 16.7999992, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR493, 66, 13.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR493, 69, 28.7999992, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR494, 56, 3VARCHAR.3999996, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR495, 23, 7.19999981, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR495, 41, 7.69999981, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR495, 77, 1VARCHAR.3999996, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR496, 31, 1VARCHAR, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR497, 56, 3VARCHAR.3999996, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR497, 72, 27.7999992, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR497, 77, 1VARCHAR.3999996, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR498, 24, 4.5, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR498, 4VARCHAR, 18.3999996, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR498, 42, 14, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR499, 28, 45.5999985, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR499, 49, 2VARCHAR, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHARVARCHAR, 15, 15.5, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR5VARCHARVARCHAR, 28, 45.5999985, 8, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR1, 54, 7.44999981, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR2, 45, 9.5, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR2, 53, 32.7999992, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR2, 67, 14, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR3, 14, 23.25, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR3, 65, 21.VARCHAR499992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR4, 2, 19, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR4, 21, 1VARCHAR, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR4, 53, 32.7999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR4, 61, 28.5, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR5, 62, 49.2999992, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR6, 25, 14, 18, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR6, 7VARCHAR, 15, 14, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR7, 43, 46, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR7, 48, 12.75, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR8, 13, 6, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR8, 39, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR5VARCHAR9, 28, 45.5999985, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR51VARCHAR, 29, 123.79VARCHARVARCHARVARCHAR1, 36, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR51VARCHAR, 75, 7.75, 36, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR511, 4, 22, 5VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR511, 7, 3VARCHAR, 5VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR511, 8, 4VARCHAR, 1VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR512, 24, 4.5, 1VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR512, 46, 12, 9, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR512, 47, 9.5, 6, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR512, 6VARCHAR, 34, 12, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR513, 21, 1VARCHAR, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR513, 32, 32, 5VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR513, 61, 28.5, 15, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR514, 2VARCHAR, 81, 39, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR514, 28, 45.5999985, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR514, 56, 38, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR514, 65, 21.VARCHAR499992, 39, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR514, 75, 7.75, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR515, 9, 97, 16, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR515, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR515, 27, 43.9VARCHARVARCHARVARCHARVARCHAR15, 12VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR515, 33, 2.5, 16, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR515, 6VARCHAR, 34, 84, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR516, 18, 62.5, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR516, 41, 9.64999962, 8VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR516, 42, 14, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR517, 52, 7, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR517, 59, 55, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR517, 7VARCHAR, 15, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR518, 24, 4.5, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR518, 38, 263.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR518, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR519, 1VARCHAR, 31, 16, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR519, 56, 38, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR519, 6VARCHAR, 34, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR52VARCHAR, 24, 4.5, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR52VARCHAR, 53, 32.7999992, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR521, 35, 18, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR521, 41, 9.64999962, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR521, 68, 12.5, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR522, 1, 18, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR522, 8, 4VARCHAR, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR522, 3VARCHAR, 25.8899994, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR522, 4VARCHAR, 18.3999996, 25, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR523, 17, 39, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR523, 2VARCHAR, 81, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR523, 37, 26, 18, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR523, 41, 9.64999962, 6, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR524, 1VARCHAR, 31, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR524, 3VARCHAR, 25.8899994, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR524, 43, 46, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR524, 54, 7.44999981, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR525, 36, 19, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR525, 4VARCHAR, 18.3999996, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR526, 1, 18, 8, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR526, 13, 6, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR526, 56, 38, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR527, 4, 22, 5VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR527, 36, 19, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR528, 11, 21, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR528, 33, 2.5, 8, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR528, 72, 34.7999992, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR529, 55, 24, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR529, 68, 12.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR529, 69, 36, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR53VARCHAR, 17, 39, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR53VARCHAR, 43, 46, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR53VARCHAR, 61, 28.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR53VARCHAR, 76, 18, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR531, 59, 55, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR532, 3VARCHAR, 25.8899994, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR532, 66, 17, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR533, 4, 22, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR533, 72, 34.7999992, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR533, 73, 15, 24, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR534, 3VARCHAR, 25.8899994, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR534, 4VARCHAR, 18.3999996, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR534, 54, 7.44999981, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR535, 11, 21, 5VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR535, 4VARCHAR, 18.3999996, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR535, 57, 19.5, 5, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR535, 59, 55, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR536, 12, 38, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR536, 31, 12.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR536, 33, 2.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR536, 6VARCHAR, 34, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR537, 31, 12.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR537, 51, 53, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR537, 58, 13.25, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR537, 72, 34.7999992, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR537, 73, 15, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR538, 7VARCHAR, 15, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR538, 72, 34.7999992, 1, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR539, 13, 6, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR539, 21, 1VARCHAR, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR539, 33, 2.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR539, 49, 2VARCHAR, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR54VARCHAR, 3, 1VARCHAR, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR54VARCHAR, 26, 31.2299995, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR54VARCHAR, 38, 263.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR54VARCHAR, 68, 12.5, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR541, 24, 4.5, 35, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR541, 38, 263.5, 4, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR541, 65, 21.VARCHAR499992, 36, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR541, 71, 21.5, 9, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR542, 11, 21, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR542, 54, 7.44999981, 24, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR543, 12, 38, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR543, 23, 9, 7VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR544, 28, 45.5999985, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR544, 67, 14, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR545, 11, 21, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR546, 7, 3VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR546, 35, 18, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR546, 62, 49.2999992, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR547, 32, 32, 24, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR547, 36, 19, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR548, 34, 14, 1VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR548, 41, 9.64999962, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR549, 31, 12.5, 55, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR549, 45, 9.5, 1VARCHARVARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR549, 51, 53, 48, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR55VARCHAR, 17, 39, 8, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR55VARCHAR, 19, 9.19999981, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR55VARCHAR, 21, 1VARCHAR, 6, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR55VARCHAR, 61, 28.5, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR551, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR551, 35, 18, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR551, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR552, 69, 36, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR552, 75, 7.75, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR553, 11, 21, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR553, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR553, 22, 21, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR553, 31, 12.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR553, 35, 18, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR554, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR554, 23, 9, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR554, 62, 49.2999992, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR554, 77, 13, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR555, 14, 23.25, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR555, 19, 9.19999981, 35, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR555, 24, 4.5, 18, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR555, 51, 53, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR555, 56, 38, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR556, 72, 34.7999992, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR557, 64, 33.25, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR557, 75, 7.75, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR558, 47, 9.5, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR558, 51, 53, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR558, 52, 7, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR558, 53, 32.7999992, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR558, 73, 15, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR559, 41, 9.64999962, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR559, 55, 24, 18, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR56VARCHAR, 3VARCHAR, 25.8899994, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR56VARCHAR, 62, 49.2999992, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR561, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR561, 51, 53, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR562, 33, 2.5, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR562, 62, 49.2999992, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR563, 36, 19, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR563, 52, 7, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR564, 17, 39, 16, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR564, 31, 12.5, 6, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR564, 55, 24, 25, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR565, 24, 4.5, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR565, 64, 33.25, 18, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR566, 11, 21, 35, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR566, 18, 62.5, 18, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR566, 76, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR567, 31, 12.5, 6VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR567, 51, 53, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR567, 59, 55, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR568, 1VARCHAR, 31, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR569, 31, 12.5, 35, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR569, 76, 18, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR57VARCHAR, 11, 21, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR57VARCHAR, 56, 38, 6VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR571, 14, 23.25, 11, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR571, 42, 14, 28, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR572, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 12, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR572, 32, 32, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR572, 4VARCHAR, 18.3999996, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR572, 75, 7.75, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR573, 17, 39, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR573, 34, 14, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR573, 53, 32.7999992, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR574, 33, 2.5, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR574, 4VARCHAR, 18.3999996, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR574, 62, 49.2999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR574, 64, 33.25, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR575, 59, 55, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR575, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR575, 72, 34.7999992, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR575, 76, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR576, 1, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR576, 31, 12.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR576, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR577, 39, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR577, 75, 7.75, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR577, 77, 13, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR578, 35, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR578, 57, 19.5, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR579, 15, 15.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR579, 75, 7.75, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR58VARCHAR, 14, 23.25, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR58VARCHAR, 41, 9.64999962, 9, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR58VARCHAR, 65, 21.VARCHAR499992, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR581, 75, 7.75, 5VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR582, 57, 19.5, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR582, 76, 18, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR583, 29, 123.79VARCHARVARCHARVARCHAR1, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR583, 6VARCHAR, 34, 24, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR583, 69, 36, 1VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR584, 31, 12.5, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR585, 47, 9.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR586, 52, 7, 4, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR587, 26, 31.2299995, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR587, 35, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR587, 77, 13, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR588, 18, 62.5, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR588, 42, 14, 1VARCHARVARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR589, 35, 18, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR59VARCHAR, 1, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR59VARCHAR, 77, 13, 6VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR591, 3, 1VARCHAR, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR591, 7, 3VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR591, 54, 7.44999981, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR592, 15, 15.5, 25, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR592, 26, 31.2299995, 5, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR593, 2VARCHAR, 81, 21, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR593, 69, 36, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR593, 76, 18, 4, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR594, 52, 7, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR594, 58, 13.25, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR595, 35, 18, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR595, 61, 28.5, 12VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR595, 69, 36, 65, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR596, 56, 38, 5, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR596, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 24, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR596, 75, 7.75, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR597, 24, 4.5, 35, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR597, 57, 19.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR597, 65, 21.VARCHAR499992, 12, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR598, 27, 43.9VARCHARVARCHARVARCHARVARCHAR15, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR598, 71, 21.5, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR599, 62, 49.2999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHARVARCHAR, 54, 7.44999981, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHARVARCHAR, 73, 15, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR1, 13, 6, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR1, 59, 55, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR2, 77, 13, 5, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR3, 22, 21, 48, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR3, 49, 2VARCHAR, 25, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR4, 48, 12.75, 6, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR4, 76, 18, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR5, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR5, 59, 55, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR5, 6VARCHAR, 34, 7VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR5, 71, 21.5, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR6, 4, 22, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR6, 55, 24, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR6, 62, 49.2999992, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR7, 7, 3VARCHAR, 45, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR7, 17, 39, 1VARCHARVARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR7, 33, 2.5, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR7, 4VARCHAR, 18.3999996, 42, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR7, 72, 34.7999992, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR8, 56, 38, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR9, 1, 18, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR9, 1VARCHAR, 31, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR6VARCHAR9, 21, 1VARCHAR, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR61VARCHAR, 36, 19, 21, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR611, 1, 18, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR611, 2, 19, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR611, 6VARCHAR, 34, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR612, 1VARCHAR, 31, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR612, 36, 19, 55, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR612, 49, 2VARCHAR, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR612, 6VARCHAR, 34, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR612, 76, 18, 8VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR613, 13, 6, 8, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR613, 75, 7.75, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR614, 11, 21, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR614, 21, 1VARCHAR, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR614, 39, 18, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR615, 55, 24, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR616, 38, 263.5, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR616, 56, 38, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR616, 7VARCHAR, 15, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR616, 71, 21.5, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR617, 59, 55, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR618, 6, 25, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR618, 56, 38, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR618, 68, 12.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR619, 21, 1VARCHAR, 42, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR619, 22, 21, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR62VARCHAR, 24, 4.5, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR62VARCHAR, 52, 7, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR621, 19, 9.19999981, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR621, 23, 9, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR621, 7VARCHAR, 15, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR621, 71, 21.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR622, 2, 19, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR622, 68, 12.5, 18, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR623, 14, 23.25, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR623, 19, 9.19999981, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR623, 21, 1VARCHAR, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR623, 24, 4.5, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR623, 35, 18, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR624, 28, 45.5999985, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR624, 29, 123.79VARCHARVARCHARVARCHAR1, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR624, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR625, 14, 23.25, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR625, 42, 14, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR625, 6VARCHAR, 34, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR626, 53, 32.7999992, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR626, 6VARCHAR, 34, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR626, 71, 21.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR627, 62, 49.2999992, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR627, 73, 15, 35, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR628, 1, 18, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR629, 29, 123.79VARCHARVARCHARVARCHAR1, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR629, 64, 33.25, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR63VARCHAR, 55, 24, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR63VARCHAR, 76, 18, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR631, 75, 7.75, 8, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR632, 2, 19, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR632, 33, 2.5, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR633, 12, 38, 36, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR633, 13, 6, 13, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR633, 26, 31.2299995, 35, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR633, 62, 49.2999992, 8VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR634, 7, 3VARCHAR, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR634, 18, 62.5, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR634, 51, 53, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR634, 75, 7.75, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR635, 4, 22, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR635, 5, 21.35VARCHARVARCHARVARCHARVARCHAR4, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR635, 22, 21, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR636, 4, 22, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR636, 58, 13.25, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR637, 11, 21, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR637, 5VARCHAR, 16.25, 25, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR637, 56, 38, 6VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR638, 45, 9.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR638, 65, 21.VARCHAR499992, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR638, 72, 34.7999992, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR639, 18, 62.5, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR64VARCHAR, 69, 36, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR64VARCHAR, 7VARCHAR, 15, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR641, 2, 19, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR641, 4VARCHAR, 18.3999996, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR642, 21, 1VARCHAR, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR642, 61, 28.5, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR643, 28, 45.5999985, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR643, 39, 18, 21, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR643, 46, 12, 2, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR644, 18, 62.5, 4, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR644, 43, 46, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR644, 46, 12, 21, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR645, 18, 62.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR645, 36, 19, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR646, 1, 18, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR646, 1VARCHAR, 31, 18, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR646, 71, 21.5, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR646, 77, 13, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR647, 19, 9.19999981, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR647, 39, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR648, 22, 21, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR648, 24, 4.5, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR649, 28, 45.5999985, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR649, 72, 34.7999992, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR65VARCHAR, 3VARCHAR, 25.8899994, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR65VARCHAR, 53, 32.7999992, 25, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR65VARCHAR, 54, 7.44999981, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR651, 19, 9.19999981, 12, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR651, 22, 21, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR652, 3VARCHAR, 25.8899994, 2, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR652, 42, 14, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR653, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR653, 6VARCHAR, 34, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR654, 4, 22, 12, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR654, 39, 18, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR654, 54, 7.44999981, 6, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR655, 41, 9.64999962, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR656, 14, 23.25, 3, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR656, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 28, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR656, 47, 9.5, 6, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR657, 15, 15.5, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR657, 41, 9.64999962, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR657, 46, 12, 45, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR657, 47, 9.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR657, 56, 38, 45, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR657, 6VARCHAR, 34, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR658, 21, 1VARCHAR, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR658, 4VARCHAR, 18.3999996, 7VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR658, 6VARCHAR, 34, 55, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR658, 77, 13, 7VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR659, 31, 12.5, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR659, 4VARCHAR, 18.3999996, 24, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR659, 7VARCHAR, 15, 4VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR66VARCHAR, 2VARCHAR, 81, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR661, 39, 18, 3, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR661, 58, 13.25, 49, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR662, 68, 12.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR663, 4VARCHAR, 18.3999996, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR663, 42, 14, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR663, 51, 53, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR664, 1VARCHAR, 31, 24, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR664, 56, 38, 12, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR664, 65, 21.VARCHAR499992, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR665, 51, 53, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR665, 59, 55, 1, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR665, 76, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR666, 29, 123.79VARCHARVARCHARVARCHAR1, 36, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR666, 65, 21.VARCHAR499992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR667, 69, 36, 45, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR667, 71, 21.5, 14, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR668, 31, 12.5, 8, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR668, 55, 24, 4, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR668, 64, 33.25, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR669, 36, 19, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR67VARCHAR, 23, 9, 32, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR67VARCHAR, 46, 12, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR67VARCHAR, 67, 14, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR67VARCHAR, 73, 15, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR67VARCHAR, 75, 7.75, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR671, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR671, 62, 49.2999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR671, 65, 21.VARCHAR499992, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR672, 38, 263.5, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR672, 71, 21.5, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR673, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR673, 42, 14, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR673, 43, 46, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR674, 23, 9, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR675, 14, 23.25, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR675, 53, 32.7999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR675, 58, 13.25, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR676, 1VARCHAR, 31, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR676, 19, 9.19999981, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR676, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR677, 26, 31.2299995, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR677, 33, 2.5, 8, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR678, 12, 38, 1VARCHARVARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR678, 33, 2.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR678, 41, 9.64999962, 12VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR678, 54, 7.44999981, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR679, 59, 55, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR68VARCHAR, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 5VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR68VARCHAR, 31, 12.5, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR68VARCHAR, 42, 14, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR681, 19, 9.19999981, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR681, 21, 1VARCHAR, 12, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR681, 64, 33.25, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR682, 33, 2.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR682, 66, 17, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR682, 75, 7.75, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR683, 52, 7, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR684, 4VARCHAR, 18.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR684, 47, 9.5, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR684, 6VARCHAR, 34, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR685, 1VARCHAR, 31, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR685, 41, 9.64999962, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR685, 47, 9.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR686, 17, 39, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR686, 26, 31.2299995, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR687, 9, 97, 5VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR687, 29, 123.79VARCHARVARCHARVARCHAR1, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR687, 36, 19, 6, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR688, 1VARCHAR, 31, 18, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR688, 28, 45.5999985, 6VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR688, 34, 14, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR689, 1, 18, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR69VARCHAR, 56, 38, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR69VARCHAR, 77, 13, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR691, 1, 18, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR691, 29, 123.79VARCHARVARCHARVARCHAR1, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR691, 43, 46, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR691, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR691, 62, 49.2999992, 48, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR692, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR693, 9, 97, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR693, 54, 7.44999981, 6VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR693, 69, 36, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR693, 73, 15, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR694, 7, 3VARCHAR, 9VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR694, 59, 55, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR694, 7VARCHAR, 15, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR695, 8, 4VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR695, 12, 38, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR695, 24, 4.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR696, 17, 39, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR696, 46, 12, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR697, 19, 9.19999981, 7, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR697, 35, 18, 9, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR697, 58, 13.25, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR697, 7VARCHAR, 15, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR698, 11, 21, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR698, 17, 39, 8, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR698, 29, 123.79VARCHARVARCHARVARCHAR1, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR698, 65, 21.VARCHAR499992, 65, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR698, 7VARCHAR, 15, 8, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR699, 47, 9.5, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHARVARCHAR, 1, 18, 5, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR7VARCHARVARCHAR, 34, 14, 12, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR7VARCHARVARCHAR, 68, 12.5, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR7VARCHARVARCHAR, 71, 21.5, 6VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR1, 59, 55, 42, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR1, 71, 21.5, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR1, 76, 18, 35, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR2, 3, 1VARCHAR, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR2, 76, 18, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR3, 2, 19, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR3, 59, 55, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR3, 73, 15, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR4, 4, 22, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR4, 24, 4.5, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR4, 48, 12.75, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR5, 31, 12.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR5, 32, 32, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR6, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR6, 43, 46, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR6, 59, 55, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR7, 55, 24, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR7, 57, 19.5, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR7, 7VARCHAR, 15, 28, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR8, 5, 21.35VARCHARVARCHARVARCHARVARCHAR4, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR8, 36, 19, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR9, 8, 4VARCHAR, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR9, 51, 53, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR7VARCHAR9, 6VARCHAR, 34, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR71VARCHAR, 19, 9.19999981, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR71VARCHAR, 47, 9.5, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR711, 19, 9.19999981, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR711, 41, 9.64999962, 42, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR711, 53, 32.7999992, 12VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR712, 53, 32.7999992, 3, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR712, 56, 38, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR713, 1VARCHAR, 31, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR713, 26, 31.2299995, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR713, 45, 9.5, 11VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR713, 46, 12, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR714, 2, 19, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR714, 17, 39, 27, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR714, 47, 9.5, 5VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR714, 56, 38, 18, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR714, 58, 13.25, 12, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR715, 1VARCHAR, 31, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR715, 71, 21.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR716, 21, 1VARCHAR, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR716, 51, 53, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR716, 61, 28.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR717, 21, 1VARCHAR, 32, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR717, 54, 7.44999981, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR717, 69, 36, 25, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR718, 12, 38, 36, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR718, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR718, 36, 19, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR718, 62, 49.2999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR719, 18, 62.5, 12, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR719, 3VARCHAR, 25.8899994, 3, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR719, 54, 7.44999981, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR72VARCHAR, 35, 18, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR72VARCHAR, 71, 21.5, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR721, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR722, 2, 19, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR722, 31, 12.5, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR722, 68, 12.5, 45, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR722, 75, 7.75, 42, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR723, 26, 31.2299995, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR724, 1VARCHAR, 31, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR724, 61, 28.5, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR725, 41, 9.64999962, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR725, 52, 7, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR725, 55, 24, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR726, 4, 22, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR726, 11, 21, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR727, 17, 39, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR727, 56, 38, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR727, 59, 55, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR728, 3VARCHAR, 25.8899994, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR728, 4VARCHAR, 18.3999996, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR728, 55, 24, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR728, 6VARCHAR, 34, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR729, 1, 18, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR729, 21, 1VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR729, 5VARCHAR, 16.25, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR73VARCHAR, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR73VARCHAR, 31, 12.5, 3, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR73VARCHAR, 65, 21.VARCHAR499992, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR731, 21, 1VARCHAR, 4VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR731, 51, 53, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR732, 76, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR733, 14, 23.25, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR733, 28, 45.5999985, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR733, 52, 7, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR734, 6, 25, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR734, 3VARCHAR, 25.8899994, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR734, 76, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR735, 61, 28.5, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR735, 77, 13, 2, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR736, 65, 21.VARCHAR499992, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR736, 75, 7.75, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR737, 13, 6, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR737, 41, 9.64999962, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR738, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR739, 36, 19, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR739, 52, 7, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR74VARCHAR, 28, 45.5999985, 5, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR74VARCHAR, 35, 18, 35, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR74VARCHAR, 45, 9.5, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR74VARCHAR, 56, 38, 14, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR741, 2, 19, 15, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR742, 3, 1VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR742, 6VARCHAR, 34, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR742, 72, 34.7999992, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR743, 46, 12, 28, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR744, 4VARCHAR, 18.3999996, 5VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR745, 18, 62.5, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR745, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR745, 59, 55, 45, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR745, 72, 34.7999992, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR746, 13, 6, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR746, 42, 14, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR746, 62, 49.2999992, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR746, 69, 36, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR747, 31, 12.5, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR747, 41, 9.64999962, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR747, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR747, 69, 36, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR748, 23, 9, 44, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR748, 4VARCHAR, 18.3999996, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR748, 56, 38, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR749, 56, 38, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR749, 59, 55, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR749, 76, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR75VARCHAR, 14, 23.25, 5, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR75VARCHAR, 45, 9.5, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR75VARCHAR, 59, 55, 25, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR751, 26, 31.2299995, 12, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR751, 3VARCHAR, 25.8899994, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR751, 5VARCHAR, 16.25, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR751, 73, 15, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR752, 1, 18, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR752, 69, 36, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR753, 45, 9.5, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR753, 74, 1VARCHAR, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR754, 4VARCHAR, 18.3999996, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR755, 47, 9.5, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR755, 56, 38, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR755, 57, 19.5, 14, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR755, 69, 36, 25, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR756, 18, 62.5, 21, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR756, 36, 19, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR756, 68, 12.5, 6, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR756, 69, 36, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR757, 34, 14, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR757, 59, 55, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR757, 62, 49.2999992, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR757, 64, 33.25, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR758, 26, 31.2299995, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR758, 52, 7, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR758, 7VARCHAR, 15, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR759, 32, 32, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR76VARCHAR, 25, 14, 12, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR76VARCHAR, 27, 43.9VARCHARVARCHARVARCHARVARCHAR15, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR76VARCHAR, 43, 46, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR761, 25, 14, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR761, 75, 7.75, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR762, 39, 18, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR762, 47, 9.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR762, 51, 53, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR762, 56, 38, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR763, 21, 1VARCHAR, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR763, 22, 21, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR763, 24, 4.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR764, 3, 1VARCHAR, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR764, 39, 18, 13VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR765, 65, 21.VARCHAR499992, 8VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR766, 2, 19, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR766, 7, 3VARCHAR, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR766, 68, 12.5, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR767, 42, 14, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR768, 22, 21, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR768, 31, 12.5, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR768, 6VARCHAR, 34, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR768, 71, 21.5, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR769, 41, 9.64999962, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR769, 52, 7, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR769, 61, 28.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR769, 62, 49.2999992, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR77VARCHAR, 11, 21, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR771, 71, 21.5, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR772, 29, 123.79VARCHARVARCHARVARCHAR1, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR772, 59, 55, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR773, 17, 39, 33, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR773, 31, 12.5, 7VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR773, 75, 7.75, 7, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR774, 31, 12.5, 2, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR774, 66, 17, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR775, 1VARCHAR, 31, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR775, 67, 14, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR776, 31, 12.5, 16, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR776, 42, 14, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR776, 45, 9.5, 27, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR776, 51, 53, 12VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR777, 42, 14, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR778, 41, 9.64999962, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR779, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR779, 62, 49.2999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR78VARCHAR, 7VARCHAR, 15, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR78VARCHAR, 77, 13, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR781, 54, 7.44999981, 3, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR781, 56, 38, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR781, 74, 1VARCHAR, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR782, 31, 12.5, 1, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR783, 31, 12.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR783, 38, 263.5, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR784, 36, 19, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR784, 39, 18, 2, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR784, 72, 34.7999992, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR785, 1VARCHAR, 31, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR785, 75, 7.75, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR786, 8, 4VARCHAR, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR786, 3VARCHAR, 25.8899994, 15, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR786, 75, 7.75, 42, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR787, 2, 19, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR787, 29, 123.79VARCHARVARCHARVARCHAR1, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR788, 19, 9.19999981, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR788, 75, 7.75, 4VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR789, 18, 62.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR789, 35, 18, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR789, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR789, 68, 12.5, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR79VARCHAR, 7, 3VARCHAR, 3, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR79VARCHAR, 56, 38, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR791, 29, 123.79VARCHARVARCHARVARCHAR1, 14, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR791, 41, 9.64999962, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR792, 2, 19, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR792, 54, 7.44999981, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR792, 68, 12.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR793, 41, 9.64999962, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR793, 52, 7, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR794, 14, 23.25, 15, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR794, 54, 7.44999981, 6, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR795, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 65, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR795, 17, 39, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR796, 26, 31.2299995, 21, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR796, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR796, 64, 33.25, 35, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR796, 69, 36, 24, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR797, 11, 21, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR798, 62, 49.2999992, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR798, 72, 34.7999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR799, 13, 6, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR799, 24, 4.5, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR799, 59, 55, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR8VARCHARVARCHAR, 11, 21, 5VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR8VARCHARVARCHAR, 51, 53, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR8VARCHARVARCHAR, 54, 7.44999981, 7, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR1, 17, 39, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR1, 29, 123.79VARCHARVARCHARVARCHAR1, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR2, 3VARCHAR, 25.8899994, 25, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR2, 51, 53, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR2, 55, 24, 6VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR2, 62, 49.2999992, 5, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR3, 19, 9.19999981, 24, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR3, 25, 14, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR3, 59, 55, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR4, 1VARCHAR, 31, 36, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR4, 28, 45.5999985, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR4, 49, 2VARCHAR, 4, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR5, 34, 14, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR5, 38, 263.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR6, 2, 19, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR6, 65, 21.VARCHAR499992, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR6, 74, 1VARCHAR, 15, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR7, 4VARCHAR, 18.3999996, 1, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR8, 56, 38, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR8, 76, 18, 5VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR8VARCHAR9, 52, 7, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR81VARCHAR, 13, 6, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR81VARCHAR, 25, 14, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR81VARCHAR, 7VARCHAR, 15, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR811, 19, 9.19999981, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR811, 23, 9, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR811, 4VARCHAR, 18.3999996, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR812, 31, 12.5, 16, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR812, 72, 34.7999992, 4VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR812, 77, 13, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR813, 2, 19, 12, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR813, 46, 12, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR814, 41, 9.64999962, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR814, 43, 46, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR814, 48, 12.75, 8, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR814, 61, 28.5, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR815, 33, 2.5, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR816, 38, 263.5, 3VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR816, 62, 49.2999992, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR817, 26, 31.2299995, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR817, 38, 263.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR817, 4VARCHAR, 18.3999996, 6VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR817, 62, 49.2999992, 25, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR818, 32, 32, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR818, 41, 9.64999962, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR819, 43, 46, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR819, 75, 7.75, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR82VARCHAR, 56, 38, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR821, 35, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR821, 51, 53, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR822, 62, 49.2999992, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR822, 7VARCHAR, 15, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR823, 11, 21, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR823, 57, 19.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR823, 59, 55, 4VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR823, 77, 13, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR824, 41, 9.64999962, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR824, 7VARCHAR, 15, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR825, 26, 31.2299995, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR825, 53, 32.7999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR826, 31, 12.5, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR826, 57, 19.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR827, 1VARCHAR, 31, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR827, 39, 18, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR828, 2VARCHAR, 81, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR828, 38, 263.5, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR829, 2, 19, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR829, 8, 4VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR829, 13, 6, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR829, 6VARCHAR, 34, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR83VARCHAR, 6, 25, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR83VARCHAR, 39, 18, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR83VARCHAR, 6VARCHAR, 34, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR83VARCHAR, 68, 12.5, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR831, 19, 9.19999981, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR831, 35, 18, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR831, 38, 263.5, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR831, 43, 46, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR832, 13, 6, 3, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR832, 25, 14, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR832, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 16, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR832, 64, 33.25, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR833, 7, 3VARCHAR, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR833, 31, 12.5, 9, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR833, 53, 32.7999992, 9, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR834, 29, 123.79VARCHARVARCHARVARCHAR1, 8, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR834, 3VARCHAR, 25.8899994, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR835, 59, 55, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR835, 77, 13, 2, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR836, 22, 21, 52, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR836, 35, 18, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR836, 57, 19.5, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR836, 6VARCHAR, 34, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR836, 64, 33.25, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR837, 13, 6, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR837, 4VARCHAR, 18.3999996, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR837, 47, 9.5, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR837, 76, 18, 21, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR838, 1, 18, 4, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR838, 18, 62.5, 25, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR838, 36, 19, 5VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR839, 58, 13.25, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR839, 72, 34.7999992, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR84VARCHAR, 25, 14, 6, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR84VARCHAR, 39, 18, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR841, 1VARCHAR, 31, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR841, 56, 38, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR841, 59, 55, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR841, 77, 13, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR842, 11, 21, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR842, 43, 46, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR842, 68, 12.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR842, 7VARCHAR, 15, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR843, 51, 53, 4, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR844, 22, 21, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR845, 23, 9, 7VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR845, 35, 18, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR845, 42, 14, 42, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR845, 58, 13.25, 6VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR845, 64, 33.25, 48, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR846, 4, 22, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR846, 7VARCHAR, 15, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR846, 74, 1VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR847, 1, 18, 8VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR847, 19, 9.19999981, 12, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR847, 37, 26, 6VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR847, 45, 9.5, 36, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR847, 6VARCHAR, 34, 45, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR847, 71, 21.5, 55, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR848, 5, 21.35VARCHARVARCHARVARCHARVARCHAR4, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR848, 9, 97, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR849, 3, 1VARCHAR, 49, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR849, 26, 31.2299995, 18, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR85VARCHAR, 25, 14, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR85VARCHAR, 33, 2.5, 4, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR85VARCHAR, 7VARCHAR, 15, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR851, 2, 19, 5, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR851, 25, 14, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR851, 57, 19.5, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR851, 59, 55, 42, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR852, 2, 19, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR852, 17, 39, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR852, 62, 49.2999992, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR853, 18, 62.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR854, 1VARCHAR, 31, 1VARCHARVARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR854, 13, 6, 65, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR855, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR855, 31, 12.5, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR855, 56, 38, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR855, 65, 21.VARCHAR499992, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR856, 2, 19, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR856, 42, 14, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR857, 3, 1VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR857, 26, 31.2299995, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR857, 29, 123.79VARCHARVARCHARVARCHAR1, 1VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR858, 7, 3VARCHAR, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR858, 27, 43.9VARCHARVARCHARVARCHARVARCHAR15, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR858, 7VARCHAR, 15, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR859, 24, 4.5, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR859, 54, 7.44999981, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR859, 64, 33.25, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR86VARCHAR, 51, 53, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR86VARCHAR, 76, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR861, 17, 39, 42, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR861, 18, 62.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR861, 21, 1VARCHAR, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR861, 33, 2.5, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR861, 62, 49.2999992, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR862, 11, 21, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR862, 52, 7, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR863, 1, 18, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR863, 58, 13.25, 12, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR864, 35, 18, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR864, 67, 14, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR865, 38, 263.5, 6VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR865, 39, 18, 8VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR866, 2, 19, 21, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR866, 24, 4.5, 6, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR866, 3VARCHAR, 25.8899994, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR867, 53, 32.7999992, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR868, 26, 31.2299995, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR868, 35, 18, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR868, 49, 2VARCHAR, 42, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR869, 1, 18, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR869, 11, 21, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR869, 23, 9, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR869, 68, 12.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR87VARCHAR, 35, 18, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR87VARCHAR, 51, 53, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR871, 6, 25, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR871, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR871, 17, 39, 16, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR872, 55, 24, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR872, 62, 49.2999992, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR872, 64, 33.25, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR872, 65, 21.VARCHAR499992, 21, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR873, 21, 1VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR873, 28, 45.5999985, 3, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR874, 1VARCHAR, 31, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR875, 19, 9.19999981, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR875, 47, 9.5, 21, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR875, 49, 2VARCHAR, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR876, 46, 12, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR876, 64, 33.25, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR877, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR877, 18, 62.5, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR878, 2VARCHAR, 81, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR879, 4VARCHAR, 18.3999996, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR879, 65, 21.VARCHAR499992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR879, 76, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR88VARCHAR, 23, 9, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR88VARCHAR, 61, 28.5, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR88VARCHAR, 7VARCHAR, 15, 5VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR881, 73, 15, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR882, 42, 14, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR882, 49, 2VARCHAR, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR882, 54, 7.44999981, 32, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR883, 24, 4.5, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR884, 21, 1VARCHAR, 4VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR884, 56, 38, 21, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR884, 65, 21.VARCHAR499992, 12, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR885, 2, 19, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR885, 24, 4.5, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR885, 7VARCHAR, 15, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR885, 77, 13, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR886, 1VARCHAR, 31, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR886, 31, 12.5, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR886, 77, 13, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR887, 25, 14, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR888, 2, 19, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR888, 68, 12.5, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR889, 11, 21, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR889, 38, 263.5, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR89VARCHAR, 17, 39, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR89VARCHAR, 34, 14, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR89VARCHAR, 41, 9.64999962, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR891, 3VARCHAR, 25.8899994, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR892, 59, 55, 4VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR893, 8, 4VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR893, 24, 4.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR893, 29, 123.79VARCHARVARCHARVARCHAR1, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR893, 3VARCHAR, 25.8899994, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR893, 36, 19, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR894, 13, 6, 28, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR894, 69, 36, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR894, 75, 7.75, 12VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR895, 24, 4.5, 11VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR895, 39, 18, 45, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR895, 4VARCHAR, 18.3999996, 91, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR895, 6VARCHAR, 34, 1VARCHARVARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR896, 45, 9.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR896, 56, 38, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR897, 29, 123.79VARCHARVARCHARVARCHAR1, 8VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR897, 3VARCHAR, 25.8899994, 36, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR898, 13, 6, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR899, 39, 18, 8, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR9VARCHARVARCHAR, 7VARCHAR, 15, 3, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR1, 41, 9.64999962, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR1, 71, 21.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR2, 55, 24, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR2, 62, 49.2999992, 6, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR3, 13, 6, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR3, 65, 21.VARCHAR499992, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR3, 68, 12.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR4, 58, 13.25, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR4, 62, 49.2999992, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR5, 1, 18, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR6, 61, 28.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR7, 75, 7.75, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR8, 7, 3VARCHAR, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR8, 52, 7, 14, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR9, 7, 3VARCHAR, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR9, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR9VARCHAR9, 41, 9.64999962, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR91VARCHAR, 19, 9.19999981, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR91VARCHAR, 49, 2VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR91VARCHAR, 61, 28.5, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR911, 1, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR911, 17, 39, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR911, 67, 14, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR912, 11, 21, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR912, 29, 123.79VARCHARVARCHARVARCHAR1, 6VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR913, 4, 22, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR913, 33, 2.5, 4VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR913, 58, 13.25, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR914, 71, 21.5, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR915, 17, 39, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR915, 33, 2.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR915, 54, 7.44999981, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR916, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR916, 32, 32, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR916, 57, 19.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR917, 3VARCHAR, 25.8899994, 1, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR917, 6VARCHAR, 34, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR918, 1, 18, 6VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR918, 6VARCHAR, 34, 25, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR919, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR919, 25, 14, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR919, 4VARCHAR, 18.3999996, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR92VARCHAR, 5VARCHAR, 16.25, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR921, 35, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR921, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR922, 17, 39, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR922, 24, 4.5, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR923, 42, 14, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR923, 43, 46, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR923, 67, 14, 24, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR924, 1VARCHAR, 31, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR924, 28, 45.5999985, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR924, 75, 7.75, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR925, 36, 19, 25, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR925, 52, 7, 12, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR926, 11, 21, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR926, 13, 6, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR926, 19, 9.19999981, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR926, 72, 34.7999992, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR927, 2VARCHAR, 81, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR927, 52, 7, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR927, 76, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR928, 47, 9.5, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR928, 76, 18, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR929, 21, 1VARCHAR, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR929, 75, 7.75, 49, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR929, 77, 13, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR93VARCHAR, 21, 1VARCHAR, 36, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR93VARCHAR, 27, 43.9VARCHARVARCHARVARCHARVARCHAR15, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR93VARCHAR, 55, 24, 25, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR93VARCHAR, 58, 13.25, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR931, 13, 6, 42, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR931, 57, 19.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR932, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR932, 62, 49.2999992, 14, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR932, 72, 34.7999992, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR932, 75, 7.75, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR933, 53, 32.7999992, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR933, 61, 28.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR934, 6, 25, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR935, 1, 18, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR935, 18, 62.5, 4, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR935, 23, 9, 8, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR936, 36, 19, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR937, 28, 45.5999985, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR937, 34, 14, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR938, 13, 6, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR938, 43, 46, 24, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR938, 6VARCHAR, 34, 49, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR938, 71, 21.5, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR939, 2, 19, 1VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR939, 67, 14, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR94VARCHAR, 7, 3VARCHAR, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR94VARCHAR, 13, 6, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR941, 31, 12.5, 44, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR941, 62, 49.2999992, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR941, 68, 12.5, 8VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR941, 72, 34.7999992, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR942, 49, 2VARCHAR, 28, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR943, 13, 6, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR943, 22, 21, 21, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR943, 46, 12, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR944, 11, 21, 5, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR944, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 18, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR944, 56, 38, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR945, 13, 6, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR945, 31, 12.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR946, 1VARCHAR, 31, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR946, 24, 4.5, 25, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR946, 77, 13, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR947, 59, 55, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR948, 5VARCHAR, 16.25, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR948, 51, 53, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR948, 55, 24, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR949, 6, 25, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR949, 1VARCHAR, 31, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR949, 17, 39, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR949, 62, 49.2999992, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR95VARCHAR, 4, 22, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR951, 33, 2.5, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR951, 41, 9.64999962, 6, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR951, 75, 7.75, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR952, 6, 25, 16, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR952, 28, 45.5999985, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR953, 2VARCHAR, 81, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR953, 31, 12.5, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR954, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 28, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR954, 31, 12.5, 25, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR954, 45, 9.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR954, 6VARCHAR, 34, 24, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR955, 75, 7.75, 12, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR956, 21, 1VARCHAR, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR956, 47, 9.5, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR956, 51, 53, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR957, 3VARCHAR, 25.8899994, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR957, 35, 18, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR957, 64, 33.25, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR958, 5, 21.35VARCHARVARCHARVARCHARVARCHAR4, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR958, 7, 3VARCHAR, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR958, 72, 34.7999992, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR959, 75, 7.75, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR96VARCHAR, 24, 4.5, 1VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR96VARCHAR, 41, 9.64999962, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR961, 52, 7, 6, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR961, 76, 18, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR962, 7, 3VARCHAR, 45, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR962, 13, 6, 77, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR962, 53, 32.7999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR962, 69, 36, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR962, 76, 18, 44, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR963, 6VARCHAR, 34, 2, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR964, 18, 62.5, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR964, 38, 263.5, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR964, 69, 36, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR965, 51, 53, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR966, 37, 26, 8, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR966, 56, 38, 12, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR966, 62, 49.2999992, 12, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR967, 19, 9.19999981, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR967, 49, 2VARCHAR, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR968, 12, 38, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR968, 24, 4.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR968, 64, 33.25, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR969, 46, 12, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR97VARCHAR, 52, 7, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR971, 29, 123.79VARCHARVARCHARVARCHAR1, 14, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR972, 17, 39, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR972, 33, 2.5, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR973, 26, 31.2299995, 5, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR973, 41, 9.64999962, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR973, 75, 7.75, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR974, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR975, 8, 4VARCHAR, 16, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR975, 75, 7.75, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR976, 28, 45.5999985, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR977, 39, 18, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR977, 47, 9.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR977, 51, 53, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR977, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR978, 8, 4VARCHAR, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR978, 21, 1VARCHAR, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR978, 4VARCHAR, 18.3999996, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR978, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 6, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR979, 7, 3VARCHAR, 18, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR979, 12, 38, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR979, 24, 4.5, 8VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR979, 27, 43.9VARCHARVARCHARVARCHARVARCHAR15, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR979, 31, 12.5, 24, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR979, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 35, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR98VARCHAR, 75, 7.75, 4VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR981, 38, 263.5, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR982, 7, 3VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR982, 43, 46, 9, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR983, 13, 6, 84, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR983, 57, 19.5, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR984, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 55, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR984, 24, 4.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR984, 36, 19, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR985, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 36, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR985, 18, 62.5, 8, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR985, 32, 32, 35, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR986, 11, 21, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR986, 2VARCHAR, 81, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR986, 76, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR986, 77, 13, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR987, 7, 3VARCHAR, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR987, 43, 46, 6, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR987, 72, 34.7999992, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR988, 7, 3VARCHAR, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR988, 62, 49.2999992, 4VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (1VARCHAR989, 6, 25, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR989, 11, 21, 15, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR989, 41, 9.64999962, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR99VARCHAR, 21, 1VARCHAR, 65, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR99VARCHAR, 34, 14, 6VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR99VARCHAR, 55, 24, 65, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR99VARCHAR, 61, 28.5, 66, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (1VARCHAR991, 2, 19, 5VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR991, 7VARCHAR, 15, 2VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR991, 76, 18, 9VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (1VARCHAR992, 72, 34.7999992, 2, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR993, 29, 123.79VARCHARVARCHARVARCHAR1, 5VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR993, 41, 9.64999962, 35, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR994, 59, 55, 18, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR995, 51, 53, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR995, 6VARCHAR, 34, 4, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR996, 42, 14, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR997, 32, 32, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR997, 46, 12, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR997, 52, 7, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (1VARCHAR998, 24, 4.5, 12, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR998, 61, 28.5, 7, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR998, 74, 1VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR998, 75, 7.75, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (1VARCHAR999, 41, 9.64999962, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR999, 51, 53, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (1VARCHAR999, 77, 13, 21, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHARVARCHARVARCHAR, 4, 22, 25, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHARVARCHARVARCHAR, 24, 4.5, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHARVARCHARVARCHAR, 77, 13, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR1, 7, 3VARCHAR, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR1, 22, 21, 25, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR1, 46, 12, 25, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR1, 55, 24, 6, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR2, 13, 6, 56, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR2, 35, 18, 15, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHARVARCHAR2, 42, 14, 24, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHARVARCHAR2, 55, 24, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR3, 1, 18, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR3, 4VARCHAR, 18.3999996, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR3, 52, 7, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR4, 26, 31.2299995, 6, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR4, 76, 18, 6, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR5, 1, 18, 2, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR5, 59, 55, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR6, 1, 18, 8, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR6, 29, 123.79VARCHARVARCHARVARCHAR1, 2, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHARVARCHAR7, 8, 4VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR7, 29, 123.79VARCHARVARCHARVARCHAR1, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR7, 42, 14, 14, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR8, 28, 45.5999985, 7VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHARVARCHAR8, 34, 14, 9VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHARVARCHAR8, 71, 21.5, 21, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR9, 24, 4.5, 12, VARCHAR);
INSERT INTO order_details VALUES (11VARCHARVARCHAR9, 36, 19, 18, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHARVARCHAR9, 6VARCHAR, 34, 9, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR1VARCHAR, 7, 3VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR1VARCHAR, 24, 4.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR11, 58, 13.25, 4VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR11, 71, 21.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR12, 19, 9.19999981, 5VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR12, 6VARCHAR, 34, 36, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR12, 71, 21.5, 6VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR13, 23, 9, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR13, 42, 14, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR13, 45, 9.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR13, 68, 12.5, 2, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR14, 41, 9.64999962, 28, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR15, 3VARCHAR, 25.8899994, 15, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR15, 77, 13, 18, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR16, 31, 12.5, 15, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR16, 36, 19, 16, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR17, 3, 1VARCHAR, 25, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR17, 59, 55, 11VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR17, 7VARCHAR, 15, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR18, 12, 38, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR18, 18, 62.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR18, 56, 38, 5, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR19, 46, 12, 3, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR19, 49, 2VARCHAR, 2, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR2VARCHAR, 1VARCHAR, 31, 24, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR21, 2, 19, 11, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR21, 2VARCHAR, 81, 15, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR21, 26, 31.2299995, 63, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR21, 51, 53, 44, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR21, 72, 34.7999992, 35, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR22, 19, 9.19999981, 35, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR22, 69, 36, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR23, 7, 3VARCHAR, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR23, 43, 46, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR24, 26, 31.2299995, 12, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR24, 33, 2.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR24, 65, 21.VARCHAR499992, 21, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR24, 71, 21.5, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR25, 1, 18, 1VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR25, 13, 6, 2VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR26, 18, 62.5, 8, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR26, 51, 53, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR27, 24, 4.5, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR27, 62, 49.2999992, 21, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR28, 55, 24, 35, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR28, 59, 55, 24, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR29, 56, 38, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR29, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 12, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR3VARCHAR, 2, 19, 1VARCHARVARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR3VARCHAR, 5, 21.35VARCHARVARCHARVARCHARVARCHAR4, 7VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR3VARCHAR, 29, 123.79VARCHARVARCHARVARCHAR1, 6VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR3VARCHAR, 59, 55, 1VARCHARVARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR31, 1, 18, 45, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR31, 13, 6, 8VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR31, 24, 4.5, 21, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR31, 64, 33.25, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR31, 71, 21.5, 16, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR32, 36, 19, 35, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR32, 38, 263.5, 25, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR32, 59, 55, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR33, 53, 32.7999992, 7VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR33, 69, 36, 36, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR34, 21, 1VARCHAR, 15, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR34, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 12, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR34, 61, 28.5, 6, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR35, 1, 18, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR35, 35, 18, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR35, 42, 14, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR35, 54, 7.44999981, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR36, 13, 6, 7, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR36, 59, 55, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR37, 7VARCHAR, 15, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR38, 4VARCHAR, 18.3999996, 5, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR38, 52, 7, 2, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR38, 71, 21.5, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR39, 28, 45.5999985, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR39, 35, 18, 24, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR39, 49, 2VARCHAR, 6VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR39, 57, 19.5, 28, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR4VARCHAR, 21, 1VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR41, 2, 19, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR41, 63, 43.9VARCHARVARCHARVARCHARVARCHAR15, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR42, 44, 19.45VARCHARVARCHARVARCHARVARCHAR8, 15, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR42, 61, 28.5, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR43, 11, 21, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR44, 62, 49.2999992, 12, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR45, 33, 2.5, 15, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR45, 51, 53, 24, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR46, 12, 38, 2VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR46, 32, 32, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR46, 35, 18, 18, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR47, 1, 18, 25, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR47, 5, 21.35VARCHARVARCHARVARCHARVARCHAR4, 3VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR48, 68, 12.5, 42, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR49, 2, 19, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR49, 12, 38, 4, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR5VARCHAR, 76, 18, 5VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR51, 24, 4.5, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR52, 43, 46, 3VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR52, 61, 28.5, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR53, 18, 62.5, 35, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR53, 32, 32, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR53, 64, 33.25, 25, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR54, 33, 2.5, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR54, 67, 14, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR55, 24, 4.5, 15, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR55, 25, 14, 15, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR55, 51, 53, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR55, 57, 19.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR56, 7, 3VARCHAR, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR56, 55, 24, 35, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR56, 6VARCHAR, 34, 5VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR57, 7VARCHAR, 15, 3, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR58, 21, 1VARCHAR, 3, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR58, 6VARCHAR, 34, 21, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR58, 61, 28.5, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR59, 13, 6, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR59, 17, 39, 12, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR59, 6VARCHAR, 34, 35, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR6VARCHAR, 6VARCHAR, 34, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR6VARCHAR, 77, 13, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR61, 6VARCHAR, 34, 15, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR62, 53, 32.7999992, 1VARCHAR, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR62, 7VARCHAR, 15, 12, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR63, 34, 14, 3VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR63, 4VARCHAR, 18.3999996, 4VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR63, 41, 9.64999962, 3VARCHAR, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR64, 17, 39, 77, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR64, 41, 9.64999962, 12, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR64, 53, 32.7999992, 25, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR64, 55, 24, 4, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR64, 68, 12.5, 55, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR65, 3VARCHAR, 25.8899994, 4, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR65, 54, 7.44999981, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR66, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 3, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR66, 19, 9.19999981, 42, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR66, 34, 14, 35, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR67, 41, 9.64999962, 9, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR68, 28, 45.5999985, 8, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR68, 43, 46, 36, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR68, 77, 13, 28, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR69, 39, 18, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR7VARCHAR, 1, 18, 4VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR7VARCHAR, 2, 19, 2VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR7VARCHAR, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR7VARCHAR, 31, 12.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR71, 7, 3VARCHAR, 15, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR71, 13, 6, 1VARCHAR, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR72, 2, 19, 8, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR72, 41, 9.64999962, 4VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR72, 5VARCHAR, 16.25, 22, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR72, 64, 33.25, 13VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR73, 11, 21, 1VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR73, 24, 4.5, 2VARCHAR, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR74, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 14, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR75, 2, 19, 1VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR75, 46, 12, 3VARCHAR, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR75, 76, 18, 2, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6);
INSERT INTO order_details VALUES (11VARCHAR76, 6, 25, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR76, 14, 23.25, 2VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR76, 19, 9.19999981, 1VARCHAR, VARCHAR.25);
INSERT INTO order_details VALUES (11VARCHAR77, 2, 19, 24, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3);
INSERT INTO order_details VALUES (11VARCHAR77, 3, 1VARCHAR, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 4, 22, 1, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 6, 25, 1, VARCHAR.VARCHAR199999996);
INSERT INTO order_details VALUES (11VARCHAR77, 7, 3VARCHAR, 1, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR77, 8, 4VARCHAR, 2, VARCHAR.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1);
INSERT INTO order_details VALUES (11VARCHAR77, 1VARCHAR, 31, 1, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 12, 38, 2, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR77, 13, 6, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 14, 23.25, 1, VARCHAR.VARCHAR299999993);
INSERT INTO order_details VALUES (11VARCHAR77, 16, 17.45VARCHARVARCHARVARCHARVARCHAR8, 2, VARCHAR.VARCHAR299999993);
INSERT INTO order_details VALUES (11VARCHAR77, 2VARCHAR, 81, 1, VARCHAR.VARCHAR399999991);
INSERT INTO order_details VALUES (11VARCHAR77, 23, 9, 2, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 32, 32, 1, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 39, 18, 2, VARCHAR.VARCHAR5VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7);
INSERT INTO order_details VALUES (11VARCHAR77, 41, 9.64999962, 3, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 46, 12, 3, VARCHAR.VARCHAR199999996);
INSERT INTO order_details VALUES (11VARCHAR77, 52, 7, 2, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 55, 24, 2, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 6VARCHAR, 34, 2, VARCHAR.VARCHAR599999987);
INSERT INTO order_details VALUES (11VARCHAR77, 64, 33.25, 2, VARCHAR.VARCHAR299999993);
INSERT INTO order_details VALUES (11VARCHAR77, 66, 17, 1, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 73, 15, 2, VARCHAR.VARCHARVARCHAR999999978);
INSERT INTO order_details VALUES (11VARCHAR77, 75, 7.75, 4, VARCHAR);
INSERT INTO order_details VALUES (11VARCHAR77, 77, 13, 2, VARCHAR);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders VALUES (1VARCHAR248, 'VINET', 5, '1996-VARCHAR7-VARCHAR4', '1996-VARCHAR8-VARCHAR1', '1996-VARCHAR7-16', 3, 32.38VARCHARVARCHARVARCHAR11, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '511VARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR249, 'TOMSP', 6, '1996-VARCHAR7-VARCHAR5', '1996-VARCHAR8-16', '1996-VARCHAR7-1VARCHAR', 1, 11.6VARCHAR99997, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44VARCHAR87', 'Germany');
INSERT INTO orders VALUES (1VARCHAR25VARCHAR, 'HANAR', 4, '1996-VARCHAR7-VARCHAR8', '1996-VARCHAR8-VARCHAR5', '1996-VARCHAR7-12', 2, 65.83VARCHARVARCHARVARCHAR18, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR251, 'VICTE', 3, '1996-VARCHAR7-VARCHAR8', '1996-VARCHAR8-VARCHAR5', '1996-VARCHAR7-15', 1, 41.34VARCHARVARCHARVARCHARVARCHAR2, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR252, 'SUPRD', 4, '1996-VARCHAR7-VARCHAR9', '1996-VARCHAR8-VARCHAR6', '1996-VARCHAR7-11', 2, 51.2999992, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR253, 'HANAR', 3, '1996-VARCHAR7-1VARCHAR', '1996-VARCHAR7-24', '1996-VARCHAR7-16', 2, 58.1699982, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR254, 'CHOPS', 5, '1996-VARCHAR7-11', '1996-VARCHAR8-VARCHAR8', '1996-VARCHAR7-23', 2, 22.9799995, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3VARCHAR12', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR255, 'RICSU', 9, '1996-VARCHAR7-12', '1996-VARCHAR8-VARCHAR9', '1996-VARCHAR7-15', 3, 148.33VARCHARVARCHARVARCHAR2, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR256, 'WELLI', 3, '1996-VARCHAR7-15', '1996-VARCHAR8-12', '1996-VARCHAR7-17', 2, 13.97VARCHARVARCHARVARCHARVARCHAR3, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR257, 'HILAA', 4, '1996-VARCHAR7-16', '1996-VARCHAR8-13', '1996-VARCHAR7-22', 3, 81.91VARCHARVARCHARVARCHAR37, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR258, 'ERNSH', 1, '1996-VARCHAR7-17', '1996-VARCHAR8-14', '1996-VARCHAR7-23', 1, 14VARCHAR.5VARCHAR9995, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR259, 'CENTC', 4, '1996-VARCHAR7-18', '1996-VARCHAR8-15', '1996-VARCHAR7-25', 3, 3.25, 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'México D.F.', NULL, 'VARCHAR5VARCHAR22', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR26VARCHAR, 'OTTIK', 4, '1996-VARCHAR7-19', '1996-VARCHAR8-16', '1996-VARCHAR7-29', 1, 55.VARCHAR9VARCHARVARCHARVARCHARVARCHAR2, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (1VARCHAR261, 'QUEDE', 4, '1996-VARCHAR7-19', '1996-VARCHAR8-16', '1996-VARCHAR7-3VARCHAR', 2, 3.VARCHAR4999995, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR262, 'RATTC', 8, '1996-VARCHAR7-22', '1996-VARCHAR8-19', '1996-VARCHAR7-25', 3, 48.29VARCHARVARCHARVARCHARVARCHAR9, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR263, 'ERNSH', 9, '1996-VARCHAR7-23', '1996-VARCHAR8-2VARCHAR', '1996-VARCHAR7-31', 3, 146.VARCHAR59998, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR264, 'FOLKO', 6, '1996-VARCHAR7-24', '1996-VARCHAR8-21', '1996-VARCHAR8-23', 3, 3.67VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR265, 'BLONP', 2, '1996-VARCHAR7-25', '1996-VARCHAR8-22', '1996-VARCHAR8-12', 1, 55.2799988, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR266, 'WARTH', 3, '1996-VARCHAR7-26', '1996-VARCHAR9-VARCHAR6', '1996-VARCHAR7-31', 3, 25.7299995, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR267, 'FRANK', 4, '1996-VARCHAR7-29', '1996-VARCHAR8-26', '1996-VARCHAR8-VARCHAR6', 1, 2VARCHAR8.58VARCHARVARCHARVARCHAR2, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR268, 'GROSR', 8, '1996-VARCHAR7-3VARCHAR', '1996-VARCHAR8-27', '1996-VARCHAR8-VARCHAR2', 3, 66.29VARCHARVARCHARVARCHARVARCHAR9, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1VARCHAR81', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR269, 'WHITC', 5, '1996-VARCHAR7-31', '1996-VARCHAR8-14', '1996-VARCHAR8-VARCHAR9', 1, 4.55999994, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR27VARCHAR, 'WARTH', 1, '1996-VARCHAR8-VARCHAR1', '1996-VARCHAR8-29', '1996-VARCHAR8-VARCHAR2', 1, 136.539993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR271, 'SPLIR', 6, '1996-VARCHAR8-VARCHAR1', '1996-VARCHAR8-29', '1996-VARCHAR8-3VARCHAR', 2, 4.53999996, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR272, 'RATTC', 6, '1996-VARCHAR8-VARCHAR2', '1996-VARCHAR8-3VARCHAR', '1996-VARCHAR8-VARCHAR6', 2, 98.VARCHAR299988, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR273, 'QUICK', 3, '1996-VARCHAR8-VARCHAR5', '1996-VARCHAR9-VARCHAR2', '1996-VARCHAR8-12', 3, 76.VARCHAR699997, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR274, 'VINET', 6, '1996-VARCHAR8-VARCHAR6', '1996-VARCHAR9-VARCHAR3', '1996-VARCHAR8-16', 1, 6.VARCHAR1VARCHARVARCHARVARCHARVARCHAR23, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '511VARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR275, 'MAGAA', 1, '1996-VARCHAR8-VARCHAR7', '1996-VARCHAR9-VARCHAR4', '1996-VARCHAR8-VARCHAR9', 1, 26.93VARCHARVARCHARVARCHARVARCHAR3, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR276, 'TORTU', 8, '1996-VARCHAR8-VARCHAR8', '1996-VARCHAR8-22', '1996-VARCHAR8-14', 3, 13.84VARCHARVARCHARVARCHARVARCHAR2, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR277, 'MORGK', 2, '1996-VARCHAR8-VARCHAR9', '1996-VARCHAR9-VARCHAR6', '1996-VARCHAR8-13', 3, 125.769997, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, 'VARCHAR4179', 'Germany');
INSERT INTO orders VALUES (1VARCHAR278, 'BERGS', 8, '1996-VARCHAR8-12', '1996-VARCHAR9-VARCHAR9', '1996-VARCHAR8-16', 2, 92.69VARCHARVARCHARVARCHAR24, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR279, 'LEHMS', 8, '1996-VARCHAR8-13', '1996-VARCHAR9-1VARCHAR', '1996-VARCHAR8-16', 2, 25.8299999, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR28VARCHAR, 'BERGS', 2, '1996-VARCHAR8-14', '1996-VARCHAR9-11', '1996-VARCHAR9-12', 1, 8.97999954, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR281, 'ROMEY', 4, '1996-VARCHAR8-14', '1996-VARCHAR8-28', '1996-VARCHAR8-21', 1, 2.94VARCHARVARCHARVARCHARVARCHARVARCHAR6, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28VARCHARVARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR282, 'ROMEY', 4, '1996-VARCHAR8-15', '1996-VARCHAR9-12', '1996-VARCHAR8-21', 1, 12.6899996, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28VARCHARVARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR283, 'LILAS', 3, '1996-VARCHAR8-16', '1996-VARCHAR9-13', '1996-VARCHAR8-23', 3, 84.8VARCHAR99976, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR284, 'LEHMS', 4, '1996-VARCHAR8-19', '1996-VARCHAR9-16', '1996-VARCHAR8-27', 1, 76.5599976, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR285, 'QUICK', 1, '1996-VARCHAR8-2VARCHAR', '1996-VARCHAR9-17', '1996-VARCHAR8-26', 2, 76.83VARCHARVARCHARVARCHAR18, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR286, 'QUICK', 8, '1996-VARCHAR8-21', '1996-VARCHAR9-18', '1996-VARCHAR8-3VARCHAR', 3, 229.24VARCHARVARCHARVARCHAR5, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR287, 'RICAR', 8, '1996-VARCHAR8-22', '1996-VARCHAR9-19', '1996-VARCHAR8-28', 3, 12.76VARCHARVARCHARVARCHARVARCHAR2, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR288, 'REGGC', 4, '1996-VARCHAR8-23', '1996-VARCHAR9-2VARCHAR', '1996-VARCHAR9-VARCHAR3', 1, 7.44999981, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR289, 'BSBEV', 7, '1996-VARCHAR8-26', '1996-VARCHAR9-23', '1996-VARCHAR8-28', 3, 22.77VARCHARVARCHARVARCHARVARCHAR5, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (1VARCHAR29VARCHAR, 'COMMI', 8, '1996-VARCHAR8-27', '1996-VARCHAR9-24', '1996-VARCHAR9-VARCHAR3', 1, 79.6999969, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', 'VARCHAR5432-VARCHAR43', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR291, 'QUEDE', 6, '1996-VARCHAR8-27', '1996-VARCHAR9-24', '1996-VARCHAR9-VARCHAR4', 2, 6.4VARCHARVARCHARVARCHARVARCHARVARCHAR1, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR292, 'TRADH', 1, '1996-VARCHAR8-28', '1996-VARCHAR9-25', '1996-VARCHAR9-VARCHAR2', 2, 1.35VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', 'VARCHAR5634-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR293, 'TORTU', 1, '1996-VARCHAR8-29', '1996-VARCHAR9-26', '1996-VARCHAR9-11', 3, 21.18VARCHARVARCHARVARCHARVARCHAR3, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR294, 'RATTC', 4, '1996-VARCHAR8-3VARCHAR', '1996-VARCHAR9-27', '1996-VARCHAR9-VARCHAR5', 2, 147.259995, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR295, 'VINET', 2, '1996-VARCHAR9-VARCHAR2', '1996-VARCHAR9-3VARCHAR', '1996-VARCHAR9-1VARCHAR', 2, 1.14999998, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '511VARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR296, 'LILAS', 6, '1996-VARCHAR9-VARCHAR3', '1996-1VARCHAR-VARCHAR1', '1996-VARCHAR9-11', 1, VARCHAR.119999997, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR297, 'BLONP', 5, '1996-VARCHAR9-VARCHAR4', '1996-1VARCHAR-16', '1996-VARCHAR9-1VARCHAR', 2, 5.73999977, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR298, 'HUNGO', 6, '1996-VARCHAR9-VARCHAR5', '1996-1VARCHAR-VARCHAR3', '1996-VARCHAR9-11', 2, 168.22VARCHARVARCHARVARCHAR1, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR299, 'RICAR', 4, '1996-VARCHAR9-VARCHAR6', '1996-1VARCHAR-VARCHAR4', '1996-VARCHAR9-13', 2, 29.76VARCHARVARCHARVARCHARVARCHAR2, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR3VARCHARVARCHAR, 'MAGAA', 2, '1996-VARCHAR9-VARCHAR9', '1996-1VARCHAR-VARCHAR7', '1996-VARCHAR9-18', 2, 17.68VARCHARVARCHARVARCHARVARCHAR3, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR3VARCHAR1, 'WANDK', 8, '1996-VARCHAR9-VARCHAR9', '1996-1VARCHAR-VARCHAR7', '1996-VARCHAR9-17', 2, 45.VARCHAR8VARCHARVARCHARVARCHAR18, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (1VARCHAR3VARCHAR2, 'SUPRD', 4, '1996-VARCHAR9-1VARCHAR', '1996-1VARCHAR-VARCHAR8', '1996-1VARCHAR-VARCHAR9', 2, 6.26999998, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR3VARCHAR3, 'GODOS', 7, '1996-VARCHAR9-11', '1996-1VARCHAR-VARCHAR9', '1996-VARCHAR9-18', 2, 1VARCHAR7.83VARCHARVARCHARVARCHAR2, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR3VARCHAR4, 'TORTU', 1, '1996-VARCHAR9-12', '1996-1VARCHAR-1VARCHAR', '1996-VARCHAR9-17', 2, 63.79VARCHARVARCHARVARCHARVARCHAR9, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR3VARCHAR5, 'OLDWO', 8, '1996-VARCHAR9-13', '1996-1VARCHAR-11', '1996-1VARCHAR-VARCHAR9', 3, 257.619995, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (1VARCHAR3VARCHAR6, 'ROMEY', 1, '1996-VARCHAR9-16', '1996-1VARCHAR-14', '1996-VARCHAR9-23', 3, 7.55999994, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28VARCHARVARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR3VARCHAR7, 'LONEP', 2, '1996-VARCHAR9-17', '1996-1VARCHAR-15', '1996-VARCHAR9-25', 2, VARCHAR.56VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (1VARCHAR3VARCHAR8, 'ANATR', 7, '1996-VARCHAR9-18', '1996-1VARCHAR-16', '1996-VARCHAR9-24', 3, 1.61VARCHARVARCHARVARCHARVARCHARVARCHAR1, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, 'VARCHAR5VARCHAR21', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR3VARCHAR9, 'HUNGO', 3, '1996-VARCHAR9-19', '1996-1VARCHAR-17', '1996-1VARCHAR-23', 1, 47.2999992, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR31VARCHAR, 'THEBI', 8, '1996-VARCHAR9-2VARCHAR', '1996-1VARCHAR-18', '1996-VARCHAR9-27', 2, 17.52VARCHARVARCHARVARCHARVARCHAR5, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '972VARCHAR1', 'USA');
INSERT INTO orders VALUES (1VARCHAR311, 'DUMON', 1, '1996-VARCHAR9-2VARCHAR', '1996-1VARCHAR-VARCHAR4', '1996-VARCHAR9-26', 3, 24.69VARCHARVARCHARVARCHARVARCHAR5, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR312, 'WANDK', 2, '1996-VARCHAR9-23', '1996-1VARCHAR-21', '1996-1VARCHAR-VARCHAR3', 2, 4VARCHAR.2599983, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (1VARCHAR313, 'QUICK', 2, '1996-VARCHAR9-24', '1996-1VARCHAR-22', '1996-1VARCHAR-VARCHAR4', 2, 1.96VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR314, 'RATTC', 1, '1996-VARCHAR9-25', '1996-1VARCHAR-23', '1996-1VARCHAR-VARCHAR4', 2, 74.16VARCHARVARCHARVARCHAR37, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR315, 'ISLAT', 4, '1996-VARCHAR9-26', '1996-1VARCHAR-24', '1996-1VARCHAR-VARCHAR3', 2, 41.7599983, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR316, 'RATTC', 1, '1996-VARCHAR9-27', '1996-1VARCHAR-25', '1996-1VARCHAR-VARCHAR8', 3, 15VARCHAR.149994, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR317, 'LONEP', 6, '1996-VARCHAR9-3VARCHAR', '1996-1VARCHAR-28', '1996-1VARCHAR-1VARCHAR', 1, 12.6899996, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (1VARCHAR318, 'ISLAT', 8, '1996-1VARCHAR-VARCHAR1', '1996-1VARCHAR-29', '1996-1VARCHAR-VARCHAR4', 2, 4.73VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR319, 'TORTU', 7, '1996-1VARCHAR-VARCHAR2', '1996-1VARCHAR-3VARCHAR', '1996-1VARCHAR-11', 3, 64.5, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR32VARCHAR, 'WARTH', 5, '1996-1VARCHAR-VARCHAR3', '1996-1VARCHAR-17', '1996-1VARCHAR-18', 3, 34.5699997, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR321, 'ISLAT', 3, '1996-1VARCHAR-VARCHAR3', '1996-1VARCHAR-31', '1996-1VARCHAR-11', 2, 3.43VARCHARVARCHARVARCHARVARCHARVARCHAR7, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR322, 'PERIC', 7, '1996-1VARCHAR-VARCHAR4', '1996-11-VARCHAR1', '1996-1VARCHAR-23', 3, VARCHAR.4VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR323, 'KOENE', 4, '1996-1VARCHAR-VARCHAR7', '1996-11-VARCHAR4', '1996-1VARCHAR-14', 1, 4.88VARCHARVARCHARVARCHARVARCHAR11, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR324, 'SAVEA', 9, '1996-1VARCHAR-VARCHAR8', '1996-11-VARCHAR5', '1996-1VARCHAR-1VARCHAR', 1, 214.27VARCHARVARCHARVARCHAR4, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR325, 'KOENE', 1, '1996-1VARCHAR-VARCHAR9', '1996-1VARCHAR-23', '1996-1VARCHAR-14', 3, 64.86VARCHARVARCHARVARCHARVARCHAR6, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR326, 'BOLID', 4, '1996-1VARCHAR-1VARCHAR', '1996-11-VARCHAR7', '1996-1VARCHAR-14', 2, 77.9199982, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28VARCHAR23', 'Spain');
INSERT INTO orders VALUES (1VARCHAR327, 'FOLKO', 2, '1996-1VARCHAR-11', '1996-11-VARCHAR8', '1996-1VARCHAR-14', 1, 63.36VARCHARVARCHARVARCHARVARCHAR6, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR328, 'FURIB', 4, '1996-1VARCHAR-14', '1996-11-11', '1996-1VARCHAR-17', 3, 87.VARCHAR299988, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR329, 'SPLIR', 4, '1996-1VARCHAR-15', '1996-11-26', '1996-1VARCHAR-23', 2, 191.669998, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR33VARCHAR, 'LILAS', 3, '1996-1VARCHAR-16', '1996-11-13', '1996-1VARCHAR-28', 1, 12.75, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR331, 'BONAP', 9, '1996-1VARCHAR-16', '1996-11-27', '1996-1VARCHAR-21', 1, 1VARCHAR.1899996, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR332, 'MEREP', 3, '1996-1VARCHAR-17', '1996-11-28', '1996-1VARCHAR-21', 2, 52.84VARCHARVARCHARVARCHARVARCHAR2, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR333, 'WARTH', 5, '1996-1VARCHAR-18', '1996-11-15', '1996-1VARCHAR-25', 3, VARCHAR.589999974, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR334, 'VICTE', 8, '1996-1VARCHAR-21', '1996-11-18', '1996-1VARCHAR-28', 2, 8.56VARCHARVARCHARVARCHARVARCHAR42, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR335, 'HUNGO', 7, '1996-1VARCHAR-22', '1996-11-19', '1996-1VARCHAR-24', 2, 42.11VARCHARVARCHARVARCHARVARCHAR6, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR336, 'PRINI', 7, '1996-1VARCHAR-23', '1996-11-2VARCHAR', '1996-1VARCHAR-25', 2, 15.51VARCHARVARCHARVARCHARVARCHAR2, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR337, 'FRANK', 4, '1996-1VARCHAR-24', '1996-11-21', '1996-1VARCHAR-29', 3, 1VARCHAR8.26VARCHARVARCHARVARCHAR2, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR338, 'OLDWO', 4, '1996-1VARCHAR-25', '1996-11-22', '1996-1VARCHAR-29', 3, 84.2VARCHAR99991, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (1VARCHAR339, 'MEREP', 2, '1996-1VARCHAR-28', '1996-11-25', '1996-11-VARCHAR4', 2, 15.6599998, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR34VARCHAR, 'BONAP', 1, '1996-1VARCHAR-29', '1996-11-26', '1996-11-VARCHAR8', 3, 166.3VARCHAR9998, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR341, 'SIMOB', 7, '1996-1VARCHAR-29', '1996-11-26', '1996-11-VARCHAR5', 3, 26.78VARCHARVARCHARVARCHARVARCHAR7, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR342, 'FRANK', 4, '1996-1VARCHAR-3VARCHAR', '1996-11-13', '1996-11-VARCHAR4', 2, 54.83VARCHARVARCHARVARCHAR18, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR343, 'LEHMS', 4, '1996-1VARCHAR-31', '1996-11-28', '1996-11-VARCHAR6', 1, 11VARCHAR.37VARCHARVARCHARVARCHAR3, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR344, 'WHITC', 4, '1996-11-VARCHAR1', '1996-11-29', '1996-11-VARCHAR5', 2, 23.29VARCHARVARCHARVARCHARVARCHAR9, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR345, 'QUICK', 2, '1996-11-VARCHAR4', '1996-12-VARCHAR2', '1996-11-11', 2, 249.VARCHAR59998, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR346, 'RATTC', 3, '1996-11-VARCHAR5', '1996-12-17', '1996-11-VARCHAR8', 3, 142.VARCHAR8VARCHARVARCHARVARCHAR2, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR347, 'FAMIA', 4, '1996-11-VARCHAR6', '1996-12-VARCHAR4', '1996-11-VARCHAR8', 3, 3.VARCHAR999999, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', 'VARCHAR5442-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR348, 'WANDK', 4, '1996-11-VARCHAR7', '1996-12-VARCHAR5', '1996-11-15', 2, VARCHAR.779999971, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (1VARCHAR349, 'SPLIR', 7, '1996-11-VARCHAR8', '1996-12-VARCHAR6', '1996-11-15', 1, 8.63VARCHARVARCHARVARCHARVARCHAR11, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR35VARCHAR, 'LAMAI', 6, '1996-11-11', '1996-12-VARCHAR9', '1996-12-VARCHAR3', 2, 64.19VARCHARVARCHARVARCHAR24, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR351, 'ERNSH', 1, '1996-11-11', '1996-12-VARCHAR9', '1996-11-2VARCHAR', 1, 162.33VARCHARVARCHARVARCHAR2, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR352, 'FURIB', 3, '1996-11-12', '1996-11-26', '1996-11-18', 3, 1.29999995, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR353, 'PICCO', 7, '1996-11-13', '1996-12-11', '1996-11-25', 3, 36VARCHAR.63VARCHARVARCHARVARCHAR5, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR354, 'PERIC', 8, '1996-11-14', '1996-12-12', '1996-11-2VARCHAR', 3, 53.7999992, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR355, 'AROUT', 6, '1996-11-15', '1996-12-13', '1996-11-2VARCHAR', 1, 41.95VARCHARVARCHARVARCHARVARCHAR8, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR356, 'WANDK', 6, '1996-11-18', '1996-12-16', '1996-11-27', 2, 36.7VARCHAR99991, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (1VARCHAR357, 'LILAS', 1, '1996-11-19', '1996-12-17', '1996-12-VARCHAR2', 3, 34.88VARCHARVARCHARVARCHAR11, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR358, 'LAMAI', 5, '1996-11-2VARCHAR', '1996-12-18', '1996-11-27', 1, 19.6399994, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR359, 'SEVES', 5, '1996-11-21', '1996-12-19', '1996-11-26', 3, 288.429993, 'Seven Seas Imports', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (1VARCHAR36VARCHAR, 'BLONP', 4, '1996-11-22', '1996-12-2VARCHAR', '1996-12-VARCHAR2', 3, 131.699997, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR361, 'QUICK', 1, '1996-11-22', '1996-12-2VARCHAR', '1996-12-VARCHAR3', 2, 183.169998, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR362, 'BONAP', 3, '1996-11-25', '1996-12-23', '1996-11-28', 1, 96.VARCHAR4VARCHARVARCHARVARCHARVARCHAR9, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR363, 'DRACD', 4, '1996-11-26', '1996-12-24', '1996-12-VARCHAR4', 3, 3VARCHAR.54VARCHARVARCHARVARCHARVARCHAR9, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52VARCHAR66', 'Germany');
INSERT INTO orders VALUES (1VARCHAR364, 'EASTC', 1, '1996-11-26', '1997-VARCHAR1-VARCHAR7', '1996-12-VARCHAR4', 1, 71.97VARCHARVARCHARVARCHAR12, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (1VARCHAR365, 'ANTON', 3, '1996-11-27', '1996-12-25', '1996-12-VARCHAR2', 2, 22, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, 'VARCHAR5VARCHAR23', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR366, 'GALED', 8, '1996-11-28', '1997-VARCHAR1-VARCHAR9', '1996-12-3VARCHAR', 2, 1VARCHAR.14VARCHARVARCHARVARCHARVARCHAR3, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8VARCHAR22', 'Spain');
INSERT INTO orders VALUES (1VARCHAR367, 'VAFFE', 7, '1996-11-28', '1996-12-26', '1996-12-VARCHAR2', 3, 13.55VARCHARVARCHARVARCHARVARCHAR2, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR368, 'ERNSH', 2, '1996-11-29', '1996-12-27', '1996-12-VARCHAR2', 2, 1VARCHAR1.949997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR369, 'SPLIR', 8, '1996-12-VARCHAR2', '1996-12-3VARCHAR', '1996-12-VARCHAR9', 2, 195.679993, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR37VARCHAR, 'CHOPS', 6, '1996-12-VARCHAR3', '1996-12-31', '1996-12-27', 2, 1.16999996, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3VARCHAR12', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR371, 'LAMAI', 1, '1996-12-VARCHAR3', '1996-12-31', '1996-12-24', 1, VARCHAR.449999988, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR372, 'QUEEN', 5, '1996-12-VARCHAR4', '1997-VARCHAR1-VARCHAR1', '1996-12-VARCHAR9', 2, 89VARCHAR.78VARCHARVARCHAR29, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR373, 'HUNGO', 4, '1996-12-VARCHAR5', '1997-VARCHAR1-VARCHAR2', '1996-12-11', 3, 124.12VARCHARVARCHARVARCHAR3, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR374, 'WOLZA', 1, '1996-12-VARCHAR5', '1997-VARCHAR1-VARCHAR2', '1996-12-VARCHAR9', 3, 3.94VARCHARVARCHARVARCHARVARCHARVARCHAR6, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, 'VARCHAR1-VARCHAR12', 'Poland');
INSERT INTO orders VALUES (1VARCHAR375, 'HUNGC', 3, '1996-12-VARCHAR6', '1997-VARCHAR1-VARCHAR3', '1996-12-VARCHAR9', 2, 2VARCHAR.12VARCHARVARCHARVARCHARVARCHAR8, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (1VARCHAR376, 'MEREP', 1, '1996-12-VARCHAR9', '1997-VARCHAR1-VARCHAR6', '1996-12-13', 2, 2VARCHAR.3899994, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR377, 'SEVES', 1, '1996-12-VARCHAR9', '1997-VARCHAR1-VARCHAR6', '1996-12-13', 3, 22.2VARCHAR99991, 'Seven Seas Imports', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (1VARCHAR378, 'FOLKO', 5, '1996-12-1VARCHAR', '1997-VARCHAR1-VARCHAR7', '1996-12-19', 3, 5.44VARCHARVARCHARVARCHARVARCHARVARCHAR6, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR379, 'QUEDE', 2, '1996-12-11', '1997-VARCHAR1-VARCHAR8', '1996-12-13', 1, 45.VARCHAR299988, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR38VARCHAR, 'HUNGO', 8, '1996-12-12', '1997-VARCHAR1-VARCHAR9', '1997-VARCHAR1-16', 3, 35.VARCHAR299988, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR381, 'LILAS', 3, '1996-12-12', '1997-VARCHAR1-VARCHAR9', '1996-12-13', 3, 7.98999977, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR382, 'ERNSH', 4, '1996-12-13', '1997-VARCHAR1-1VARCHAR', '1996-12-16', 1, 94.7699966, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR383, 'AROUT', 8, '1996-12-16', '1997-VARCHAR1-13', '1996-12-18', 3, 34.24VARCHARVARCHARVARCHAR17, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR384, 'BERGS', 3, '1996-12-16', '1997-VARCHAR1-13', '1996-12-2VARCHAR', 3, 168.639999, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR385, 'SPLIR', 1, '1996-12-17', '1997-VARCHAR1-14', '1996-12-23', 2, 3VARCHAR.9599991, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR386, 'FAMIA', 9, '1996-12-18', '1997-VARCHAR1-VARCHAR1', '1996-12-25', 3, 13.9899998, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', 'VARCHAR5442-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR387, 'SANTG', 1, '1996-12-18', '1997-VARCHAR1-15', '1996-12-2VARCHAR', 2, 93.6299973, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '411VARCHAR', 'Norway');
INSERT INTO orders VALUES (1VARCHAR388, 'SEVES', 2, '1996-12-19', '1997-VARCHAR1-16', '1996-12-2VARCHAR', 1, 34.86VARCHARVARCHARVARCHARVARCHAR6, 'Seven Seas Imports', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (1VARCHAR389, 'BOTTM', 4, '1996-12-2VARCHAR', '1997-VARCHAR1-17', '1996-12-24', 2, 47.4199982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR39VARCHAR, 'ERNSH', 6, '1996-12-23', '1997-VARCHAR1-2VARCHAR', '1996-12-26', 1, 126.379997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR391, 'DRACD', 3, '1996-12-23', '1997-VARCHAR1-2VARCHAR', '1996-12-31', 3, 5.44999981, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52VARCHAR66', 'Germany');
INSERT INTO orders VALUES (1VARCHAR392, 'PICCO', 2, '1996-12-24', '1997-VARCHAR1-21', '1997-VARCHAR1-VARCHAR1', 3, 122.459999, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR393, 'SAVEA', 1, '1996-12-25', '1997-VARCHAR1-22', '1997-VARCHAR1-VARCHAR3', 3, 126.559998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR394, 'HUNGC', 1, '1996-12-25', '1997-VARCHAR1-22', '1997-VARCHAR1-VARCHAR3', 3, 3VARCHAR.34VARCHARVARCHARVARCHARVARCHAR2, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (1VARCHAR395, 'HILAA', 6, '1996-12-26', '1997-VARCHAR1-23', '1997-VARCHAR1-VARCHAR3', 1, 184.41VARCHARVARCHARVARCHAR4, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR396, 'FRANK', 1, '1996-12-27', '1997-VARCHAR1-1VARCHAR', '1997-VARCHAR1-VARCHAR6', 3, 135.35VARCHARVARCHARVARCHAR6, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR397, 'PRINI', 5, '1996-12-27', '1997-VARCHAR1-24', '1997-VARCHAR1-VARCHAR2', 1, 6VARCHAR.2599983, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR398, 'SAVEA', 2, '1996-12-3VARCHAR', '1997-VARCHAR1-27', '1997-VARCHAR1-VARCHAR9', 3, 89.16VARCHARVARCHARVARCHAR37, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR399, 'VAFFE', 8, '1996-12-31', '1997-VARCHAR1-14', '1997-VARCHAR1-VARCHAR8', 3, 27.36VARCHARVARCHARVARCHARVARCHAR6, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR4VARCHARVARCHAR, 'EASTC', 1, '1997-VARCHAR1-VARCHAR1', '1997-VARCHAR1-29', '1997-VARCHAR1-16', 3, 83.93VARCHARVARCHARVARCHARVARCHAR3, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (1VARCHAR4VARCHAR1, 'RATTC', 1, '1997-VARCHAR1-VARCHAR1', '1997-VARCHAR1-29', '1997-VARCHAR1-1VARCHAR', 1, 12.51VARCHARVARCHARVARCHARVARCHAR2, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR4VARCHAR2, 'ERNSH', 8, '1997-VARCHAR1-VARCHAR2', '1997-VARCHAR2-13', '1997-VARCHAR1-1VARCHAR', 2, 67.8799973, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR4VARCHAR3, 'ERNSH', 4, '1997-VARCHAR1-VARCHAR3', '1997-VARCHAR1-31', '1997-VARCHAR1-VARCHAR9', 3, 73.79VARCHARVARCHARVARCHARVARCHAR9, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR4VARCHAR4, 'MAGAA', 2, '1997-VARCHAR1-VARCHAR3', '1997-VARCHAR1-31', '1997-VARCHAR1-VARCHAR8', 1, 155.97VARCHARVARCHARVARCHAR1, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR4VARCHAR5, 'LINOD', 1, '1997-VARCHAR1-VARCHAR6', '1997-VARCHAR2-VARCHAR3', '1997-VARCHAR1-22', 1, 34.8199997, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR4VARCHAR6, 'QUEEN', 7, '1997-VARCHAR1-VARCHAR7', '1997-VARCHAR2-18', '1997-VARCHAR1-13', 1, 1VARCHAR8.VARCHAR4VARCHARVARCHARVARCHAR1, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR4VARCHAR7, 'OTTIK', 2, '1997-VARCHAR1-VARCHAR7', '1997-VARCHAR2-VARCHAR4', '1997-VARCHAR1-3VARCHAR', 2, 91.48VARCHARVARCHARVARCHAR34, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (1VARCHAR4VARCHAR8, 'FOLIG', 8, '1997-VARCHAR1-VARCHAR8', '1997-VARCHAR2-VARCHAR5', '1997-VARCHAR1-14', 1, 11.26VARCHARVARCHARVARCHARVARCHAR2, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR4VARCHAR9, 'OCEAN', 3, '1997-VARCHAR1-VARCHAR9', '1997-VARCHAR2-VARCHAR6', '1997-VARCHAR1-14', 1, 29.8299999, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 2VARCHAR-A', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR41VARCHAR, 'BOTTM', 3, '1997-VARCHAR1-1VARCHAR', '1997-VARCHAR2-VARCHAR7', '1997-VARCHAR1-15', 3, 2.4VARCHARVARCHARVARCHARVARCHARVARCHAR1, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR411, 'BOTTM', 9, '1997-VARCHAR1-1VARCHAR', '1997-VARCHAR2-VARCHAR7', '1997-VARCHAR1-21', 3, 23.6499996, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR412, 'WARTH', 8, '1997-VARCHAR1-13', '1997-VARCHAR2-1VARCHAR', '1997-VARCHAR1-15', 2, 3.76999998, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR413, 'LAMAI', 3, '1997-VARCHAR1-14', '1997-VARCHAR2-11', '1997-VARCHAR1-16', 2, 95.66VARCHARVARCHARVARCHAR37, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR414, 'FAMIA', 2, '1997-VARCHAR1-14', '1997-VARCHAR2-11', '1997-VARCHAR1-17', 3, 21.4799995, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', 'VARCHAR5442-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR415, 'HUNGC', 3, '1997-VARCHAR1-15', '1997-VARCHAR2-12', '1997-VARCHAR1-24', 1, VARCHAR.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR3, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (1VARCHAR416, 'WARTH', 8, '1997-VARCHAR1-16', '1997-VARCHAR2-13', '1997-VARCHAR1-27', 3, 22.7199993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR417, 'SIMOB', 4, '1997-VARCHAR1-16', '1997-VARCHAR2-13', '1997-VARCHAR1-28', 3, 7VARCHAR.29VARCHARVARCHARVARCHARVARCHAR9, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR418, 'QUICK', 4, '1997-VARCHAR1-17', '1997-VARCHAR2-14', '1997-VARCHAR1-24', 1, 17.5499992, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR419, 'RICSU', 4, '1997-VARCHAR1-2VARCHAR', '1997-VARCHAR2-17', '1997-VARCHAR1-3VARCHAR', 2, 137.35VARCHARVARCHARVARCHAR6, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR42VARCHAR, 'WELLI', 3, '1997-VARCHAR1-21', '1997-VARCHAR2-18', '1997-VARCHAR1-27', 1, 44.1199989, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR421, 'QUEDE', 8, '1997-VARCHAR1-21', '1997-VARCHAR3-VARCHAR4', '1997-VARCHAR1-27', 1, 99.23VARCHARVARCHARVARCHAR34, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR422, 'FRANS', 2, '1997-VARCHAR1-22', '1997-VARCHAR2-19', '1997-VARCHAR1-31', 1, 3.VARCHAR1999998, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '1VARCHAR1VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR423, 'GOURL', 6, '1997-VARCHAR1-23', '1997-VARCHAR2-VARCHAR6', '1997-VARCHAR2-24', 3, 24.5, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR424, 'MEREP', 7, '1997-VARCHAR1-23', '1997-VARCHAR2-2VARCHAR', '1997-VARCHAR1-27', 2, 37VARCHAR.6VARCHAR9985, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR425, 'LAMAI', 6, '1997-VARCHAR1-24', '1997-VARCHAR2-21', '1997-VARCHAR2-14', 2, 7.92999983, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR426, 'GALED', 4, '1997-VARCHAR1-27', '1997-VARCHAR2-24', '1997-VARCHAR2-VARCHAR6', 1, 18.69VARCHARVARCHARVARCHARVARCHAR5, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8VARCHAR22', 'Spain');
INSERT INTO orders VALUES (1VARCHAR427, 'PICCO', 4, '1997-VARCHAR1-27', '1997-VARCHAR2-24', '1997-VARCHAR3-VARCHAR3', 2, 31.29VARCHARVARCHARVARCHARVARCHAR9, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR428, 'REGGC', 7, '1997-VARCHAR1-28', '1997-VARCHAR2-25', '1997-VARCHAR2-VARCHAR4', 1, 11.VARCHAR9VARCHARVARCHARVARCHARVARCHAR2, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR429, 'HUNGO', 3, '1997-VARCHAR1-29', '1997-VARCHAR3-12', '1997-VARCHAR2-VARCHAR7', 2, 56.63VARCHARVARCHARVARCHAR11, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR43VARCHAR, 'ERNSH', 4, '1997-VARCHAR1-3VARCHAR', '1997-VARCHAR2-13', '1997-VARCHAR2-VARCHAR3', 1, 458.779999, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR431, 'BOTTM', 4, '1997-VARCHAR1-3VARCHAR', '1997-VARCHAR2-13', '1997-VARCHAR2-VARCHAR7', 2, 44.1699982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR432, 'SPLIR', 3, '1997-VARCHAR1-31', '1997-VARCHAR2-14', '1997-VARCHAR2-VARCHAR7', 2, 4.34VARCHARVARCHARVARCHARVARCHAR15, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR433, 'PRINI', 3, '1997-VARCHAR2-VARCHAR3', '1997-VARCHAR3-VARCHAR3', '1997-VARCHAR3-VARCHAR4', 3, 73.83VARCHARVARCHARVARCHAR18, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR434, 'FOLKO', 3, '1997-VARCHAR2-VARCHAR3', '1997-VARCHAR3-VARCHAR3', '1997-VARCHAR2-13', 2, 17.92VARCHARVARCHARVARCHARVARCHAR1, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR435, 'CONSH', 8, '1997-VARCHAR2-VARCHAR4', '1997-VARCHAR3-18', '1997-VARCHAR2-VARCHAR7', 2, 9.21VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES (1VARCHAR436, 'BLONP', 3, '1997-VARCHAR2-VARCHAR5', '1997-VARCHAR3-VARCHAR5', '1997-VARCHAR2-11', 2, 156.66VARCHARVARCHARVARCHAR4, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR437, 'WARTH', 8, '1997-VARCHAR2-VARCHAR5', '1997-VARCHAR3-VARCHAR5', '1997-VARCHAR2-12', 1, 19.9699993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR438, 'TOMSP', 3, '1997-VARCHAR2-VARCHAR6', '1997-VARCHAR3-VARCHAR6', '1997-VARCHAR2-14', 2, 8.23999977, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44VARCHAR87', 'Germany');
INSERT INTO orders VALUES (1VARCHAR439, 'MEREP', 6, '1997-VARCHAR2-VARCHAR7', '1997-VARCHAR3-VARCHAR7', '1997-VARCHAR2-1VARCHAR', 3, 4.VARCHAR7VARCHARVARCHARVARCHARVARCHAR17, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR44VARCHAR, 'SAVEA', 4, '1997-VARCHAR2-1VARCHAR', '1997-VARCHAR3-1VARCHAR', '1997-VARCHAR2-28', 2, 86.5299988, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR441, 'OLDWO', 3, '1997-VARCHAR2-1VARCHAR', '1997-VARCHAR3-24', '1997-VARCHAR3-14', 2, 73.VARCHAR199966, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (1VARCHAR442, 'ERNSH', 3, '1997-VARCHAR2-11', '1997-VARCHAR3-11', '1997-VARCHAR2-18', 2, 47.9399986, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR443, 'REGGC', 8, '1997-VARCHAR2-12', '1997-VARCHAR3-12', '1997-VARCHAR2-14', 1, 13.9499998, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR444, 'BERGS', 3, '1997-VARCHAR2-12', '1997-VARCHAR3-12', '1997-VARCHAR2-21', 3, 3.5, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR445, 'BERGS', 3, '1997-VARCHAR2-13', '1997-VARCHAR3-13', '1997-VARCHAR2-2VARCHAR', 1, 9.3VARCHARVARCHARVARCHARVARCHARVARCHAR19, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR446, 'TOMSP', 6, '1997-VARCHAR2-14', '1997-VARCHAR3-14', '1997-VARCHAR2-19', 1, 14.68VARCHARVARCHARVARCHARVARCHAR3, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44VARCHAR87', 'Germany');
INSERT INTO orders VALUES (1VARCHAR447, 'RICAR', 4, '1997-VARCHAR2-14', '1997-VARCHAR3-14', '1997-VARCHAR3-VARCHAR7', 2, 68.66VARCHARVARCHARVARCHAR37, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR448, 'RANCH', 4, '1997-VARCHAR2-17', '1997-VARCHAR3-17', '1997-VARCHAR2-24', 2, 38.8199997, 'Rancho grande', 'Av. del Libertador 9VARCHARVARCHAR', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR449, 'BLONP', 3, '1997-VARCHAR2-18', '1997-VARCHAR3-18', '1997-VARCHAR2-27', 2, 53.2999992, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR45VARCHAR, 'VICTE', 8, '1997-VARCHAR2-19', '1997-VARCHAR3-19', '1997-VARCHAR3-11', 2, 7.23VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR451, 'QUICK', 4, '1997-VARCHAR2-19', '1997-VARCHAR3-VARCHAR5', '1997-VARCHAR3-12', 3, 189.VARCHAR89996, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR452, 'SAVEA', 8, '1997-VARCHAR2-2VARCHAR', '1997-VARCHAR3-2VARCHAR', '1997-VARCHAR2-26', 1, 14VARCHAR.259995, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR453, 'AROUT', 1, '1997-VARCHAR2-21', '1997-VARCHAR3-21', '1997-VARCHAR2-26', 2, 25.36VARCHARVARCHARVARCHARVARCHAR6, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR454, 'LAMAI', 4, '1997-VARCHAR2-21', '1997-VARCHAR3-21', '1997-VARCHAR2-25', 3, 2.74VARCHARVARCHARVARCHARVARCHARVARCHAR1, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR455, 'WARTH', 8, '1997-VARCHAR2-24', '1997-VARCHAR4-VARCHAR7', '1997-VARCHAR3-VARCHAR3', 2, 18VARCHAR.449997, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR456, 'KOENE', 8, '1997-VARCHAR2-25', '1997-VARCHAR4-VARCHAR8', '1997-VARCHAR2-28', 2, 8.11999989, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR457, 'KOENE', 2, '1997-VARCHAR2-25', '1997-VARCHAR3-25', '1997-VARCHAR3-VARCHAR3', 1, 11.5699997, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR458, 'SUPRD', 7, '1997-VARCHAR2-26', '1997-VARCHAR3-26', '1997-VARCHAR3-VARCHAR4', 3, 147.VARCHAR59998, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR459, 'VICTE', 4, '1997-VARCHAR2-27', '1997-VARCHAR3-27', '1997-VARCHAR2-28', 2, 25.VARCHAR9VARCHARVARCHARVARCHARVARCHAR2, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR46VARCHAR, 'FOLKO', 8, '1997-VARCHAR2-28', '1997-VARCHAR3-28', '1997-VARCHAR3-VARCHAR3', 1, 16.27VARCHARVARCHARVARCHARVARCHAR5, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR461, 'LILAS', 1, '1997-VARCHAR2-28', '1997-VARCHAR3-28', '1997-VARCHAR3-VARCHAR5', 3, 148.61VARCHARVARCHARVARCHAR1, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR462, 'CONSH', 2, '1997-VARCHAR3-VARCHAR3', '1997-VARCHAR3-31', '1997-VARCHAR3-18', 1, 6.17VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES (1VARCHAR463, 'SUPRD', 5, '1997-VARCHAR3-VARCHAR4', '1997-VARCHAR4-VARCHAR1', '1997-VARCHAR3-VARCHAR6', 3, 14.7799997, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR464, 'FURIB', 4, '1997-VARCHAR3-VARCHAR4', '1997-VARCHAR4-VARCHAR1', '1997-VARCHAR3-14', 2, 89, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR465, 'VAFFE', 1, '1997-VARCHAR3-VARCHAR5', '1997-VARCHAR4-VARCHAR2', '1997-VARCHAR3-14', 3, 145.VARCHAR39993, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR466, 'COMMI', 4, '1997-VARCHAR3-VARCHAR6', '1997-VARCHAR4-VARCHAR3', '1997-VARCHAR3-13', 1, 11.93VARCHARVARCHARVARCHARVARCHAR3, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', 'VARCHAR5432-VARCHAR43', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR467, 'MAGAA', 8, '1997-VARCHAR3-VARCHAR6', '1997-VARCHAR4-VARCHAR3', '1997-VARCHAR3-11', 2, 4.92999983, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR468, 'KOENE', 3, '1997-VARCHAR3-VARCHAR7', '1997-VARCHAR4-VARCHAR4', '1997-VARCHAR3-12', 3, 44.1199989, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR469, 'WHITC', 1, '1997-VARCHAR3-1VARCHAR', '1997-VARCHAR4-VARCHAR7', '1997-VARCHAR3-14', 1, 6VARCHAR.18VARCHARVARCHARVARCHARVARCHAR3, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR47VARCHAR, 'BONAP', 4, '1997-VARCHAR3-11', '1997-VARCHAR4-VARCHAR8', '1997-VARCHAR3-14', 2, 64.5599976, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR471, 'BSBEV', 2, '1997-VARCHAR3-11', '1997-VARCHAR4-VARCHAR8', '1997-VARCHAR3-18', 3, 45.59VARCHARVARCHARVARCHARVARCHAR2, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (1VARCHAR472, 'SEVES', 8, '1997-VARCHAR3-12', '1997-VARCHAR4-VARCHAR9', '1997-VARCHAR3-19', 1, 4.19999981, 'Seven Seas Imports', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (1VARCHAR473, 'ISLAT', 1, '1997-VARCHAR3-13', '1997-VARCHAR3-27', '1997-VARCHAR3-21', 3, 16.37VARCHARVARCHARVARCHARVARCHAR8, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR474, 'PERIC', 5, '1997-VARCHAR3-13', '1997-VARCHAR4-1VARCHAR', '1997-VARCHAR3-21', 2, 83.4899979, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR475, 'SUPRD', 9, '1997-VARCHAR3-14', '1997-VARCHAR4-11', '1997-VARCHAR4-VARCHAR4', 1, 68.5199966, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR476, 'HILAA', 8, '1997-VARCHAR3-17', '1997-VARCHAR4-14', '1997-VARCHAR3-24', 3, 4.4VARCHAR999985, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR477, 'PRINI', 5, '1997-VARCHAR3-17', '1997-VARCHAR4-14', '1997-VARCHAR3-25', 2, 13.VARCHAR2VARCHARVARCHARVARCHARVARCHAR5, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR478, 'VICTE', 2, '1997-VARCHAR3-18', '1997-VARCHAR4-VARCHAR1', '1997-VARCHAR3-26', 3, 4.8VARCHAR999994, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR479, 'RATTC', 3, '1997-VARCHAR3-19', '1997-VARCHAR4-16', '1997-VARCHAR3-21', 3, 7VARCHAR8.95VARCHARVARCHAR12, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR48VARCHAR, 'FOLIG', 6, '1997-VARCHAR3-2VARCHAR', '1997-VARCHAR4-17', '1997-VARCHAR3-24', 2, 1.35VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR481, 'RICAR', 8, '1997-VARCHAR3-2VARCHAR', '1997-VARCHAR4-17', '1997-VARCHAR3-25', 2, 64.33VARCHARVARCHARVARCHAR18, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR482, 'LAZYK', 1, '1997-VARCHAR3-21', '1997-VARCHAR4-18', '1997-VARCHAR4-1VARCHAR', 3, 7.48VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO orders VALUES (1VARCHAR483, 'WHITC', 7, '1997-VARCHAR3-24', '1997-VARCHAR4-21', '1997-VARCHAR4-25', 2, 15.2799997, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR484, 'BSBEV', 3, '1997-VARCHAR3-24', '1997-VARCHAR4-21', '1997-VARCHAR4-VARCHAR1', 3, 6.88VARCHARVARCHARVARCHARVARCHAR11, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (1VARCHAR485, 'LINOD', 4, '1997-VARCHAR3-25', '1997-VARCHAR4-VARCHAR8', '1997-VARCHAR3-31', 2, 64.4499969, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR486, 'HILAA', 1, '1997-VARCHAR3-26', '1997-VARCHAR4-23', '1997-VARCHAR4-VARCHAR2', 2, 3VARCHAR.53VARCHARVARCHARVARCHARVARCHAR7, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR487, 'QUEEN', 2, '1997-VARCHAR3-26', '1997-VARCHAR4-23', '1997-VARCHAR3-28', 2, 71.VARCHAR699997, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR488, 'FRANK', 8, '1997-VARCHAR3-27', '1997-VARCHAR4-24', '1997-VARCHAR4-VARCHAR2', 2, 4.92999983, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR489, 'PICCO', 6, '1997-VARCHAR3-28', '1997-VARCHAR4-25', '1997-VARCHAR4-VARCHAR9', 2, 5.28999996, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR49VARCHAR, 'HILAA', 7, '1997-VARCHAR3-31', '1997-VARCHAR4-28', '1997-VARCHAR4-VARCHAR3', 2, 21VARCHAR.19VARCHARVARCHARVARCHAR2, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR491, 'FURIB', 8, '1997-VARCHAR3-31', '1997-VARCHAR4-28', '1997-VARCHAR4-VARCHAR8', 3, 16.9599991, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR492, 'BOTTM', 3, '1997-VARCHAR4-VARCHAR1', '1997-VARCHAR4-29', '1997-VARCHAR4-11', 1, 62.8899994, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR493, 'LAMAI', 4, '1997-VARCHAR4-VARCHAR2', '1997-VARCHAR4-3VARCHAR', '1997-VARCHAR4-1VARCHAR', 3, 1VARCHAR.64VARCHARVARCHARVARCHARVARCHAR3, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR494, 'COMMI', 4, '1997-VARCHAR4-VARCHAR2', '1997-VARCHAR4-3VARCHAR', '1997-VARCHAR4-VARCHAR9', 2, 65.9899979, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', 'VARCHAR5432-VARCHAR43', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR495, 'LAUGB', 3, '1997-VARCHAR4-VARCHAR3', '1997-VARCHAR5-VARCHAR1', '1997-VARCHAR4-11', 3, 4.65VARCHARVARCHARVARCHARVARCHAR1, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES (1VARCHAR496, 'TRADH', 7, '1997-VARCHAR4-VARCHAR4', '1997-VARCHAR5-VARCHAR2', '1997-VARCHAR4-VARCHAR7', 2, 46.77VARCHARVARCHARVARCHARVARCHAR5, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', 'VARCHAR5634-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR497, 'LEHMS', 7, '1997-VARCHAR4-VARCHAR4', '1997-VARCHAR5-VARCHAR2', '1997-VARCHAR4-VARCHAR7', 1, 36.2VARCHAR99991, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR498, 'HILAA', 8, '1997-VARCHAR4-VARCHAR7', '1997-VARCHAR5-VARCHAR5', '1997-VARCHAR4-11', 2, 29.75, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR499, 'LILAS', 4, '1997-VARCHAR4-VARCHAR8', '1997-VARCHAR5-VARCHAR6', '1997-VARCHAR4-16', 2, 1VARCHAR2.VARCHAR19997, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR5VARCHARVARCHAR, 'LAMAI', 6, '1997-VARCHAR4-VARCHAR9', '1997-VARCHAR5-VARCHAR7', '1997-VARCHAR4-17', 1, 42.68VARCHARVARCHARVARCHARVARCHAR3, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR5VARCHAR1, 'BLAUS', 9, '1997-VARCHAR4-VARCHAR9', '1997-VARCHAR5-VARCHAR7', '1997-VARCHAR4-16', 3, 8.85VARCHARVARCHARVARCHARVARCHAR38, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '683VARCHAR6', 'Germany');
INSERT INTO orders VALUES (1VARCHAR5VARCHAR2, 'PERIC', 2, '1997-VARCHAR4-1VARCHAR', '1997-VARCHAR5-VARCHAR8', '1997-VARCHAR4-29', 1, 69.3199997, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR5VARCHAR3, 'HUNGO', 6, '1997-VARCHAR4-11', '1997-VARCHAR5-VARCHAR9', '1997-VARCHAR4-16', 2, 16.7399998, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR5VARCHAR4, 'WHITC', 4, '1997-VARCHAR4-11', '1997-VARCHAR5-VARCHAR9', '1997-VARCHAR4-18', 3, 59.13VARCHARVARCHARVARCHAR11, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR5VARCHAR5, 'MEREP', 3, '1997-VARCHAR4-14', '1997-VARCHAR5-12', '1997-VARCHAR4-21', 3, 7.13VARCHARVARCHARVARCHARVARCHAR11, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR5VARCHAR6, 'KOENE', 9, '1997-VARCHAR4-15', '1997-VARCHAR5-13', '1997-VARCHAR5-VARCHAR2', 2, 21.19VARCHARVARCHARVARCHARVARCHAR5, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR5VARCHAR7, 'ANTON', 7, '1997-VARCHAR4-15', '1997-VARCHAR5-13', '1997-VARCHAR4-22', 1, 47.45VARCHARVARCHARVARCHARVARCHAR8, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, 'VARCHAR5VARCHAR23', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR5VARCHAR8, 'OTTIK', 1, '1997-VARCHAR4-16', '1997-VARCHAR5-14', '1997-VARCHAR5-13', 2, 4.98999977, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (1VARCHAR5VARCHAR9, 'BLAUS', 4, '1997-VARCHAR4-17', '1997-VARCHAR5-15', '1997-VARCHAR4-29', 1, VARCHAR.15VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR6, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '683VARCHAR6', 'Germany');
INSERT INTO orders VALUES (1VARCHAR51VARCHAR, 'SAVEA', 6, '1997-VARCHAR4-18', '1997-VARCHAR5-16', '1997-VARCHAR4-28', 3, 367.63VARCHARVARCHARVARCHAR5, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR511, 'BONAP', 4, '1997-VARCHAR4-18', '1997-VARCHAR5-16', '1997-VARCHAR4-21', 3, 35VARCHAR.64VARCHARVARCHAR15, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR512, 'FAMIA', 7, '1997-VARCHAR4-21', '1997-VARCHAR5-19', '1997-VARCHAR4-24', 2, 3.52999997, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', 'VARCHAR5442-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR513, 'WANDK', 7, '1997-VARCHAR4-22', '1997-VARCHAR6-VARCHAR3', '1997-VARCHAR4-28', 1, 1VARCHAR5.65VARCHARVARCHARVARCHAR2, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (1VARCHAR514, 'ERNSH', 3, '1997-VARCHAR4-22', '1997-VARCHAR5-2VARCHAR', '1997-VARCHAR5-16', 2, 789.95VARCHARVARCHAR12, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR515, 'QUICK', 2, '1997-VARCHAR4-23', '1997-VARCHAR5-VARCHAR7', '1997-VARCHAR5-23', 1, 2VARCHAR4.47VARCHARVARCHARVARCHAR1, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR516, 'HUNGO', 2, '1997-VARCHAR4-24', '1997-VARCHAR5-22', '1997-VARCHAR5-VARCHAR1', 3, 62.7799988, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR517, 'NORTS', 3, '1997-VARCHAR4-24', '1997-VARCHAR5-22', '1997-VARCHAR4-29', 3, 32.VARCHAR699997, 'North/South', 'South House 3VARCHARVARCHAR Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES (1VARCHAR518, 'TORTU', 4, '1997-VARCHAR4-25', '1997-VARCHAR5-VARCHAR9', '1997-VARCHAR5-VARCHAR5', 2, 218.149994, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR519, 'CHOPS', 6, '1997-VARCHAR4-28', '1997-VARCHAR5-26', '1997-VARCHAR5-VARCHAR1', 3, 91.76VARCHARVARCHARVARCHAR21, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3VARCHAR12', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR52VARCHAR, 'SANTG', 7, '1997-VARCHAR4-29', '1997-VARCHAR5-27', '1997-VARCHAR5-VARCHAR1', 1, 13.3699999, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '411VARCHAR', 'Norway');
INSERT INTO orders VALUES (1VARCHAR521, 'CACTU', 8, '1997-VARCHAR4-29', '1997-VARCHAR5-27', '1997-VARCHAR5-VARCHAR2', 2, 17.2199993, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR522, 'LEHMS', 4, '1997-VARCHAR4-3VARCHAR', '1997-VARCHAR5-28', '1997-VARCHAR5-VARCHAR6', 1, 45.33VARCHARVARCHARVARCHAR18, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR523, 'SEVES', 7, '1997-VARCHAR5-VARCHAR1', '1997-VARCHAR5-29', '1997-VARCHAR5-3VARCHAR', 2, 77.6299973, 'Seven Seas Imports', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (1VARCHAR524, 'BERGS', 1, '1997-VARCHAR5-VARCHAR1', '1997-VARCHAR5-29', '1997-VARCHAR5-VARCHAR7', 2, 244.789993, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR525, 'BONAP', 1, '1997-VARCHAR5-VARCHAR2', '1997-VARCHAR5-3VARCHAR', '1997-VARCHAR5-23', 2, 11.VARCHAR6VARCHARVARCHARVARCHARVARCHAR4, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR526, 'WARTH', 4, '1997-VARCHAR5-VARCHAR5', '1997-VARCHAR6-VARCHAR2', '1997-VARCHAR5-15', 2, 58.59VARCHARVARCHARVARCHARVARCHAR2, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR527, 'QUICK', 7, '1997-VARCHAR5-VARCHAR5', '1997-VARCHAR6-VARCHAR2', '1997-VARCHAR5-VARCHAR7', 1, 41.9VARCHARVARCHARVARCHARVARCHAR15, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR528, 'GREAL', 6, '1997-VARCHAR5-VARCHAR6', '1997-VARCHAR5-2VARCHAR', '1997-VARCHAR5-VARCHAR9', 2, 3.3499999, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (1VARCHAR529, 'MAISD', 5, '1997-VARCHAR5-VARCHAR7', '1997-VARCHAR6-VARCHAR4', '1997-VARCHAR5-VARCHAR9', 2, 66.69VARCHARVARCHARVARCHAR24, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-118VARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR53VARCHAR, 'PICCO', 3, '1997-VARCHAR5-VARCHAR8', '1997-VARCHAR6-VARCHAR5', '1997-VARCHAR5-12', 2, 339.22VARCHARVARCHARVARCHAR1, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR531, 'OCEAN', 7, '1997-VARCHAR5-VARCHAR8', '1997-VARCHAR6-VARCHAR5', '1997-VARCHAR5-19', 1, 8.11999989, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 2VARCHAR-A', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR532, 'EASTC', 7, '1997-VARCHAR5-VARCHAR9', '1997-VARCHAR6-VARCHAR6', '1997-VARCHAR5-12', 3, 74.4599991, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (1VARCHAR533, 'FOLKO', 8, '1997-VARCHAR5-12', '1997-VARCHAR6-VARCHAR9', '1997-VARCHAR5-22', 1, 188.VARCHAR39993, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR534, 'LEHMS', 8, '1997-VARCHAR5-12', '1997-VARCHAR6-VARCHAR9', '1997-VARCHAR5-14', 2, 27.94VARCHARVARCHARVARCHARVARCHAR5, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR535, 'ANTON', 4, '1997-VARCHAR5-13', '1997-VARCHAR6-1VARCHAR', '1997-VARCHAR5-21', 1, 15.64VARCHARVARCHARVARCHARVARCHAR3, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, 'VARCHAR5VARCHAR23', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR536, 'LEHMS', 3, '1997-VARCHAR5-14', '1997-VARCHAR6-11', '1997-VARCHAR6-VARCHAR6', 2, 58.88VARCHARVARCHARVARCHAR11, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR537, 'RICSU', 1, '1997-VARCHAR5-14', '1997-VARCHAR5-28', '1997-VARCHAR5-19', 1, 78.8499985, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR538, 'BSBEV', 9, '1997-VARCHAR5-15', '1997-VARCHAR6-12', '1997-VARCHAR5-16', 3, 4.86999989, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (1VARCHAR539, 'BSBEV', 6, '1997-VARCHAR5-16', '1997-VARCHAR6-13', '1997-VARCHAR5-23', 3, 12.3599997, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (1VARCHAR54VARCHAR, 'QUICK', 3, '1997-VARCHAR5-19', '1997-VARCHAR6-16', '1997-VARCHAR6-13', 3, 1VARCHARVARCHAR7.64VARCHARVARCHAR1, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR541, 'HANAR', 2, '1997-VARCHAR5-19', '1997-VARCHAR6-16', '1997-VARCHAR5-29', 1, 68.65VARCHARVARCHARVARCHAR15, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR542, 'KOENE', 1, '1997-VARCHAR5-2VARCHAR', '1997-VARCHAR6-17', '1997-VARCHAR5-26', 3, 1VARCHAR.9499998, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR543, 'LILAS', 8, '1997-VARCHAR5-21', '1997-VARCHAR6-18', '1997-VARCHAR5-23', 2, 48.1699982, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR544, 'LONEP', 4, '1997-VARCHAR5-21', '1997-VARCHAR6-18', '1997-VARCHAR5-3VARCHAR', 1, 24.9VARCHAR99998, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (1VARCHAR545, 'LAZYK', 8, '1997-VARCHAR5-22', '1997-VARCHAR6-19', '1997-VARCHAR6-26', 2, 11.92VARCHARVARCHARVARCHARVARCHAR1, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO orders VALUES (1VARCHAR546, 'VICTE', 1, '1997-VARCHAR5-23', '1997-VARCHAR6-2VARCHAR', '1997-VARCHAR5-27', 3, 194.72VARCHARVARCHARVARCHAR1, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR547, 'SEVES', 3, '1997-VARCHAR5-23', '1997-VARCHAR6-2VARCHAR', '1997-VARCHAR6-VARCHAR2', 2, 178.429993, 'Seven Seas Imports', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (1VARCHAR548, 'TOMSP', 3, '1997-VARCHAR5-26', '1997-VARCHAR6-23', '1997-VARCHAR6-VARCHAR2', 2, 1.42999995, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44VARCHAR87', 'Germany');
INSERT INTO orders VALUES (1VARCHAR549, 'QUICK', 5, '1997-VARCHAR5-27', '1997-VARCHAR6-1VARCHAR', '1997-VARCHAR5-3VARCHAR', 1, 171.24VARCHARVARCHARVARCHAR5, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR55VARCHAR, 'GODOS', 7, '1997-VARCHAR5-28', '1997-VARCHAR6-25', '1997-VARCHAR6-VARCHAR6', 3, 4.32VARCHARVARCHARVARCHARVARCHAR17, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR551, 'FURIB', 4, '1997-VARCHAR5-28', '1997-VARCHAR7-VARCHAR9', '1997-VARCHAR6-VARCHAR6', 3, 72.9499969, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR552, 'HILAA', 2, '1997-VARCHAR5-29', '1997-VARCHAR6-26', '1997-VARCHAR6-VARCHAR5', 1, 83.22VARCHARVARCHARVARCHAR12, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR553, 'WARTH', 2, '1997-VARCHAR5-3VARCHAR', '1997-VARCHAR6-27', '1997-VARCHAR6-VARCHAR3', 2, 149.49VARCHARVARCHARVARCHAR5, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR554, 'OTTIK', 4, '1997-VARCHAR5-3VARCHAR', '1997-VARCHAR6-27', '1997-VARCHAR6-VARCHAR5', 3, 12VARCHAR.97VARCHARVARCHARVARCHAR1, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (1VARCHAR555, 'SAVEA', 6, '1997-VARCHAR6-VARCHAR2', '1997-VARCHAR6-3VARCHAR', '1997-VARCHAR6-VARCHAR4', 3, 252.49VARCHARVARCHARVARCHAR5, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR556, 'SIMOB', 2, '1997-VARCHAR6-VARCHAR3', '1997-VARCHAR7-15', '1997-VARCHAR6-13', 1, 9.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR557, 'LEHMS', 9, '1997-VARCHAR6-VARCHAR3', '1997-VARCHAR6-17', '1997-VARCHAR6-VARCHAR6', 2, 96.72VARCHARVARCHARVARCHAR12, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR558, 'AROUT', 1, '1997-VARCHAR6-VARCHAR4', '1997-VARCHAR7-VARCHAR2', '1997-VARCHAR6-1VARCHAR', 2, 72.97VARCHARVARCHARVARCHAR12, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR559, 'BLONP', 6, '1997-VARCHAR6-VARCHAR5', '1997-VARCHAR7-VARCHAR3', '1997-VARCHAR6-13', 1, 8.VARCHAR5VARCHARVARCHARVARCHARVARCHAR19, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR56VARCHAR, 'FRANK', 8, '1997-VARCHAR6-VARCHAR6', '1997-VARCHAR7-VARCHAR4', '1997-VARCHAR6-VARCHAR9', 1, 36.65VARCHARVARCHARVARCHAR15, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR561, 'FOLKO', 2, '1997-VARCHAR6-VARCHAR6', '1997-VARCHAR7-VARCHAR4', '1997-VARCHAR6-VARCHAR9', 2, 242.21VARCHARVARCHARVARCHAR7, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR562, 'REGGC', 1, '1997-VARCHAR6-VARCHAR9', '1997-VARCHAR7-VARCHAR7', '1997-VARCHAR6-12', 1, 22.95VARCHARVARCHARVARCHARVARCHAR8, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR563, 'RICAR', 2, '1997-VARCHAR6-1VARCHAR', '1997-VARCHAR7-22', '1997-VARCHAR6-24', 2, 6VARCHAR.43VARCHARVARCHARVARCHARVARCHAR3, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR564, 'RATTC', 4, '1997-VARCHAR6-1VARCHAR', '1997-VARCHAR7-VARCHAR8', '1997-VARCHAR6-16', 3, 13.75, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR565, 'MEREP', 8, '1997-VARCHAR6-11', '1997-VARCHAR7-VARCHAR9', '1997-VARCHAR6-18', 2, 7.15VARCHARVARCHARVARCHARVARCHAR1, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR566, 'BLONP', 9, '1997-VARCHAR6-12', '1997-VARCHAR7-1VARCHAR', '1997-VARCHAR6-18', 1, 88.4VARCHARVARCHARVARCHARVARCHAR15, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR567, 'HUNGO', 1, '1997-VARCHAR6-12', '1997-VARCHAR7-1VARCHAR', '1997-VARCHAR6-17', 1, 33.97VARCHARVARCHARVARCHAR12, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR568, 'GALED', 3, '1997-VARCHAR6-13', '1997-VARCHAR7-11', '1997-VARCHAR7-VARCHAR9', 3, 6.53999996, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8VARCHAR22', 'Spain');
INSERT INTO orders VALUES (1VARCHAR569, 'RATTC', 5, '1997-VARCHAR6-16', '1997-VARCHAR7-14', '1997-VARCHAR7-11', 1, 58.9799995, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR57VARCHAR, 'MEREP', 3, '1997-VARCHAR6-17', '1997-VARCHAR7-15', '1997-VARCHAR6-19', 3, 188.99VARCHARVARCHARVARCHAR5, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR571, 'ERNSH', 8, '1997-VARCHAR6-17', '1997-VARCHAR7-29', '1997-VARCHAR7-VARCHAR4', 3, 26.VARCHAR599995, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR572, 'BERGS', 3, '1997-VARCHAR6-18', '1997-VARCHAR7-16', '1997-VARCHAR6-25', 2, 116.43, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR573, 'ANTON', 7, '1997-VARCHAR6-19', '1997-VARCHAR7-17', '1997-VARCHAR6-2VARCHAR', 3, 84.8399963, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, 'VARCHAR5VARCHAR23', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR574, 'TRAIH', 4, '1997-VARCHAR6-19', '1997-VARCHAR7-17', '1997-VARCHAR6-3VARCHAR', 2, 37.5999985, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98VARCHAR34', 'USA');
INSERT INTO orders VALUES (1VARCHAR575, 'MORGK', 5, '1997-VARCHAR6-2VARCHAR', '1997-VARCHAR7-VARCHAR4', '1997-VARCHAR6-3VARCHAR', 1, 127.339996, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, 'VARCHAR4179', 'Germany');
INSERT INTO orders VALUES (1VARCHAR576, 'TORTU', 3, '1997-VARCHAR6-23', '1997-VARCHAR7-VARCHAR7', '1997-VARCHAR6-3VARCHAR', 3, 18.5599995, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR577, 'TRAIH', 9, '1997-VARCHAR6-23', '1997-VARCHAR8-VARCHAR4', '1997-VARCHAR6-3VARCHAR', 2, 25.4VARCHAR99998, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98VARCHAR34', 'USA');
INSERT INTO orders VALUES (1VARCHAR578, 'BSBEV', 4, '1997-VARCHAR6-24', '1997-VARCHAR7-22', '1997-VARCHAR7-25', 3, 29.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (1VARCHAR579, 'LETSS', 1, '1997-VARCHAR6-25', '1997-VARCHAR7-23', '1997-VARCHAR7-VARCHAR4', 2, 13.7299995, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (1VARCHAR58VARCHAR, 'OTTIK', 4, '1997-VARCHAR6-26', '1997-VARCHAR7-24', '1997-VARCHAR7-VARCHAR1', 3, 75.8899994, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (1VARCHAR581, 'FAMIA', 3, '1997-VARCHAR6-26', '1997-VARCHAR7-24', '1997-VARCHAR7-VARCHAR2', 1, 3.VARCHARVARCHAR999999, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', 'VARCHAR5442-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR582, 'BLAUS', 3, '1997-VARCHAR6-27', '1997-VARCHAR7-25', '1997-VARCHAR7-14', 2, 27.7VARCHAR99991, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '683VARCHAR6', 'Germany');
INSERT INTO orders VALUES (1VARCHAR583, 'WARTH', 2, '1997-VARCHAR6-3VARCHAR', '1997-VARCHAR7-28', '1997-VARCHAR7-VARCHAR4', 2, 7.28VARCHARVARCHARVARCHARVARCHAR21, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR584, 'BLONP', 4, '1997-VARCHAR6-3VARCHAR', '1997-VARCHAR7-28', '1997-VARCHAR7-VARCHAR4', 1, 59.1399994, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR585, 'WELLI', 7, '1997-VARCHAR7-VARCHAR1', '1997-VARCHAR7-29', '1997-VARCHAR7-1VARCHAR', 1, 13.4VARCHAR99998, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR586, 'REGGC', 9, '1997-VARCHAR7-VARCHAR2', '1997-VARCHAR7-3VARCHAR', '1997-VARCHAR7-VARCHAR9', 1, VARCHAR.479999989, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR587, 'QUEDE', 1, '1997-VARCHAR7-VARCHAR2', '1997-VARCHAR7-3VARCHAR', '1997-VARCHAR7-VARCHAR9', 1, 62.52VARCHARVARCHARVARCHARVARCHAR5, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR588, 'QUICK', 2, '1997-VARCHAR7-VARCHAR3', '1997-VARCHAR7-31', '1997-VARCHAR7-1VARCHAR', 3, 194.669998, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR589, 'GREAL', 8, '1997-VARCHAR7-VARCHAR4', '1997-VARCHAR8-VARCHAR1', '1997-VARCHAR7-14', 2, 4.42VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (1VARCHAR59VARCHAR, 'MEREP', 4, '1997-VARCHAR7-VARCHAR7', '1997-VARCHAR8-VARCHAR4', '1997-VARCHAR7-14', 3, 44.77VARCHARVARCHARVARCHARVARCHAR5, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR591, 'VAFFE', 1, '1997-VARCHAR7-VARCHAR7', '1997-VARCHAR7-21', '1997-VARCHAR7-16', 1, 55.9199982, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR592, 'LEHMS', 3, '1997-VARCHAR7-VARCHAR8', '1997-VARCHAR8-VARCHAR5', '1997-VARCHAR7-16', 1, 32.VARCHAR999985, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR593, 'LEHMS', 7, '1997-VARCHAR7-VARCHAR9', '1997-VARCHAR8-VARCHAR6', '1997-VARCHAR8-13', 2, 174.199997, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR594, 'OLDWO', 3, '1997-VARCHAR7-VARCHAR9', '1997-VARCHAR8-VARCHAR6', '1997-VARCHAR7-16', 2, 5.23999977, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (1VARCHAR595, 'ERNSH', 2, '1997-VARCHAR7-1VARCHAR', '1997-VARCHAR8-VARCHAR7', '1997-VARCHAR7-14', 1, 96.7799988, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR596, 'WHITC', 8, '1997-VARCHAR7-11', '1997-VARCHAR8-VARCHAR8', '1997-VARCHAR8-12', 1, 16.34VARCHARVARCHARVARCHARVARCHAR2, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR597, 'PICCO', 7, '1997-VARCHAR7-11', '1997-VARCHAR8-VARCHAR8', '1997-VARCHAR7-18', 3, 35.1199989, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR598, 'RATTC', 1, '1997-VARCHAR7-14', '1997-VARCHAR8-11', '1997-VARCHAR7-18', 3, 44.4199982, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR599, 'BSBEV', 6, '1997-VARCHAR7-15', '1997-VARCHAR8-26', '1997-VARCHAR7-21', 3, 29.9799995, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (1VARCHAR6VARCHARVARCHAR, 'HUNGC', 4, '1997-VARCHAR7-16', '1997-VARCHAR8-13', '1997-VARCHAR7-21', 1, 45.13VARCHARVARCHARVARCHAR11, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (1VARCHAR6VARCHAR1, 'HILAA', 7, '1997-VARCHAR7-16', '1997-VARCHAR8-27', '1997-VARCHAR7-22', 1, 58.2999992, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR6VARCHAR2, 'VAFFE', 8, '1997-VARCHAR7-17', '1997-VARCHAR8-14', '1997-VARCHAR7-22', 2, 2.92VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR6VARCHAR3, 'SAVEA', 8, '1997-VARCHAR7-18', '1997-VARCHAR8-15', '1997-VARCHAR8-VARCHAR8', 2, 48.77VARCHARVARCHARVARCHARVARCHAR5, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR6VARCHAR4, 'FURIB', 1, '1997-VARCHAR7-18', '1997-VARCHAR8-15', '1997-VARCHAR7-29', 1, 7.46VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR6VARCHAR5, 'MEREP', 1, '1997-VARCHAR7-21', '1997-VARCHAR8-18', '1997-VARCHAR7-29', 2, 379.13VARCHARVARCHARVARCHAR5, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR6VARCHAR6, 'TRADH', 4, '1997-VARCHAR7-22', '1997-VARCHAR8-19', '1997-VARCHAR7-31', 3, 79.4VARCHARVARCHARVARCHARVARCHAR15, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', 'VARCHAR5634-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR6VARCHAR7, 'SAVEA', 5, '1997-VARCHAR7-22', '1997-VARCHAR8-19', '1997-VARCHAR7-25', 1, 2VARCHARVARCHAR.24VARCHARVARCHARVARCHAR5, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR6VARCHAR8, 'TOMSP', 4, '1997-VARCHAR7-23', '1997-VARCHAR8-2VARCHAR', '1997-VARCHAR8-VARCHAR1', 2, 27.79VARCHARVARCHARVARCHARVARCHAR9, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44VARCHAR87', 'Germany');
INSERT INTO orders VALUES (1VARCHAR6VARCHAR9, 'DUMON', 7, '1997-VARCHAR7-24', '1997-VARCHAR8-21', '1997-VARCHAR7-3VARCHAR', 2, 1.85VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR61VARCHAR, 'LAMAI', 8, '1997-VARCHAR7-25', '1997-VARCHAR8-22', '1997-VARCHAR8-VARCHAR6', 1, 26.78VARCHARVARCHARVARCHARVARCHAR7, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR611, 'WOLZA', 6, '1997-VARCHAR7-25', '1997-VARCHAR8-22', '1997-VARCHAR8-VARCHAR1', 2, 8VARCHAR.65VARCHARVARCHARVARCHAR15, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, 'VARCHAR1-VARCHAR12', 'Poland');
INSERT INTO orders VALUES (1VARCHAR612, 'SAVEA', 1, '1997-VARCHAR7-28', '1997-VARCHAR8-25', '1997-VARCHAR8-VARCHAR1', 2, 544.VARCHAR8VARCHARVARCHAR17, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR613, 'HILAA', 4, '1997-VARCHAR7-29', '1997-VARCHAR8-26', '1997-VARCHAR8-VARCHAR1', 2, 8.1VARCHAR999966, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR614, 'BLAUS', 8, '1997-VARCHAR7-29', '1997-VARCHAR8-26', '1997-VARCHAR8-VARCHAR1', 3, 1.92999995, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '683VARCHAR6', 'Germany');
INSERT INTO orders VALUES (1VARCHAR615, 'WILMK', 2, '1997-VARCHAR7-3VARCHAR', '1997-VARCHAR8-27', '1997-VARCHAR8-VARCHAR6', 3, VARCHAR.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '2124VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR616, 'GREAL', 1, '1997-VARCHAR7-31', '1997-VARCHAR8-28', '1997-VARCHAR8-VARCHAR5', 2, 116.529999, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (1VARCHAR617, 'GREAL', 4, '1997-VARCHAR7-31', '1997-VARCHAR8-28', '1997-VARCHAR8-VARCHAR4', 2, 18.53VARCHARVARCHARVARCHARVARCHAR7, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (1VARCHAR618, 'MEREP', 1, '1997-VARCHAR8-VARCHAR1', '1997-VARCHAR9-12', '1997-VARCHAR8-VARCHAR8', 1, 154.679993, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR619, 'MEREP', 3, '1997-VARCHAR8-VARCHAR4', '1997-VARCHAR9-VARCHAR1', '1997-VARCHAR8-VARCHAR7', 3, 91.VARCHAR5VARCHARVARCHARVARCHAR31, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR62VARCHAR, 'LAUGB', 2, '1997-VARCHAR8-VARCHAR5', '1997-VARCHAR9-VARCHAR2', '1997-VARCHAR8-14', 3, VARCHAR.939999998, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES (1VARCHAR621, 'ISLAT', 4, '1997-VARCHAR8-VARCHAR5', '1997-VARCHAR9-VARCHAR2', '1997-VARCHAR8-11', 2, 23.7299995, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR622, 'RICAR', 4, '1997-VARCHAR8-VARCHAR6', '1997-VARCHAR9-VARCHAR3', '1997-VARCHAR8-11', 3, 5VARCHAR.97VARCHARVARCHARVARCHAR12, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR623, 'FRANK', 8, '1997-VARCHAR8-VARCHAR7', '1997-VARCHAR9-VARCHAR4', '1997-VARCHAR8-12', 2, 97.18VARCHARVARCHARVARCHARVARCHAR3, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR624, 'THECR', 4, '1997-VARCHAR8-VARCHAR7', '1997-VARCHAR9-VARCHAR4', '1997-VARCHAR8-19', 2, 94.8VARCHARVARCHARVARCHARVARCHAR31, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '598VARCHAR1', 'USA');
INSERT INTO orders VALUES (1VARCHAR625, 'ANATR', 3, '1997-VARCHAR8-VARCHAR8', '1997-VARCHAR9-VARCHAR5', '1997-VARCHAR8-14', 1, 43.9VARCHARVARCHARVARCHARVARCHAR15, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, 'VARCHAR5VARCHAR21', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR626, 'BERGS', 1, '1997-VARCHAR8-11', '1997-VARCHAR9-VARCHAR8', '1997-VARCHAR8-2VARCHAR', 2, 138.69VARCHARVARCHARVARCHAR2, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR627, 'SAVEA', 8, '1997-VARCHAR8-11', '1997-VARCHAR9-22', '1997-VARCHAR8-21', 3, 1VARCHAR7.459999, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR628, 'BLONP', 4, '1997-VARCHAR8-12', '1997-VARCHAR9-VARCHAR9', '1997-VARCHAR8-2VARCHAR', 3, 3VARCHAR.36VARCHARVARCHARVARCHARVARCHAR6, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR629, 'GODOS', 4, '1997-VARCHAR8-12', '1997-VARCHAR9-VARCHAR9', '1997-VARCHAR8-2VARCHAR', 3, 85.4599991, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR63VARCHAR, 'KOENE', 1, '1997-VARCHAR8-13', '1997-VARCHAR9-1VARCHAR', '1997-VARCHAR8-19', 2, 32.3499985, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR631, 'LAMAI', 8, '1997-VARCHAR8-14', '1997-VARCHAR9-11', '1997-VARCHAR8-15', 1, VARCHAR.87VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR5, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR632, 'WANDK', 8, '1997-VARCHAR8-14', '1997-VARCHAR9-11', '1997-VARCHAR8-19', 1, 41.38VARCHARVARCHARVARCHAR11, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (1VARCHAR633, 'ERNSH', 7, '1997-VARCHAR8-15', '1997-VARCHAR9-12', '1997-VARCHAR8-18', 3, 477.899994, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR634, 'FOLIG', 4, '1997-VARCHAR8-15', '1997-VARCHAR9-12', '1997-VARCHAR8-21', 3, 487.38VARCHARVARCHARVARCHAR5, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR635, 'MAGAA', 8, '1997-VARCHAR8-18', '1997-VARCHAR9-15', '1997-VARCHAR8-21', 3, 47.4599991, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR636, 'WARTH', 4, '1997-VARCHAR8-19', '1997-VARCHAR9-16', '1997-VARCHAR8-26', 1, 1.14999998, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR637, 'QUEEN', 6, '1997-VARCHAR8-19', '1997-VARCHAR9-16', '1997-VARCHAR8-26', 1, 2VARCHAR1.289993, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR638, 'LINOD', 3, '1997-VARCHAR8-2VARCHAR', '1997-VARCHAR9-17', '1997-VARCHAR9-VARCHAR1', 1, 158.44VARCHARVARCHARVARCHAR2, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR639, 'SANTG', 7, '1997-VARCHAR8-2VARCHAR', '1997-VARCHAR9-17', '1997-VARCHAR8-27', 3, 38.6399994, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '411VARCHAR', 'Norway');
INSERT INTO orders VALUES (1VARCHAR64VARCHAR, 'WANDK', 4, '1997-VARCHAR8-21', '1997-VARCHAR9-18', '1997-VARCHAR8-28', 1, 23.5499992, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (1VARCHAR641, 'HILAA', 4, '1997-VARCHAR8-22', '1997-VARCHAR9-19', '1997-VARCHAR8-26', 2, 179.61VARCHARVARCHARVARCHAR1, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR642, 'SIMOB', 7, '1997-VARCHAR8-22', '1997-VARCHAR9-19', '1997-VARCHAR9-VARCHAR5', 3, 41.8899994, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR643, 'ALFKI', 6, '1997-VARCHAR8-25', '1997-VARCHAR9-22', '1997-VARCHAR9-VARCHAR2', 1, 29.4599991, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '122VARCHAR9', 'Germany');
INSERT INTO orders VALUES (1VARCHAR644, 'WELLI', 3, '1997-VARCHAR8-25', '1997-VARCHAR9-22', '1997-VARCHAR9-VARCHAR1', 2, VARCHAR.14VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR1, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR645, 'HANAR', 4, '1997-VARCHAR8-26', '1997-VARCHAR9-23', '1997-VARCHAR9-VARCHAR2', 1, 12.4VARCHAR99998, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR646, 'HUNGO', 9, '1997-VARCHAR8-27', '1997-1VARCHAR-VARCHAR8', '1997-VARCHAR9-VARCHAR3', 3, 142.33VARCHARVARCHARVARCHAR2, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR647, 'QUEDE', 4, '1997-VARCHAR8-27', '1997-VARCHAR9-1VARCHAR', '1997-VARCHAR9-VARCHAR3', 2, 45.54VARCHARVARCHARVARCHARVARCHAR9, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR648, 'RICAR', 5, '1997-VARCHAR8-28', '1997-1VARCHAR-VARCHAR9', '1997-VARCHAR9-VARCHAR9', 2, 14.25, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR649, 'MAISD', 5, '1997-VARCHAR8-28', '1997-VARCHAR9-25', '1997-VARCHAR8-29', 3, 6.19999981, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-118VARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR65VARCHAR, 'FAMIA', 5, '1997-VARCHAR8-29', '1997-VARCHAR9-26', '1997-VARCHAR9-VARCHAR3', 3, 176.8VARCHAR9998, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', 'VARCHAR5442-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR651, 'WANDK', 8, '1997-VARCHAR9-VARCHAR1', '1997-VARCHAR9-29', '1997-VARCHAR9-11', 2, 2VARCHAR.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (1VARCHAR652, 'GOURL', 4, '1997-VARCHAR9-VARCHAR1', '1997-VARCHAR9-29', '1997-VARCHAR9-VARCHAR8', 2, 7.13999987, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR653, 'FRANK', 1, '1997-VARCHAR9-VARCHAR2', '1997-VARCHAR9-3VARCHAR', '1997-VARCHAR9-19', 1, 93.25, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR654, 'BERGS', 5, '1997-VARCHAR9-VARCHAR2', '1997-VARCHAR9-3VARCHAR', '1997-VARCHAR9-11', 1, 55.2599983, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR655, 'REGGC', 1, '1997-VARCHAR9-VARCHAR3', '1997-1VARCHAR-VARCHAR1', '1997-VARCHAR9-11', 2, 4.4VARCHAR999985, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR656, 'GREAL', 6, '1997-VARCHAR9-VARCHAR4', '1997-1VARCHAR-VARCHAR2', '1997-VARCHAR9-1VARCHAR', 1, 57.15VARCHARVARCHARVARCHAR15, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (1VARCHAR657, 'SAVEA', 2, '1997-VARCHAR9-VARCHAR4', '1997-1VARCHAR-VARCHAR2', '1997-VARCHAR9-15', 2, 352.69VARCHARVARCHARVARCHAR2, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR658, 'QUICK', 4, '1997-VARCHAR9-VARCHAR5', '1997-1VARCHAR-VARCHAR3', '1997-VARCHAR9-VARCHAR8', 1, 364.149994, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR659, 'QUEEN', 7, '1997-VARCHAR9-VARCHAR5', '1997-1VARCHAR-VARCHAR3', '1997-VARCHAR9-1VARCHAR', 2, 1VARCHAR5.8VARCHAR9998, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR66VARCHAR, 'HUNGC', 8, '1997-VARCHAR9-VARCHAR8', '1997-1VARCHAR-VARCHAR6', '1997-1VARCHAR-15', 1, 111.29VARCHARVARCHARVARCHAR1, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (1VARCHAR661, 'HUNGO', 7, '1997-VARCHAR9-VARCHAR9', '1997-1VARCHAR-VARCHAR7', '1997-VARCHAR9-15', 3, 17.5499992, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR662, 'LONEP', 3, '1997-VARCHAR9-VARCHAR9', '1997-1VARCHAR-VARCHAR7', '1997-VARCHAR9-18', 2, 1.27999997, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (1VARCHAR663, 'BONAP', 2, '1997-VARCHAR9-1VARCHAR', '1997-VARCHAR9-24', '1997-1VARCHAR-VARCHAR3', 2, 113.15VARCHARVARCHARVARCHAR2, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR664, 'FURIB', 1, '1997-VARCHAR9-1VARCHAR', '1997-1VARCHAR-VARCHAR8', '1997-VARCHAR9-19', 3, 1.26999998, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR665, 'LONEP', 1, '1997-VARCHAR9-11', '1997-1VARCHAR-VARCHAR9', '1997-VARCHAR9-17', 2, 26.3VARCHAR99995, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (1VARCHAR666, 'RICSU', 7, '1997-VARCHAR9-12', '1997-1VARCHAR-1VARCHAR', '1997-VARCHAR9-22', 2, 232.419998, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR667, 'ERNSH', 7, '1997-VARCHAR9-12', '1997-1VARCHAR-1VARCHAR', '1997-VARCHAR9-19', 1, 78.VARCHAR899963, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR668, 'WANDK', 1, '1997-VARCHAR9-15', '1997-1VARCHAR-13', '1997-VARCHAR9-23', 2, 47.22VARCHARVARCHARVARCHAR12, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (1VARCHAR669, 'SIMOB', 2, '1997-VARCHAR9-15', '1997-1VARCHAR-13', '1997-VARCHAR9-22', 1, 24.3899994, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR67VARCHAR, 'FRANK', 4, '1997-VARCHAR9-16', '1997-1VARCHAR-14', '1997-VARCHAR9-18', 1, 2VARCHAR3.479996, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR671, 'FRANR', 1, '1997-VARCHAR9-17', '1997-1VARCHAR-15', '1997-VARCHAR9-24', 1, 3VARCHAR.34VARCHARVARCHARVARCHARVARCHAR2, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR672, 'BERGS', 9, '1997-VARCHAR9-17', '1997-1VARCHAR-VARCHAR1', '1997-VARCHAR9-26', 2, 95.75, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR673, 'WILMK', 2, '1997-VARCHAR9-18', '1997-1VARCHAR-16', '1997-VARCHAR9-19', 1, 22.76VARCHARVARCHARVARCHARVARCHAR2, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '2124VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR674, 'ISLAT', 4, '1997-VARCHAR9-18', '1997-1VARCHAR-16', '1997-VARCHAR9-3VARCHAR', 2, VARCHAR.899999976, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR675, 'FRANK', 5, '1997-VARCHAR9-19', '1997-1VARCHAR-17', '1997-VARCHAR9-23', 2, 31.85VARCHARVARCHARVARCHARVARCHAR4, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR676, 'TORTU', 2, '1997-VARCHAR9-22', '1997-1VARCHAR-2VARCHAR', '1997-VARCHAR9-29', 2, 2.VARCHARVARCHAR999999, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR677, 'ANTON', 1, '1997-VARCHAR9-22', '1997-1VARCHAR-2VARCHAR', '1997-VARCHAR9-26', 3, 4.VARCHAR3VARCHARVARCHARVARCHARVARCHAR21, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, 'VARCHAR5VARCHAR23', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR678, 'SAVEA', 7, '1997-VARCHAR9-23', '1997-1VARCHAR-21', '1997-1VARCHAR-16', 3, 388.98VARCHARVARCHAR11, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR679, 'BLONP', 8, '1997-VARCHAR9-23', '1997-1VARCHAR-21', '1997-VARCHAR9-3VARCHAR', 3, 27.94VARCHARVARCHARVARCHARVARCHAR5, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR68VARCHAR, 'OLDWO', 1, '1997-VARCHAR9-24', '1997-1VARCHAR-22', '1997-VARCHAR9-26', 1, 26.61VARCHARVARCHARVARCHARVARCHAR6, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (1VARCHAR681, 'GREAL', 3, '1997-VARCHAR9-25', '1997-1VARCHAR-23', '1997-VARCHAR9-3VARCHAR', 3, 76.1299973, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (1VARCHAR682, 'ANTON', 3, '1997-VARCHAR9-25', '1997-1VARCHAR-23', '1997-1VARCHAR-VARCHAR1', 2, 36.13VARCHARVARCHARVARCHAR11, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, 'VARCHAR5VARCHAR23', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR683, 'DUMON', 2, '1997-VARCHAR9-26', '1997-1VARCHAR-24', '1997-1VARCHAR-VARCHAR1', 1, 4.4VARCHARVARCHARVARCHARVARCHARVARCHAR1, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR684, 'OTTIK', 3, '1997-VARCHAR9-26', '1997-1VARCHAR-24', '1997-VARCHAR9-3VARCHAR', 1, 145.63VARCHARVARCHARVARCHAR5, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (1VARCHAR685, 'GOURL', 4, '1997-VARCHAR9-29', '1997-1VARCHAR-13', '1997-1VARCHAR-VARCHAR3', 2, 33.75, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR686, 'PICCO', 2, '1997-VARCHAR9-3VARCHAR', '1997-1VARCHAR-28', '1997-1VARCHAR-VARCHAR8', 1, 96.5, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR687, 'HUNGO', 9, '1997-VARCHAR9-3VARCHAR', '1997-1VARCHAR-28', '1997-1VARCHAR-3VARCHAR', 2, 296.429993, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR688, 'VAFFE', 4, '1997-1VARCHAR-VARCHAR1', '1997-1VARCHAR-15', '1997-1VARCHAR-VARCHAR7', 2, 299.VARCHAR89996, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR689, 'BERGS', 1, '1997-1VARCHAR-VARCHAR1', '1997-1VARCHAR-29', '1997-1VARCHAR-VARCHAR7', 2, 13.42VARCHARVARCHARVARCHARVARCHAR1, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR69VARCHAR, 'HANAR', 1, '1997-1VARCHAR-VARCHAR2', '1997-1VARCHAR-3VARCHAR', '1997-1VARCHAR-VARCHAR3', 1, 15.8VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR691, 'QUICK', 2, '1997-1VARCHAR-VARCHAR3', '1997-11-14', '1997-1VARCHAR-22', 2, 81VARCHAR.VARCHAR49988, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR692, 'ALFKI', 4, '1997-1VARCHAR-VARCHAR3', '1997-1VARCHAR-31', '1997-1VARCHAR-13', 2, 61.VARCHAR2VARCHARVARCHARVARCHARVARCHAR5, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '122VARCHAR9', 'Germany');
INSERT INTO orders VALUES (1VARCHAR693, 'WHITC', 3, '1997-1VARCHAR-VARCHAR6', '1997-1VARCHAR-2VARCHAR', '1997-1VARCHAR-1VARCHAR', 3, 139.339996, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR694, 'QUICK', 8, '1997-1VARCHAR-VARCHAR6', '1997-11-VARCHAR3', '1997-1VARCHAR-VARCHAR9', 3, 398.359985, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR695, 'WILMK', 7, '1997-1VARCHAR-VARCHAR7', '1997-11-18', '1997-1VARCHAR-14', 1, 16.7199993, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '2124VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR696, 'WHITC', 8, '1997-1VARCHAR-VARCHAR8', '1997-11-19', '1997-1VARCHAR-14', 3, 1VARCHAR2.55VARCHARVARCHARVARCHAR3, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR697, 'LINOD', 3, '1997-1VARCHAR-VARCHAR8', '1997-11-VARCHAR5', '1997-1VARCHAR-14', 1, 45.52VARCHARVARCHARVARCHARVARCHAR5, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR698, 'ERNSH', 4, '1997-1VARCHAR-VARCHAR9', '1997-11-VARCHAR6', '1997-1VARCHAR-17', 1, 272.47VARCHARVARCHARVARCHAR1, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR699, 'MORGK', 3, '1997-1VARCHAR-VARCHAR9', '1997-11-VARCHAR6', '1997-1VARCHAR-13', 3, VARCHAR.579999983, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, 'VARCHAR4179', 'Germany');
INSERT INTO orders VALUES (1VARCHAR7VARCHARVARCHAR, 'SAVEA', 3, '1997-1VARCHAR-1VARCHAR', '1997-11-VARCHAR7', '1997-1VARCHAR-16', 1, 65.VARCHAR999985, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR7VARCHAR1, 'HUNGO', 6, '1997-1VARCHAR-13', '1997-1VARCHAR-27', '1997-1VARCHAR-15', 3, 22VARCHAR.3VARCHAR9998, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR7VARCHAR2, 'ALFKI', 4, '1997-1VARCHAR-13', '1997-11-24', '1997-1VARCHAR-21', 1, 23.94VARCHARVARCHARVARCHARVARCHAR5, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '122VARCHAR9', 'Germany');
INSERT INTO orders VALUES (1VARCHAR7VARCHAR3, 'FOLKO', 6, '1997-1VARCHAR-14', '1997-11-11', '1997-1VARCHAR-2VARCHAR', 2, 152.3VARCHARVARCHARVARCHARVARCHAR3, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR7VARCHAR4, 'QUEEN', 6, '1997-1VARCHAR-14', '1997-11-11', '1997-11-VARCHAR7', 1, 4.78VARCHARVARCHARVARCHARVARCHAR21, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR7VARCHAR5, 'HILAA', 9, '1997-1VARCHAR-15', '1997-11-12', '1997-11-18', 2, 3.51999998, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR7VARCHAR6, 'OLDWO', 8, '1997-1VARCHAR-16', '1997-11-13', '1997-1VARCHAR-21', 3, 135.63VARCHARVARCHARVARCHAR5, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (1VARCHAR7VARCHAR7, 'AROUT', 4, '1997-1VARCHAR-16', '1997-1VARCHAR-3VARCHAR', '1997-1VARCHAR-23', 3, 21.7399998, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR7VARCHAR8, 'THEBI', 6, '1997-1VARCHAR-17', '1997-11-28', '1997-11-VARCHAR5', 2, 2.96VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '972VARCHAR1', 'USA');
INSERT INTO orders VALUES (1VARCHAR7VARCHAR9, 'GOURL', 1, '1997-1VARCHAR-17', '1997-11-14', '1997-11-2VARCHAR', 3, 21VARCHAR.8VARCHARVARCHARVARCHARVARCHAR3, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR71VARCHAR, 'FRANS', 1, '1997-1VARCHAR-2VARCHAR', '1997-11-17', '1997-1VARCHAR-23', 1, 4.98VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '1VARCHAR1VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR711, 'SAVEA', 5, '1997-1VARCHAR-21', '1997-12-VARCHAR2', '1997-1VARCHAR-29', 2, 52.4VARCHAR99998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR712, 'HUNGO', 3, '1997-1VARCHAR-21', '1997-11-18', '1997-1VARCHAR-31', 1, 89.93VARCHARVARCHARVARCHARVARCHAR3, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR713, 'SAVEA', 1, '1997-1VARCHAR-22', '1997-11-19', '1997-1VARCHAR-24', 1, 167.VARCHAR5VARCHARVARCHARVARCHAR3, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR714, 'SAVEA', 5, '1997-1VARCHAR-22', '1997-11-19', '1997-1VARCHAR-27', 3, 24.4899998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR715, 'BONAP', 3, '1997-1VARCHAR-23', '1997-11-VARCHAR6', '1997-1VARCHAR-29', 1, 63.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR716, 'RANCH', 4, '1997-1VARCHAR-24', '1997-11-21', '1997-1VARCHAR-27', 2, 22.5699997, 'Rancho grande', 'Av. del Libertador 9VARCHARVARCHAR', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR717, 'FRANK', 1, '1997-1VARCHAR-24', '1997-11-21', '1997-1VARCHAR-29', 2, 59.25, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR718, 'KOENE', 1, '1997-1VARCHAR-27', '1997-11-24', '1997-1VARCHAR-29', 3, 17VARCHAR.88VARCHARVARCHARVARCHAR5, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR719, 'LETSS', 8, '1997-1VARCHAR-27', '1997-11-24', '1997-11-VARCHAR5', 2, 51.4399986, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (1VARCHAR72VARCHAR, 'QUEDE', 8, '1997-1VARCHAR-28', '1997-11-11', '1997-11-VARCHAR5', 2, 9.52999973, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR721, 'QUICK', 5, '1997-1VARCHAR-29', '1997-11-26', '1997-1VARCHAR-31', 3, 48.9199982, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR722, 'SAVEA', 8, '1997-1VARCHAR-29', '1997-12-1VARCHAR', '1997-11-VARCHAR4', 1, 74.58VARCHARVARCHARVARCHAR18, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR723, 'WHITC', 3, '1997-1VARCHAR-3VARCHAR', '1997-11-27', '1997-11-25', 1, 21.7199993, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR724, 'MEREP', 8, '1997-1VARCHAR-3VARCHAR', '1997-12-11', '1997-11-VARCHAR5', 2, 57.75, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (1VARCHAR725, 'FAMIA', 4, '1997-1VARCHAR-31', '1997-11-28', '1997-11-VARCHAR5', 3, 1VARCHAR.8299999, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', 'VARCHAR5442-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR726, 'EASTC', 4, '1997-11-VARCHAR3', '1997-11-17', '1997-12-VARCHAR5', 1, 16.5599995, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (1VARCHAR727, 'REGGC', 2, '1997-11-VARCHAR3', '1997-12-VARCHAR1', '1997-12-VARCHAR5', 1, 89.9VARCHARVARCHARVARCHARVARCHAR15, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR728, 'QUEEN', 4, '1997-11-VARCHAR4', '1997-12-VARCHAR2', '1997-11-11', 2, 58.33VARCHARVARCHARVARCHAR18, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR729, 'LINOD', 8, '1997-11-VARCHAR4', '1997-12-16', '1997-11-14', 3, 141.VARCHAR59998, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR73VARCHAR, 'BONAP', 5, '1997-11-VARCHAR5', '1997-12-VARCHAR3', '1997-11-14', 1, 2VARCHAR.12VARCHARVARCHARVARCHARVARCHAR8, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR731, 'CHOPS', 7, '1997-11-VARCHAR6', '1997-12-VARCHAR4', '1997-11-14', 1, 96.65VARCHARVARCHARVARCHAR15, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3VARCHAR12', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR732, 'BONAP', 3, '1997-11-VARCHAR6', '1997-12-VARCHAR4', '1997-11-VARCHAR7', 1, 16.9699993, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR733, 'BERGS', 1, '1997-11-VARCHAR7', '1997-12-VARCHAR5', '1997-11-1VARCHAR', 3, 11VARCHAR.11VARCHARVARCHARVARCHAR1, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR734, 'GOURL', 2, '1997-11-VARCHAR7', '1997-12-VARCHAR5', '1997-11-12', 3, 1.63, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR735, 'LETSS', 6, '1997-11-1VARCHAR', '1997-12-VARCHAR8', '1997-11-21', 2, 45.97VARCHARVARCHARVARCHAR12, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (1VARCHAR736, 'HUNGO', 9, '1997-11-11', '1997-12-VARCHAR9', '1997-11-21', 2, 44.VARCHAR999985, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR737, 'VINET', 2, '1997-11-11', '1997-12-VARCHAR9', '1997-11-18', 2, 7.78999996, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '511VARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR738, 'SPECD', 2, '1997-11-12', '1997-12-1VARCHAR', '1997-11-18', 1, 2.91VARCHARVARCHARVARCHARVARCHARVARCHAR9, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75VARCHAR16', 'France');
INSERT INTO orders VALUES (1VARCHAR739, 'VINET', 3, '1997-11-12', '1997-12-1VARCHAR', '1997-11-17', 3, 11.VARCHAR799999, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '511VARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR74VARCHAR, 'WHITC', 4, '1997-11-13', '1997-12-11', '1997-11-25', 2, 81.8799973, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR741, 'AROUT', 4, '1997-11-14', '1997-11-28', '1997-11-18', 3, 1VARCHAR.96, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR742, 'BOTTM', 3, '1997-11-14', '1997-12-12', '1997-11-18', 3, 243.729996, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR743, 'AROUT', 1, '1997-11-17', '1997-12-15', '1997-11-21', 2, 23.7199993, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR744, 'VAFFE', 6, '1997-11-17', '1997-12-15', '1997-11-24', 1, 69.19VARCHARVARCHARVARCHAR24, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR745, 'QUICK', 9, '1997-11-18', '1997-12-16', '1997-11-27', 1, 3.51999998, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR746, 'CHOPS', 1, '1997-11-19', '1997-12-17', '1997-11-21', 3, 31.43VARCHARVARCHARVARCHARVARCHAR3, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3VARCHAR12', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR747, 'PICCO', 6, '1997-11-19', '1997-12-17', '1997-11-26', 1, 117.33VARCHARVARCHARVARCHAR2, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR748, 'SAVEA', 3, '1997-11-2VARCHAR', '1997-12-18', '1997-11-28', 1, 232.55VARCHARVARCHARVARCHAR3, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR749, 'ISLAT', 4, '1997-11-2VARCHAR', '1997-12-18', '1997-12-19', 2, 61.5299988, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR75VARCHAR, 'WARTH', 9, '1997-11-21', '1997-12-19', '1997-11-24', 1, 79.3VARCHARVARCHARVARCHARVARCHAR31, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR751, 'RICSU', 3, '1997-11-24', '1997-12-22', '1997-12-VARCHAR3', 3, 13VARCHAR.789993, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR752, 'NORTS', 2, '1997-11-24', '1997-12-22', '1997-11-28', 3, 1.38999999, 'North/South', 'South House 3VARCHARVARCHAR Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES (1VARCHAR753, 'FRANS', 3, '1997-11-25', '1997-12-23', '1997-11-27', 1, 7.69999981, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '1VARCHAR1VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR754, 'MAGAA', 6, '1997-11-25', '1997-12-23', '1997-11-27', 3, 2.38VARCHARVARCHARVARCHARVARCHAR11, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR755, 'BONAP', 4, '1997-11-26', '1997-12-24', '1997-11-28', 2, 16.7VARCHAR99991, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR756, 'SPLIR', 8, '1997-11-27', '1997-12-25', '1997-12-VARCHAR2', 2, 73.2VARCHAR99991, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR757, 'SAVEA', 6, '1997-11-27', '1997-12-25', '1997-12-15', 1, 8.18999958, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR758, 'RICSU', 3, '1997-11-28', '1997-12-26', '1997-12-VARCHAR4', 3, 138.169998, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR759, 'ANATR', 3, '1997-11-28', '1997-12-26', '1997-12-12', 3, 11.9899998, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, 'VARCHAR5VARCHAR21', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR76VARCHAR, 'MAISD', 4, '1997-12-VARCHAR1', '1997-12-29', '1997-12-1VARCHAR', 1, 155.639999, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-118VARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR761, 'RATTC', 5, '1997-12-VARCHAR2', '1997-12-3VARCHAR', '1997-12-VARCHAR8', 2, 18.6599998, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR762, 'FOLKO', 3, '1997-12-VARCHAR2', '1997-12-3VARCHAR', '1997-12-VARCHAR9', 1, 328.73999, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR763, 'FOLIG', 3, '1997-12-VARCHAR3', '1997-12-31', '1997-12-VARCHAR8', 3, 37.3499985, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR764, 'ERNSH', 6, '1997-12-VARCHAR3', '1997-12-31', '1997-12-VARCHAR8', 3, 145.449997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR765, 'QUICK', 3, '1997-12-VARCHAR4', '1998-VARCHAR1-VARCHAR1', '1997-12-VARCHAR9', 3, 42.74VARCHARVARCHARVARCHAR17, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR766, 'OTTIK', 4, '1997-12-VARCHAR5', '1998-VARCHAR1-VARCHAR2', '1997-12-VARCHAR9', 1, 157.55VARCHARVARCHARVARCHAR3, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (1VARCHAR767, 'SUPRD', 4, '1997-12-VARCHAR5', '1998-VARCHAR1-VARCHAR2', '1997-12-15', 3, 1.59VARCHARVARCHARVARCHARVARCHARVARCHAR3, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR768, 'AROUT', 3, '1997-12-VARCHAR8', '1998-VARCHAR1-VARCHAR5', '1997-12-15', 2, 146.32VARCHARVARCHARVARCHAR7, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR769, 'VAFFE', 3, '1997-12-VARCHAR8', '1998-VARCHAR1-VARCHAR5', '1997-12-12', 1, 65.VARCHAR599976, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR77VARCHAR, 'HANAR', 8, '1997-12-VARCHAR9', '1998-VARCHAR1-VARCHAR6', '1997-12-17', 3, 5.32VARCHARVARCHARVARCHARVARCHAR17, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR771, 'ERNSH', 9, '1997-12-1VARCHAR', '1998-VARCHAR1-VARCHAR7', '1998-VARCHAR1-VARCHAR2', 2, 11.1899996, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR772, 'LEHMS', 3, '1997-12-1VARCHAR', '1998-VARCHAR1-VARCHAR7', '1997-12-19', 2, 91.2799988, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR773, 'ERNSH', 1, '1997-12-11', '1998-VARCHAR1-VARCHAR8', '1997-12-16', 3, 96.43VARCHARVARCHARVARCHARVARCHAR3, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR774, 'FOLKO', 4, '1997-12-11', '1997-12-25', '1997-12-12', 1, 48.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR775, 'THECR', 7, '1997-12-12', '1998-VARCHAR1-VARCHAR9', '1997-12-26', 1, 2VARCHAR.25, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '598VARCHAR1', 'USA');
INSERT INTO orders VALUES (1VARCHAR776, 'ERNSH', 1, '1997-12-15', '1998-VARCHAR1-12', '1997-12-18', 3, 351.529999, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR777, 'GOURL', 7, '1997-12-15', '1997-12-29', '1998-VARCHAR1-21', 2, 3.VARCHARVARCHAR999999, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR778, 'BERGS', 3, '1997-12-16', '1998-VARCHAR1-13', '1997-12-24', 1, 6.78999996, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR779, 'MORGK', 3, '1997-12-16', '1998-VARCHAR1-13', '1998-VARCHAR1-14', 2, 58.13VARCHARVARCHARVARCHAR11, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, 'VARCHAR4179', 'Germany');
INSERT INTO orders VALUES (1VARCHAR78VARCHAR, 'LILAS', 2, '1997-12-16', '1997-12-3VARCHAR', '1997-12-25', 1, 42.13VARCHARVARCHARVARCHAR11, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR781, 'WARTH', 2, '1997-12-17', '1998-VARCHAR1-14', '1997-12-19', 3, 73.16VARCHARVARCHARVARCHAR37, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR782, 'CACTU', 9, '1997-12-17', '1998-VARCHAR1-14', '1997-12-22', 3, 1.1VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR783, 'HANAR', 4, '1997-12-18', '1998-VARCHAR1-15', '1997-12-19', 2, 124.98VARCHARVARCHARVARCHAR3, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR784, 'MAGAA', 4, '1997-12-18', '1998-VARCHAR1-15', '1997-12-22', 3, 7VARCHAR.VARCHAR899963, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR785, 'GROSR', 1, '1997-12-18', '1998-VARCHAR1-15', '1997-12-24', 3, 1.5VARCHAR999999, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1VARCHAR81', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR786, 'QUEEN', 8, '1997-12-19', '1998-VARCHAR1-16', '1997-12-23', 1, 11VARCHAR.87VARCHARVARCHARVARCHAR3, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR787, 'LAMAI', 2, '1997-12-19', '1998-VARCHAR1-VARCHAR2', '1997-12-26', 1, 249.929993, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR788, 'QUICK', 1, '1997-12-22', '1998-VARCHAR1-19', '1998-VARCHAR1-19', 2, 42.7VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR789, 'FOLIG', 1, '1997-12-22', '1998-VARCHAR1-19', '1997-12-31', 2, 1VARCHARVARCHAR.599998, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR79VARCHAR, 'GOURL', 6, '1997-12-22', '1998-VARCHAR1-19', '1997-12-26', 1, 28.2299995, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR791, 'FRANK', 6, '1997-12-23', '1998-VARCHAR1-2VARCHAR', '1998-VARCHAR1-VARCHAR1', 2, 16.85VARCHARVARCHARVARCHARVARCHAR4, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR792, 'WOLZA', 1, '1997-12-23', '1998-VARCHAR1-2VARCHAR', '1997-12-31', 3, 23.79VARCHARVARCHARVARCHARVARCHAR9, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, 'VARCHAR1-VARCHAR12', 'Poland');
INSERT INTO orders VALUES (1VARCHAR793, 'AROUT', 3, '1997-12-24', '1998-VARCHAR1-21', '1998-VARCHAR1-VARCHAR8', 3, 4.51999998, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR794, 'QUEDE', 6, '1997-12-24', '1998-VARCHAR1-21', '1998-VARCHAR1-VARCHAR2', 1, 21.4899998, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR795, 'ERNSH', 8, '1997-12-24', '1998-VARCHAR1-21', '1998-VARCHAR1-2VARCHAR', 2, 126.66VARCHARVARCHARVARCHAR4, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR796, 'HILAA', 3, '1997-12-25', '1998-VARCHAR1-22', '1998-VARCHAR1-14', 1, 26.52VARCHARVARCHARVARCHARVARCHAR5, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR797, 'DRACD', 7, '1997-12-25', '1998-VARCHAR1-22', '1998-VARCHAR1-VARCHAR5', 2, 33.3499985, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52VARCHAR66', 'Germany');
INSERT INTO orders VALUES (1VARCHAR798, 'ISLAT', 2, '1997-12-26', '1998-VARCHAR1-23', '1998-VARCHAR1-VARCHAR5', 1, 2.32999992, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR799, 'KOENE', 9, '1997-12-26', '1998-VARCHAR2-VARCHAR6', '1998-VARCHAR1-VARCHAR5', 3, 3VARCHAR.76VARCHARVARCHARVARCHARVARCHAR2, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR8VARCHARVARCHAR, 'SEVES', 1, '1997-12-26', '1998-VARCHAR1-23', '1998-VARCHAR1-VARCHAR5', 3, 137.44VARCHARVARCHARVARCHAR2, 'Seven Seas Imports', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (1VARCHAR8VARCHAR1, 'BOLID', 4, '1997-12-29', '1998-VARCHAR1-26', '1997-12-31', 2, 97.VARCHAR899963, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28VARCHAR23', 'Spain');
INSERT INTO orders VALUES (1VARCHAR8VARCHAR2, 'SIMOB', 4, '1997-12-29', '1998-VARCHAR1-26', '1998-VARCHAR1-VARCHAR2', 2, 257.26VARCHARVARCHAR1, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR8VARCHAR3, 'WELLI', 4, '1997-12-3VARCHAR', '1998-VARCHAR1-27', '1998-VARCHAR1-VARCHAR6', 1, 55.2299995, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR8VARCHAR4, 'SEVES', 6, '1997-12-3VARCHAR', '1998-VARCHAR1-27', '1998-VARCHAR1-VARCHAR7', 2, 27.3299999, 'Seven Seas Imports', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (1VARCHAR8VARCHAR5, 'THEBI', 2, '1997-12-3VARCHAR', '1998-VARCHAR1-27', '1998-VARCHAR1-VARCHAR9', 3, 237.339996, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '972VARCHAR1', 'USA');
INSERT INTO orders VALUES (1VARCHAR8VARCHAR6, 'VICTE', 3, '1997-12-31', '1998-VARCHAR1-28', '1998-VARCHAR1-VARCHAR5', 2, 22.11VARCHARVARCHARVARCHARVARCHAR6, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR8VARCHAR7, 'FRANS', 4, '1997-12-31', '1998-VARCHAR1-28', '1998-VARCHAR1-3VARCHAR', 1, 1.36VARCHARVARCHARVARCHARVARCHARVARCHAR1, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '1VARCHAR1VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR8VARCHAR8, 'OLDWO', 2, '1998-VARCHAR1-VARCHAR1', '1998-VARCHAR1-29', '1998-VARCHAR1-VARCHAR9', 3, 45.5299988, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (1VARCHAR8VARCHAR9, 'WELLI', 7, '1998-VARCHAR1-VARCHAR1', '1998-VARCHAR1-29', '1998-VARCHAR1-VARCHAR7', 1, 4.86999989, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR81VARCHAR, 'LAUGB', 2, '1998-VARCHAR1-VARCHAR1', '1998-VARCHAR1-29', '1998-VARCHAR1-VARCHAR7', 3, 4.32999992, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES (1VARCHAR811, 'LINOD', 8, '1998-VARCHAR1-VARCHAR2', '1998-VARCHAR1-3VARCHAR', '1998-VARCHAR1-VARCHAR8', 1, 31.2199993, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR812, 'REGGC', 5, '1998-VARCHAR1-VARCHAR2', '1998-VARCHAR1-3VARCHAR', '1998-VARCHAR1-12', 1, 59.7799988, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR813, 'RICAR', 1, '1998-VARCHAR1-VARCHAR5', '1998-VARCHAR2-VARCHAR2', '1998-VARCHAR1-VARCHAR9', 1, 47.38VARCHARVARCHARVARCHAR11, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR814, 'VICTE', 3, '1998-VARCHAR1-VARCHAR5', '1998-VARCHAR2-VARCHAR2', '1998-VARCHAR1-14', 3, 13VARCHAR.94VARCHARVARCHARVARCHAR2, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR815, 'SAVEA', 2, '1998-VARCHAR1-VARCHAR5', '1998-VARCHAR2-VARCHAR2', '1998-VARCHAR1-14', 3, 14.6199999, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR816, 'GREAL', 4, '1998-VARCHAR1-VARCHAR6', '1998-VARCHAR2-VARCHAR3', '1998-VARCHAR2-VARCHAR4', 2, 719.78VARCHARVARCHAR29, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (1VARCHAR817, 'KOENE', 3, '1998-VARCHAR1-VARCHAR6', '1998-VARCHAR1-2VARCHAR', '1998-VARCHAR1-13', 2, 3VARCHAR6.VARCHAR7VARCHARVARCHARVARCHAR7, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR818, 'MAGAA', 7, '1998-VARCHAR1-VARCHAR7', '1998-VARCHAR2-VARCHAR4', '1998-VARCHAR1-12', 3, 65.48VARCHARVARCHARVARCHAR34, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR819, 'CACTU', 2, '1998-VARCHAR1-VARCHAR7', '1998-VARCHAR2-VARCHAR4', '1998-VARCHAR1-16', 3, 19.76VARCHARVARCHARVARCHARVARCHAR2, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR82VARCHAR, 'RATTC', 3, '1998-VARCHAR1-VARCHAR7', '1998-VARCHAR2-VARCHAR4', '1998-VARCHAR1-13', 2, 37.52VARCHARVARCHARVARCHARVARCHAR5, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR821, 'SPLIR', 1, '1998-VARCHAR1-VARCHAR8', '1998-VARCHAR2-VARCHAR5', '1998-VARCHAR1-15', 1, 36.68VARCHARVARCHARVARCHARVARCHAR3, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR822, 'TRAIH', 6, '1998-VARCHAR1-VARCHAR8', '1998-VARCHAR2-VARCHAR5', '1998-VARCHAR1-16', 3, 7, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98VARCHAR34', 'USA');
INSERT INTO orders VALUES (1VARCHAR823, 'LILAS', 5, '1998-VARCHAR1-VARCHAR9', '1998-VARCHAR2-VARCHAR6', '1998-VARCHAR1-13', 2, 163.97VARCHARVARCHARVARCHAR1, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR824, 'FOLKO', 8, '1998-VARCHAR1-VARCHAR9', '1998-VARCHAR2-VARCHAR6', '1998-VARCHAR1-3VARCHAR', 1, 1.23VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR825, 'DRACD', 1, '1998-VARCHAR1-VARCHAR9', '1998-VARCHAR2-VARCHAR6', '1998-VARCHAR1-14', 1, 79.25, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52VARCHAR66', 'Germany');
INSERT INTO orders VALUES (1VARCHAR826, 'BLONP', 6, '1998-VARCHAR1-12', '1998-VARCHAR2-VARCHAR9', '1998-VARCHAR2-VARCHAR6', 1, 7.VARCHAR9VARCHARVARCHARVARCHARVARCHAR15, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR827, 'BONAP', 1, '1998-VARCHAR1-12', '1998-VARCHAR1-26', '1998-VARCHAR2-VARCHAR6', 2, 63.54VARCHARVARCHARVARCHARVARCHAR9, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR828, 'RANCH', 9, '1998-VARCHAR1-13', '1998-VARCHAR1-27', '1998-VARCHAR2-VARCHAR4', 1, 9VARCHAR.8499985, 'Rancho grande', 'Av. del Libertador 9VARCHARVARCHAR', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR829, 'ISLAT', 9, '1998-VARCHAR1-13', '1998-VARCHAR2-1VARCHAR', '1998-VARCHAR1-23', 1, 154.72VARCHARVARCHARVARCHAR1, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR83VARCHAR, 'TRADH', 4, '1998-VARCHAR1-13', '1998-VARCHAR2-24', '1998-VARCHAR1-21', 2, 81.83VARCHARVARCHARVARCHAR18, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', 'VARCHAR5634-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR831, 'SANTG', 3, '1998-VARCHAR1-14', '1998-VARCHAR2-11', '1998-VARCHAR1-23', 2, 72.19VARCHARVARCHARVARCHAR24, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '411VARCHAR', 'Norway');
INSERT INTO orders VALUES (1VARCHAR832, 'LAMAI', 2, '1998-VARCHAR1-14', '1998-VARCHAR2-11', '1998-VARCHAR1-19', 2, 43.2599983, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR833, 'OTTIK', 6, '1998-VARCHAR1-15', '1998-VARCHAR2-12', '1998-VARCHAR1-23', 2, 71.4899979, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (1VARCHAR834, 'TRADH', 1, '1998-VARCHAR1-15', '1998-VARCHAR2-12', '1998-VARCHAR1-19', 3, 29.78VARCHARVARCHARVARCHARVARCHAR7, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', 'VARCHAR5634-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR835, 'ALFKI', 1, '1998-VARCHAR1-15', '1998-VARCHAR2-12', '1998-VARCHAR1-21', 3, 69.5299988, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '122VARCHAR9', 'Germany');
INSERT INTO orders VALUES (1VARCHAR836, 'ERNSH', 7, '1998-VARCHAR1-16', '1998-VARCHAR2-13', '1998-VARCHAR1-21', 1, 411.88VARCHARVARCHARVARCHAR5, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR837, 'BERGS', 9, '1998-VARCHAR1-16', '1998-VARCHAR2-13', '1998-VARCHAR1-23', 3, 13.3199997, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR838, 'LINOD', 3, '1998-VARCHAR1-19', '1998-VARCHAR2-16', '1998-VARCHAR1-23', 3, 59.2799988, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR839, 'TRADH', 3, '1998-VARCHAR1-19', '1998-VARCHAR2-16', '1998-VARCHAR1-22', 3, 35.43VARCHARVARCHARVARCHARVARCHAR3, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', 'VARCHAR5634-VARCHAR3VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR84VARCHAR, 'LINOD', 4, '1998-VARCHAR1-19', '1998-VARCHAR3-VARCHAR2', '1998-VARCHAR2-16', 2, 2.71VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR841, 'SUPRD', 5, '1998-VARCHAR1-2VARCHAR', '1998-VARCHAR2-17', '1998-VARCHAR1-29', 2, 424.299988, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR842, 'TORTU', 1, '1998-VARCHAR1-2VARCHAR', '1998-VARCHAR2-17', '1998-VARCHAR1-29', 3, 54.4199982, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR843, 'VICTE', 4, '1998-VARCHAR1-21', '1998-VARCHAR2-18', '1998-VARCHAR1-26', 2, 9.26VARCHARVARCHARVARCHARVARCHAR23, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR844, 'PICCO', 8, '1998-VARCHAR1-21', '1998-VARCHAR2-18', '1998-VARCHAR1-26', 2, 25.2199993, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR845, 'QUICK', 8, '1998-VARCHAR1-21', '1998-VARCHAR2-VARCHAR4', '1998-VARCHAR1-3VARCHAR', 1, 212.979996, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR846, 'SUPRD', 2, '1998-VARCHAR1-22', '1998-VARCHAR3-VARCHAR5', '1998-VARCHAR1-23', 3, 56.4599991, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR847, 'SAVEA', 4, '1998-VARCHAR1-22', '1998-VARCHAR2-VARCHAR5', '1998-VARCHAR2-1VARCHAR', 3, 487.57VARCHARVARCHARVARCHAR7, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR848, 'CONSH', 7, '1998-VARCHAR1-23', '1998-VARCHAR2-2VARCHAR', '1998-VARCHAR1-29', 2, 38.24VARCHARVARCHARVARCHAR17, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES (1VARCHAR849, 'KOENE', 9, '1998-VARCHAR1-23', '1998-VARCHAR2-2VARCHAR', '1998-VARCHAR1-3VARCHAR', 2, VARCHAR.56VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR85VARCHAR, 'VICTE', 1, '1998-VARCHAR1-23', '1998-VARCHAR3-VARCHAR6', '1998-VARCHAR1-3VARCHAR', 1, 49.1899986, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69VARCHARVARCHAR4', 'France');
INSERT INTO orders VALUES (1VARCHAR851, 'RICAR', 5, '1998-VARCHAR1-26', '1998-VARCHAR2-23', '1998-VARCHAR2-VARCHAR2', 1, 16VARCHAR.55VARCHARVARCHARVARCHAR3, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR852, 'RATTC', 8, '1998-VARCHAR1-26', '1998-VARCHAR2-VARCHAR9', '1998-VARCHAR1-3VARCHAR', 1, 174.VARCHAR5VARCHARVARCHARVARCHAR3, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR853, 'BLAUS', 9, '1998-VARCHAR1-27', '1998-VARCHAR2-24', '1998-VARCHAR2-VARCHAR3', 2, 53.83VARCHARVARCHARVARCHAR18, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '683VARCHAR6', 'Germany');
INSERT INTO orders VALUES (1VARCHAR854, 'ERNSH', 3, '1998-VARCHAR1-27', '1998-VARCHAR2-24', '1998-VARCHAR2-VARCHAR5', 2, 1VARCHARVARCHAR.22VARCHARVARCHARVARCHAR1, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR855, 'OLDWO', 3, '1998-VARCHAR1-27', '1998-VARCHAR2-24', '1998-VARCHAR2-VARCHAR4', 1, 17VARCHAR.97VARCHARVARCHARVARCHAR1, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (1VARCHAR856, 'ANTON', 3, '1998-VARCHAR1-28', '1998-VARCHAR2-25', '1998-VARCHAR2-1VARCHAR', 2, 58.43VARCHARVARCHARVARCHARVARCHAR3, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, 'VARCHAR5VARCHAR23', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR857, 'BERGS', 8, '1998-VARCHAR1-28', '1998-VARCHAR2-25', '1998-VARCHAR2-VARCHAR6', 2, 188.85VARCHARVARCHARVARCHAR6, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR858, 'LACOR', 2, '1998-VARCHAR1-29', '1998-VARCHAR2-26', '1998-VARCHAR2-VARCHAR3', 1, 52.5VARCHAR99983, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR859, 'FRANK', 1, '1998-VARCHAR1-29', '1998-VARCHAR2-26', '1998-VARCHAR2-VARCHAR2', 2, 76.VARCHAR999985, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR86VARCHAR, 'FRANR', 3, '1998-VARCHAR1-29', '1998-VARCHAR2-26', '1998-VARCHAR2-VARCHAR4', 3, 19.26VARCHARVARCHARVARCHARVARCHAR2, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR861, 'WHITC', 4, '1998-VARCHAR1-3VARCHAR', '1998-VARCHAR2-27', '1998-VARCHAR2-17', 2, 14.93VARCHARVARCHARVARCHARVARCHAR3, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR862, 'LEHMS', 8, '1998-VARCHAR1-3VARCHAR', '1998-VARCHAR3-13', '1998-VARCHAR2-VARCHAR2', 2, 53.2299995, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR863, 'HILAA', 4, '1998-VARCHAR2-VARCHAR2', '1998-VARCHAR3-VARCHAR2', '1998-VARCHAR2-17', 2, 3VARCHAR.26VARCHARVARCHARVARCHARVARCHAR2, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR864, 'AROUT', 4, '1998-VARCHAR2-VARCHAR2', '1998-VARCHAR3-VARCHAR2', '1998-VARCHAR2-VARCHAR9', 2, 3.VARCHAR3999996, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR865, 'QUICK', 2, '1998-VARCHAR2-VARCHAR2', '1998-VARCHAR2-16', '1998-VARCHAR2-12', 1, 348.14VARCHARVARCHAR15, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR866, 'BERGS', 5, '1998-VARCHAR2-VARCHAR3', '1998-VARCHAR3-VARCHAR3', '1998-VARCHAR2-12', 1, 1VARCHAR9.11VARCHARVARCHARVARCHAR1, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR867, 'LONEP', 6, '1998-VARCHAR2-VARCHAR3', '1998-VARCHAR3-17', '1998-VARCHAR2-11', 1, 1.92999995, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (1VARCHAR868, 'QUEEN', 7, '1998-VARCHAR2-VARCHAR4', '1998-VARCHAR3-VARCHAR4', '1998-VARCHAR2-23', 2, 191.27VARCHARVARCHARVARCHAR4, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR869, 'SEVES', 5, '1998-VARCHAR2-VARCHAR4', '1998-VARCHAR3-VARCHAR4', '1998-VARCHAR2-VARCHAR9', 1, 143.279999, 'Seven Seas Imports', '9VARCHAR Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (1VARCHAR87VARCHAR, 'WOLZA', 5, '1998-VARCHAR2-VARCHAR4', '1998-VARCHAR3-VARCHAR4', '1998-VARCHAR2-13', 3, 12.VARCHAR4, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, 'VARCHAR1-VARCHAR12', 'Poland');
INSERT INTO orders VALUES (1VARCHAR871, 'BONAP', 9, '1998-VARCHAR2-VARCHAR5', '1998-VARCHAR3-VARCHAR5', '1998-VARCHAR2-1VARCHAR', 2, 112.269997, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR872, 'GODOS', 5, '1998-VARCHAR2-VARCHAR5', '1998-VARCHAR3-VARCHAR5', '1998-VARCHAR2-VARCHAR9', 2, 175.32VARCHARVARCHARVARCHAR7, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR873, 'WILMK', 4, '1998-VARCHAR2-VARCHAR6', '1998-VARCHAR3-VARCHAR6', '1998-VARCHAR2-VARCHAR9', 1, VARCHAR.819999993, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '2124VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR874, 'GODOS', 5, '1998-VARCHAR2-VARCHAR6', '1998-VARCHAR3-VARCHAR6', '1998-VARCHAR2-11', 2, 19.5799999, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR875, 'BERGS', 4, '1998-VARCHAR2-VARCHAR6', '1998-VARCHAR3-VARCHAR6', '1998-VARCHAR3-VARCHAR3', 2, 32.3699989, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR876, 'BONAP', 7, '1998-VARCHAR2-VARCHAR9', '1998-VARCHAR3-VARCHAR9', '1998-VARCHAR2-12', 3, 6VARCHAR.4199982, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR877, 'RICAR', 1, '1998-VARCHAR2-VARCHAR9', '1998-VARCHAR3-VARCHAR9', '1998-VARCHAR2-19', 1, 38.VARCHAR6VARCHARVARCHARVARCHAR14, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR878, 'QUICK', 4, '1998-VARCHAR2-1VARCHAR', '1998-VARCHAR3-1VARCHAR', '1998-VARCHAR2-12', 1, 46.6899986, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR879, 'WILMK', 3, '1998-VARCHAR2-1VARCHAR', '1998-VARCHAR3-1VARCHAR', '1998-VARCHAR2-12', 3, 8.5, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '2124VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR88VARCHAR, 'FOLKO', 7, '1998-VARCHAR2-1VARCHAR', '1998-VARCHAR3-24', '1998-VARCHAR2-18', 1, 88.VARCHAR1VARCHARVARCHARVARCHAR21, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR881, 'CACTU', 4, '1998-VARCHAR2-11', '1998-VARCHAR3-11', '1998-VARCHAR2-18', 1, 2.83999991, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR882, 'SAVEA', 4, '1998-VARCHAR2-11', '1998-VARCHAR3-11', '1998-VARCHAR2-2VARCHAR', 3, 23.1VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR883, 'LONEP', 8, '1998-VARCHAR2-12', '1998-VARCHAR3-12', '1998-VARCHAR2-2VARCHAR', 3, VARCHAR.529999971, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (1VARCHAR884, 'LETSS', 4, '1998-VARCHAR2-12', '1998-VARCHAR3-12', '1998-VARCHAR2-13', 2, 9VARCHAR.97VARCHARVARCHARVARCHAR12, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (1VARCHAR885, 'SUPRD', 6, '1998-VARCHAR2-12', '1998-VARCHAR3-12', '1998-VARCHAR2-18', 3, 5.63999987, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR886, 'HANAR', 1, '1998-VARCHAR2-13', '1998-VARCHAR3-13', '1998-VARCHAR3-VARCHAR2', 1, 4.98999977, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR887, 'GALED', 8, '1998-VARCHAR2-13', '1998-VARCHAR3-13', '1998-VARCHAR2-16', 3, 1.25, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8VARCHAR22', 'Spain');
INSERT INTO orders VALUES (1VARCHAR888, 'GODOS', 1, '1998-VARCHAR2-16', '1998-VARCHAR3-16', '1998-VARCHAR2-23', 2, 51.8699989, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR889, 'RATTC', 9, '1998-VARCHAR2-16', '1998-VARCHAR3-16', '1998-VARCHAR2-23', 3, 28VARCHAR.6VARCHAR9985, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR89VARCHAR, 'DUMON', 7, '1998-VARCHAR2-16', '1998-VARCHAR3-16', '1998-VARCHAR2-18', 1, 32.7599983, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR891, 'LEHMS', 7, '1998-VARCHAR2-17', '1998-VARCHAR3-17', '1998-VARCHAR2-19', 2, 2VARCHAR.37VARCHARVARCHARVARCHARVARCHAR8, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR892, 'MAISD', 4, '1998-VARCHAR2-17', '1998-VARCHAR3-17', '1998-VARCHAR2-19', 2, 12VARCHAR.269997, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-118VARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR893, 'KOENE', 9, '1998-VARCHAR2-18', '1998-VARCHAR3-18', '1998-VARCHAR2-2VARCHAR', 2, 77.7799988, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (1VARCHAR894, 'SAVEA', 1, '1998-VARCHAR2-18', '1998-VARCHAR3-18', '1998-VARCHAR2-2VARCHAR', 1, 116.129997, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR895, 'ERNSH', 3, '1998-VARCHAR2-18', '1998-VARCHAR3-18', '1998-VARCHAR2-23', 1, 162.75, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR896, 'MAISD', 7, '1998-VARCHAR2-19', '1998-VARCHAR3-19', '1998-VARCHAR2-27', 3, 32.45VARCHARVARCHARVARCHARVARCHAR8, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-118VARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR897, 'HUNGO', 3, '1998-VARCHAR2-19', '1998-VARCHAR3-19', '1998-VARCHAR2-25', 2, 6VARCHAR3.539978, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR898, 'OCEAN', 4, '1998-VARCHAR2-2VARCHAR', '1998-VARCHAR3-2VARCHAR', '1998-VARCHAR3-VARCHAR6', 2, 1.26999998, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 2VARCHAR-A', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR899, 'LILAS', 5, '1998-VARCHAR2-2VARCHAR', '1998-VARCHAR3-2VARCHAR', '1998-VARCHAR2-26', 3, 1.21VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR9VARCHARVARCHAR, 'WELLI', 1, '1998-VARCHAR2-2VARCHAR', '1998-VARCHAR3-2VARCHAR', '1998-VARCHAR3-VARCHAR4', 2, 1.65999997, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR9VARCHAR1, 'HILAA', 4, '1998-VARCHAR2-23', '1998-VARCHAR3-23', '1998-VARCHAR2-26', 1, 62.VARCHAR9VARCHARVARCHARVARCHARVARCHAR2, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR9VARCHAR2, 'FOLKO', 1, '1998-VARCHAR2-23', '1998-VARCHAR3-23', '1998-VARCHAR3-VARCHAR3', 1, 44.15VARCHARVARCHARVARCHAR15, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR9VARCHAR3, 'HANAR', 3, '1998-VARCHAR2-24', '1998-VARCHAR3-24', '1998-VARCHAR3-VARCHAR4', 3, 36.7VARCHAR99991, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR9VARCHAR4, 'WHITC', 3, '1998-VARCHAR2-24', '1998-VARCHAR3-24', '1998-VARCHAR2-27', 3, 162.949997, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (1VARCHAR9VARCHAR5, 'WELLI', 9, '1998-VARCHAR2-24', '1998-VARCHAR3-24', '1998-VARCHAR3-VARCHAR6', 2, 13.72VARCHARVARCHARVARCHARVARCHAR3, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR9VARCHAR6, 'WOLZA', 4, '1998-VARCHAR2-25', '1998-VARCHAR3-11', '1998-VARCHAR3-VARCHAR3', 3, 26.29VARCHARVARCHARVARCHARVARCHAR9, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, 'VARCHAR1-VARCHAR12', 'Poland');
INSERT INTO orders VALUES (1VARCHAR9VARCHAR7, 'SPECD', 6, '1998-VARCHAR2-25', '1998-VARCHAR3-25', '1998-VARCHAR2-27', 3, 9.18999958, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75VARCHAR16', 'France');
INSERT INTO orders VALUES (1VARCHAR9VARCHAR8, 'REGGC', 4, '1998-VARCHAR2-26', '1998-VARCHAR3-26', '1998-VARCHAR3-VARCHAR6', 2, 32.9599991, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR9VARCHAR9, 'SANTG', 1, '1998-VARCHAR2-26', '1998-VARCHAR3-26', '1998-VARCHAR3-1VARCHAR', 2, 53.VARCHAR499992, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '411VARCHAR', 'Norway');
INSERT INTO orders VALUES (1VARCHAR91VARCHAR, 'WILMK', 1, '1998-VARCHAR2-26', '1998-VARCHAR3-26', '1998-VARCHAR3-VARCHAR4', 3, 38.11VARCHARVARCHARVARCHARVARCHAR6, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '2124VARCHAR', 'Finland');
INSERT INTO orders VALUES (1VARCHAR911, 'GODOS', 3, '1998-VARCHAR2-26', '1998-VARCHAR3-26', '1998-VARCHAR3-VARCHAR5', 1, 38.1899986, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR912, 'HUNGO', 2, '1998-VARCHAR2-26', '1998-VARCHAR3-26', '1998-VARCHAR3-18', 2, 58VARCHAR.9VARCHAR9973, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR913, 'QUEEN', 4, '1998-VARCHAR2-26', '1998-VARCHAR3-26', '1998-VARCHAR3-VARCHAR4', 1, 33.VARCHAR499992, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR914, 'QUEEN', 6, '1998-VARCHAR2-27', '1998-VARCHAR3-27', '1998-VARCHAR3-VARCHAR2', 1, 21.19VARCHARVARCHARVARCHARVARCHAR5, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR915, 'TORTU', 2, '1998-VARCHAR2-27', '1998-VARCHAR3-27', '1998-VARCHAR3-VARCHAR2', 2, 3.5VARCHAR999999, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR916, 'RANCH', 1, '1998-VARCHAR2-27', '1998-VARCHAR3-27', '1998-VARCHAR3-VARCHAR9', 2, 63.77VARCHARVARCHARVARCHARVARCHAR5, 'Rancho grande', 'Av. del Libertador 9VARCHARVARCHAR', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR917, 'ROMEY', 4, '1998-VARCHAR3-VARCHAR2', '1998-VARCHAR3-3VARCHAR', '1998-VARCHAR3-11', 2, 8.28999996, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28VARCHARVARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR918, 'BOTTM', 3, '1998-VARCHAR3-VARCHAR2', '1998-VARCHAR3-3VARCHAR', '1998-VARCHAR3-11', 3, 48.83VARCHARVARCHARVARCHAR18, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR919, 'LINOD', 2, '1998-VARCHAR3-VARCHAR2', '1998-VARCHAR3-3VARCHAR', '1998-VARCHAR3-VARCHAR4', 2, 19.7999992, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR92VARCHAR, 'AROUT', 4, '1998-VARCHAR3-VARCHAR3', '1998-VARCHAR3-31', '1998-VARCHAR3-VARCHAR9', 2, 29.61VARCHARVARCHARVARCHARVARCHAR6, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR921, 'VAFFE', 1, '1998-VARCHAR3-VARCHAR3', '1998-VARCHAR4-14', '1998-VARCHAR3-VARCHAR9', 1, 176.479996, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR922, 'HANAR', 5, '1998-VARCHAR3-VARCHAR3', '1998-VARCHAR3-31', '1998-VARCHAR3-VARCHAR5', 3, 62.74VARCHARVARCHARVARCHAR17, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR923, 'LAMAI', 7, '1998-VARCHAR3-VARCHAR3', '1998-VARCHAR4-14', '1998-VARCHAR3-13', 3, 68.26VARCHARVARCHARVARCHAR21, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR924, 'BERGS', 3, '1998-VARCHAR3-VARCHAR4', '1998-VARCHAR4-VARCHAR1', '1998-VARCHAR4-VARCHAR8', 2, 151.52VARCHARVARCHARVARCHAR4, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR925, 'HANAR', 3, '1998-VARCHAR3-VARCHAR4', '1998-VARCHAR4-VARCHAR1', '1998-VARCHAR3-13', 1, 2.26999998, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR926, 'ANATR', 4, '1998-VARCHAR3-VARCHAR4', '1998-VARCHAR4-VARCHAR1', '1998-VARCHAR3-11', 3, 39.9199982, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, 'VARCHAR5VARCHAR21', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR927, 'LACOR', 4, '1998-VARCHAR3-VARCHAR5', '1998-VARCHAR4-VARCHAR2', '1998-VARCHAR4-VARCHAR8', 1, 19.79VARCHARVARCHARVARCHARVARCHAR9, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR928, 'GALED', 1, '1998-VARCHAR3-VARCHAR5', '1998-VARCHAR4-VARCHAR2', '1998-VARCHAR3-18', 1, 1.36VARCHARVARCHARVARCHARVARCHARVARCHAR1, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8VARCHAR22', 'Spain');
INSERT INTO orders VALUES (1VARCHAR929, 'FRANK', 6, '1998-VARCHAR3-VARCHAR5', '1998-VARCHAR4-VARCHAR2', '1998-VARCHAR3-12', 1, 33.93VARCHARVARCHARVARCHARVARCHAR3, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (1VARCHAR93VARCHAR, 'SUPRD', 4, '1998-VARCHAR3-VARCHAR6', '1998-VARCHAR4-17', '1998-VARCHAR3-18', 3, 15.55VARCHARVARCHARVARCHARVARCHAR2, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR931, 'RICSU', 4, '1998-VARCHAR3-VARCHAR6', '1998-VARCHAR3-2VARCHAR', '1998-VARCHAR3-19', 2, 13.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR932, 'BONAP', 8, '1998-VARCHAR3-VARCHAR6', '1998-VARCHAR4-VARCHAR3', '1998-VARCHAR3-24', 1, 134.639999, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR933, 'ISLAT', 6, '1998-VARCHAR3-VARCHAR6', '1998-VARCHAR4-VARCHAR3', '1998-VARCHAR3-16', 3, 54.15VARCHARVARCHARVARCHAR15, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (1VARCHAR934, 'LEHMS', 3, '1998-VARCHAR3-VARCHAR9', '1998-VARCHAR4-VARCHAR6', '1998-VARCHAR3-12', 3, 32.VARCHARVARCHAR99983, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (1VARCHAR935, 'WELLI', 4, '1998-VARCHAR3-VARCHAR9', '1998-VARCHAR4-VARCHAR6', '1998-VARCHAR3-18', 3, 47.59VARCHARVARCHARVARCHARVARCHAR2, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', 'VARCHAR8737-363', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR936, 'GREAL', 3, '1998-VARCHAR3-VARCHAR9', '1998-VARCHAR4-VARCHAR6', '1998-VARCHAR3-18', 2, 33.68VARCHARVARCHARVARCHARVARCHAR3, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (1VARCHAR937, 'CACTU', 7, '1998-VARCHAR3-1VARCHAR', '1998-VARCHAR3-24', '1998-VARCHAR3-13', 3, 31.51VARCHARVARCHARVARCHARVARCHAR2, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR938, 'QUICK', 3, '1998-VARCHAR3-1VARCHAR', '1998-VARCHAR4-VARCHAR7', '1998-VARCHAR3-16', 2, 31.8899994, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR939, 'MAGAA', 2, '1998-VARCHAR3-1VARCHAR', '1998-VARCHAR4-VARCHAR7', '1998-VARCHAR3-13', 2, 76.33VARCHARVARCHARVARCHAR18, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR94VARCHAR, 'BONAP', 8, '1998-VARCHAR3-11', '1998-VARCHAR4-VARCHAR8', '1998-VARCHAR3-23', 3, 19.77VARCHARVARCHARVARCHARVARCHAR5, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (1VARCHAR941, 'SAVEA', 7, '1998-VARCHAR3-11', '1998-VARCHAR4-VARCHAR8', '1998-VARCHAR3-2VARCHAR', 2, 4VARCHARVARCHAR.8VARCHAR9998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR942, 'REGGC', 9, '1998-VARCHAR3-11', '1998-VARCHAR4-VARCHAR8', '1998-VARCHAR3-18', 3, 17.95VARCHARVARCHARVARCHARVARCHAR8, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR943, 'BSBEV', 4, '1998-VARCHAR3-11', '1998-VARCHAR4-VARCHAR8', '1998-VARCHAR3-19', 2, 2.17VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (1VARCHAR944, 'BOTTM', 6, '1998-VARCHAR3-12', '1998-VARCHAR3-26', '1998-VARCHAR3-13', 3, 52.9199982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR945, 'MORGK', 4, '1998-VARCHAR3-12', '1998-VARCHAR4-VARCHAR9', '1998-VARCHAR3-18', 1, 1VARCHAR.22VARCHARVARCHARVARCHARVARCHAR3, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, 'VARCHAR4179', 'Germany');
INSERT INTO orders VALUES (1VARCHAR946, 'VAFFE', 1, '1998-VARCHAR3-12', '1998-VARCHAR4-VARCHAR9', '1998-VARCHAR3-19', 2, 27.2VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR947, 'BSBEV', 3, '1998-VARCHAR3-13', '1998-VARCHAR4-1VARCHAR', '1998-VARCHAR3-16', 2, 3.25999999, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (1VARCHAR948, 'GODOS', 3, '1998-VARCHAR3-13', '1998-VARCHAR4-1VARCHAR', '1998-VARCHAR3-19', 3, 23.3899994, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (1VARCHAR949, 'BOTTM', 2, '1998-VARCHAR3-13', '1998-VARCHAR4-1VARCHAR', '1998-VARCHAR3-17', 3, 74.44VARCHARVARCHARVARCHAR24, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR95VARCHAR, 'MAGAA', 1, '1998-VARCHAR3-16', '1998-VARCHAR4-13', '1998-VARCHAR3-23', 2, 2.5, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '241VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (1VARCHAR951, 'RICSU', 9, '1998-VARCHAR3-16', '1998-VARCHAR4-27', '1998-VARCHAR4-VARCHAR7', 2, 3VARCHAR.85VARCHARVARCHARVARCHARVARCHAR4, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR952, 'ALFKI', 1, '1998-VARCHAR3-16', '1998-VARCHAR4-27', '1998-VARCHAR3-24', 1, 4VARCHAR.4199982, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '122VARCHAR9', 'Germany');
INSERT INTO orders VALUES (1VARCHAR953, 'AROUT', 9, '1998-VARCHAR3-16', '1998-VARCHAR3-3VARCHAR', '1998-VARCHAR3-25', 2, 23.7199993, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (1VARCHAR954, 'LINOD', 5, '1998-VARCHAR3-17', '1998-VARCHAR4-28', '1998-VARCHAR3-2VARCHAR', 1, 27.9VARCHAR99998, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR955, 'FOLKO', 8, '1998-VARCHAR3-17', '1998-VARCHAR4-14', '1998-VARCHAR3-2VARCHAR', 2, 3.25999999, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR956, 'BLAUS', 6, '1998-VARCHAR3-17', '1998-VARCHAR4-28', '1998-VARCHAR3-2VARCHAR', 2, 44.65VARCHARVARCHARVARCHAR15, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '683VARCHAR6', 'Germany');
INSERT INTO orders VALUES (1VARCHAR957, 'HILAA', 8, '1998-VARCHAR3-18', '1998-VARCHAR4-15', '1998-VARCHAR3-27', 3, 1VARCHAR5.36VARCHARVARCHARVARCHAR1, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR958, 'OCEAN', 7, '1998-VARCHAR3-18', '1998-VARCHAR4-15', '1998-VARCHAR3-27', 2, 49.56VARCHARVARCHARVARCHAR14, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 2VARCHAR-A', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR959, 'GOURL', 6, '1998-VARCHAR3-18', '1998-VARCHAR4-29', '1998-VARCHAR3-23', 2, 4.98VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR96VARCHAR, 'HILAA', 3, '1998-VARCHAR3-19', '1998-VARCHAR4-VARCHAR2', '1998-VARCHAR4-VARCHAR8', 1, 2.VARCHAR7999992, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR961, 'QUEEN', 8, '1998-VARCHAR3-19', '1998-VARCHAR4-16', '1998-VARCHAR3-3VARCHAR', 1, 1VARCHAR4.47VARCHARVARCHARVARCHAR1, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR962, 'QUICK', 8, '1998-VARCHAR3-19', '1998-VARCHAR4-16', '1998-VARCHAR3-23', 2, 275.79VARCHARVARCHARVARCHAR9, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR963, 'FURIB', 9, '1998-VARCHAR3-19', '1998-VARCHAR4-16', '1998-VARCHAR3-26', 3, 2.7VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR5, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (1VARCHAR964, 'SPECD', 3, '1998-VARCHAR3-2VARCHAR', '1998-VARCHAR4-17', '1998-VARCHAR3-24', 2, 87.3799973, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75VARCHAR16', 'France');
INSERT INTO orders VALUES (1VARCHAR965, 'OLDWO', 6, '1998-VARCHAR3-2VARCHAR', '1998-VARCHAR4-17', '1998-VARCHAR3-3VARCHAR', 3, 144.38VARCHARVARCHARVARCHAR5, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (1VARCHAR966, 'CHOPS', 4, '1998-VARCHAR3-2VARCHAR', '1998-VARCHAR4-17', '1998-VARCHAR4-VARCHAR8', 1, 27.19VARCHARVARCHARVARCHARVARCHAR5, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3VARCHAR12', 'Switzerland');
INSERT INTO orders VALUES (1VARCHAR967, 'TOMSP', 2, '1998-VARCHAR3-23', '1998-VARCHAR4-2VARCHAR', '1998-VARCHAR4-VARCHAR2', 2, 62.22VARCHARVARCHARVARCHAR12, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44VARCHAR87', 'Germany');
INSERT INTO orders VALUES (1VARCHAR968, 'ERNSH', 1, '1998-VARCHAR3-23', '1998-VARCHAR4-2VARCHAR', '1998-VARCHAR4-VARCHAR1', 3, 74.5999985, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR969, 'COMMI', 1, '1998-VARCHAR3-23', '1998-VARCHAR4-2VARCHAR', '1998-VARCHAR3-3VARCHAR', 2, VARCHAR.2VARCHAR9999993, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', 'VARCHAR5432-VARCHAR43', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR97VARCHAR, 'BOLID', 9, '1998-VARCHAR3-24', '1998-VARCHAR4-VARCHAR7', '1998-VARCHAR4-24', 1, 16.1599998, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28VARCHAR23', 'Spain');
INSERT INTO orders VALUES (1VARCHAR971, 'FRANR', 2, '1998-VARCHAR3-24', '1998-VARCHAR4-21', '1998-VARCHAR4-VARCHAR2', 2, 121.82, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR972, 'LACOR', 4, '1998-VARCHAR3-24', '1998-VARCHAR4-21', '1998-VARCHAR3-26', 2, VARCHAR.VARCHAR199999996, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR973, 'LACOR', 6, '1998-VARCHAR3-24', '1998-VARCHAR4-21', '1998-VARCHAR3-27', 2, 15.17VARCHARVARCHARVARCHARVARCHAR1, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (1VARCHAR974, 'SPLIR', 3, '1998-VARCHAR3-25', '1998-VARCHAR4-VARCHAR8', '1998-VARCHAR4-VARCHAR3', 3, 12.96, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '8252VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR975, 'BOTTM', 1, '1998-VARCHAR3-25', '1998-VARCHAR4-22', '1998-VARCHAR3-27', 3, 32.27VARCHARVARCHARVARCHARVARCHAR5, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR976, 'HILAA', 1, '1998-VARCHAR3-25', '1998-VARCHAR5-VARCHAR6', '1998-VARCHAR4-VARCHAR3', 1, 37.97VARCHARVARCHARVARCHAR12, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR977, 'FOLKO', 8, '1998-VARCHAR3-26', '1998-VARCHAR4-23', '1998-VARCHAR4-1VARCHAR', 3, 2VARCHAR8.5, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR978, 'MAISD', 9, '1998-VARCHAR3-26', '1998-VARCHAR4-23', '1998-VARCHAR4-23', 2, 32.8199997, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-118VARCHAR', 'Belgium');
INSERT INTO orders VALUES (1VARCHAR979, 'ERNSH', 8, '1998-VARCHAR3-26', '1998-VARCHAR4-23', '1998-VARCHAR3-31', 2, 353.VARCHAR7VARCHARVARCHARVARCHAR7, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR98VARCHAR, 'FOLKO', 4, '1998-VARCHAR3-27', '1998-VARCHAR5-VARCHAR8', '1998-VARCHAR4-17', 1, 1.25999999, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR981, 'HANAR', 1, '1998-VARCHAR3-27', '1998-VARCHAR4-24', '1998-VARCHAR4-VARCHAR2', 2, 193.369995, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR982, 'BOTTM', 2, '1998-VARCHAR3-27', '1998-VARCHAR4-24', '1998-VARCHAR4-VARCHAR8', 1, 14.VARCHAR1VARCHARVARCHARVARCHARVARCHAR2, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (1VARCHAR983, 'SAVEA', 2, '1998-VARCHAR3-27', '1998-VARCHAR4-24', '1998-VARCHAR4-VARCHAR6', 2, 657.539978, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR984, 'SAVEA', 1, '1998-VARCHAR3-3VARCHAR', '1998-VARCHAR4-27', '1998-VARCHAR4-VARCHAR3', 3, 211.22VARCHARVARCHARVARCHAR1, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR985, 'HUNGO', 2, '1998-VARCHAR3-3VARCHAR', '1998-VARCHAR4-27', '1998-VARCHAR4-VARCHAR2', 1, 91.51VARCHARVARCHARVARCHAR21, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (1VARCHAR986, 'OCEAN', 8, '1998-VARCHAR3-3VARCHAR', '1998-VARCHAR4-27', '1998-VARCHAR4-21', 2, 217.86VARCHARVARCHARVARCHAR1, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 2VARCHAR-A', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (1VARCHAR987, 'EASTC', 8, '1998-VARCHAR3-31', '1998-VARCHAR4-28', '1998-VARCHAR4-VARCHAR6', 1, 185.479996, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (1VARCHAR988, 'RATTC', 3, '1998-VARCHAR3-31', '1998-VARCHAR4-28', '1998-VARCHAR4-1VARCHAR', 2, 61.1399994, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (1VARCHAR989, 'QUEDE', 2, '1998-VARCHAR3-31', '1998-VARCHAR4-28', '1998-VARCHAR4-VARCHAR2', 1, 34.7599983, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-673', 'Brazil');
INSERT INTO orders VALUES (1VARCHAR99VARCHAR, 'ERNSH', 2, '1998-VARCHAR4-VARCHAR1', '1998-VARCHAR5-13', '1998-VARCHAR4-VARCHAR7', 3, 117.61VARCHARVARCHARVARCHAR1, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (1VARCHAR991, 'QUICK', 1, '1998-VARCHAR4-VARCHAR1', '1998-VARCHAR4-29', '1998-VARCHAR4-VARCHAR7', 1, 38.5VARCHAR99983, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR992, 'THEBI', 1, '1998-VARCHAR4-VARCHAR1', '1998-VARCHAR4-29', '1998-VARCHAR4-VARCHAR3', 3, 4.26999998, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '972VARCHAR1', 'USA');
INSERT INTO orders VALUES (1VARCHAR993, 'FOLKO', 7, '1998-VARCHAR4-VARCHAR1', '1998-VARCHAR4-29', '1998-VARCHAR4-1VARCHAR', 3, 8.81VARCHARVARCHARVARCHARVARCHAR42, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (1VARCHAR994, 'VAFFE', 2, '1998-VARCHAR4-VARCHAR2', '1998-VARCHAR4-16', '1998-VARCHAR4-VARCHAR9', 3, 65.5299988, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '82VARCHARVARCHAR', 'Denmark');
INSERT INTO orders VALUES (1VARCHAR995, 'PERIC', 1, '1998-VARCHAR4-VARCHAR2', '1998-VARCHAR4-3VARCHAR', '1998-VARCHAR4-VARCHAR6', 3, 46, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (1VARCHAR996, 'QUICK', 4, '1998-VARCHAR4-VARCHAR2', '1998-VARCHAR4-3VARCHAR', '1998-VARCHAR4-1VARCHAR', 2, 1.12, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (1VARCHAR997, 'LILAS', 8, '1998-VARCHAR4-VARCHAR3', '1998-VARCHAR5-15', '1998-VARCHAR4-13', 2, 73.91VARCHARVARCHARVARCHAR37, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (1VARCHAR998, 'WOLZA', 8, '1998-VARCHAR4-VARCHAR3', '1998-VARCHAR4-17', '1998-VARCHAR4-17', 2, 2VARCHAR.3VARCHAR99995, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, 'VARCHAR1-VARCHAR12', 'Poland');
INSERT INTO orders VALUES (1VARCHAR999, 'OTTIK', 6, '1998-VARCHAR4-VARCHAR3', '1998-VARCHAR5-VARCHAR1', '1998-VARCHAR4-1VARCHAR', 2, 96.3499985, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (11VARCHARVARCHARVARCHAR, 'RATTC', 2, '1998-VARCHAR4-VARCHAR6', '1998-VARCHAR5-VARCHAR4', '1998-VARCHAR4-14', 3, 55.1199989, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');
INSERT INTO orders VALUES (11VARCHARVARCHAR1, 'FOLKO', 2, '1998-VARCHAR4-VARCHAR6', '1998-VARCHAR5-VARCHAR4', '1998-VARCHAR4-14', 2, 197.3VARCHARVARCHARVARCHARVARCHAR3, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (11VARCHARVARCHAR2, 'SAVEA', 4, '1998-VARCHAR4-VARCHAR6', '1998-VARCHAR5-VARCHAR4', '1998-VARCHAR4-16', 1, 141.16VARCHARVARCHARVARCHAR4, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (11VARCHARVARCHAR3, 'THECR', 3, '1998-VARCHAR4-VARCHAR6', '1998-VARCHAR5-VARCHAR4', '1998-VARCHAR4-VARCHAR8', 3, 14.9VARCHAR99998, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '598VARCHAR1', 'USA');
INSERT INTO orders VALUES (11VARCHARVARCHAR4, 'MAISD', 3, '1998-VARCHAR4-VARCHAR7', '1998-VARCHAR5-VARCHAR5', '1998-VARCHAR4-2VARCHAR', 1, 44.84VARCHARVARCHARVARCHARVARCHAR2, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-118VARCHAR', 'Belgium');
INSERT INTO orders VALUES (11VARCHARVARCHAR5, 'WILMK', 2, '1998-VARCHAR4-VARCHAR7', '1998-VARCHAR5-VARCHAR5', '1998-VARCHAR4-1VARCHAR', 1, VARCHAR.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '2124VARCHAR', 'Finland');
INSERT INTO orders VALUES (11VARCHARVARCHAR6, 'GREAL', 3, '1998-VARCHAR4-VARCHAR7', '1998-VARCHAR5-VARCHAR5', '1998-VARCHAR4-15', 2, 25.19VARCHARVARCHARVARCHARVARCHAR5, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (11VARCHARVARCHAR7, 'PRINI', 8, '1998-VARCHAR4-VARCHAR8', '1998-VARCHAR5-VARCHAR6', '1998-VARCHAR4-13', 2, 2VARCHAR2.24VARCHARVARCHARVARCHAR5, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (11VARCHARVARCHAR8, 'ERNSH', 7, '1998-VARCHAR4-VARCHAR8', '1998-VARCHAR5-VARCHAR6', NULL, 3, 79.4599991, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (11VARCHARVARCHAR9, 'GODOS', 2, '1998-VARCHAR4-VARCHAR8', '1998-VARCHAR5-VARCHAR6', '1998-VARCHAR4-1VARCHAR', 1, 59.11VARCHARVARCHARVARCHARVARCHAR6, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (11VARCHAR1VARCHAR, 'REGGC', 2, '1998-VARCHAR4-VARCHAR9', '1998-VARCHAR5-VARCHAR7', '1998-VARCHAR4-21', 2, 28.7VARCHAR99991, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (11VARCHAR11, 'ALFKI', 3, '1998-VARCHAR4-VARCHAR9', '1998-VARCHAR5-VARCHAR7', '1998-VARCHAR4-13', 1, 1.21VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '122VARCHAR9', 'Germany');
INSERT INTO orders VALUES (11VARCHAR12, 'FRANK', 1, '1998-VARCHAR4-VARCHAR9', '1998-VARCHAR4-23', '1998-VARCHAR4-17', 3, 242.949997, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '8VARCHAR8VARCHAR5', 'Germany');
INSERT INTO orders VALUES (11VARCHAR13, 'ROMEY', 2, '1998-VARCHAR4-VARCHAR9', '1998-VARCHAR5-VARCHAR7', '1998-VARCHAR4-1VARCHAR', 1, 32.99VARCHARVARCHARVARCHAR17, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28VARCHARVARCHAR1', 'Spain');
INSERT INTO orders VALUES (11VARCHAR14, 'LINOD', 2, '1998-VARCHAR4-1VARCHAR', '1998-VARCHAR5-VARCHAR8', '1998-VARCHAR4-15', 3, 23.6VARCHARVARCHARVARCHARVARCHARVARCHAR4, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (11VARCHAR15, 'SANTG', 2, '1998-VARCHAR4-1VARCHAR', '1998-VARCHAR4-24', '1998-VARCHAR4-2VARCHAR', 2, 4.61999989, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '411VARCHAR', 'Norway');
INSERT INTO orders VALUES (11VARCHAR16, 'AROUT', 9, '1998-VARCHAR4-1VARCHAR', '1998-VARCHAR5-VARCHAR8', '1998-VARCHAR4-13', 2, 33.7999992, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (11VARCHAR17, 'ERNSH', 9, '1998-VARCHAR4-13', '1998-VARCHAR5-11', '1998-VARCHAR4-2VARCHAR', 2, 754.26VARCHARVARCHAR1, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (11VARCHAR18, 'LONEP', 4, '1998-VARCHAR4-13', '1998-VARCHAR5-11', '1998-VARCHAR4-16', 2, 11.6499996, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (11VARCHAR19, 'RANCH', 6, '1998-VARCHAR4-13', '1998-VARCHAR5-11', NULL, 3, 3.17VARCHARVARCHARVARCHARVARCHARVARCHAR8, 'Rancho grande', 'Av. del Libertador 9VARCHARVARCHAR', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (11VARCHAR2VARCHAR, 'OTTIK', 2, '1998-VARCHAR4-14', '1998-VARCHAR5-12', '1998-VARCHAR4-16', 2, 43.2999992, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '5VARCHAR739', 'Germany');
INSERT INTO orders VALUES (11VARCHAR21, 'QUICK', 3, '1998-VARCHAR4-14', '1998-VARCHAR5-12', '1998-VARCHAR4-21', 1, 297.179993, 'QUICK-Stop', 'Taucherstraße 1VARCHAR', 'Cunewalde', NULL, 'VARCHAR13VARCHAR7', 'Germany');
INSERT INTO orders VALUES (11VARCHAR22, 'HANAR', 9, '1998-VARCHAR4-14', '1998-VARCHAR5-12', '1998-VARCHAR5-VARCHAR4', 2, 6.26999998, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (11VARCHAR23, 'BSBEV', 1, '1998-VARCHAR4-14', '1998-VARCHAR4-28', '1998-VARCHAR4-24', 2, 123.83VARCHARVARCHARVARCHAR2, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (11VARCHAR24, 'EASTC', 4, '1998-VARCHAR4-15', '1998-VARCHAR5-13', '1998-VARCHAR4-2VARCHAR', 1, 74.36VARCHARVARCHARVARCHARVARCHAR6, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (11VARCHAR25, 'WARTH', 6, '1998-VARCHAR4-15', '1998-VARCHAR5-13', '1998-VARCHAR4-24', 3, 29.17VARCHARVARCHARVARCHARVARCHAR1, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '9VARCHAR11VARCHAR', 'Finland');
INSERT INTO orders VALUES (11VARCHAR26, 'FRANS', 4, '1998-VARCHAR4-15', '1998-VARCHAR5-13', '1998-VARCHAR4-28', 1, 47.VARCHAR9VARCHARVARCHARVARCHARVARCHAR2, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '1VARCHAR1VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (11VARCHAR27, 'BOTTM', 1, '1998-VARCHAR4-16', '1998-VARCHAR5-14', '1998-VARCHAR4-2VARCHAR', 1, 52.52VARCHARVARCHARVARCHARVARCHAR5, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (11VARCHAR28, 'KOENE', 2, '1998-VARCHAR4-16', '1998-VARCHAR5-14', '1998-VARCHAR4-22', 1, 29.59VARCHARVARCHARVARCHARVARCHAR2, 'Königlich Essen', 'Maubelstr. 9VARCHAR', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (11VARCHAR29, 'CHOPS', 4, '1998-VARCHAR4-16', '1998-VARCHAR5-14', '1998-VARCHAR4-27', 1, 47.84VARCHARVARCHARVARCHARVARCHAR2, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3VARCHAR12', 'Switzerland');
INSERT INTO orders VALUES (11VARCHAR3VARCHAR, 'SAVEA', 7, '1998-VARCHAR4-17', '1998-VARCHAR5-15', '1998-VARCHAR4-27', 2, 83VARCHAR.75, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (11VARCHAR31, 'SAVEA', 6, '1998-VARCHAR4-17', '1998-VARCHAR5-15', '1998-VARCHAR4-24', 2, 227.22VARCHARVARCHARVARCHAR1, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (11VARCHAR32, 'WHITC', 2, '1998-VARCHAR4-17', '1998-VARCHAR5-15', '1998-VARCHAR4-23', 3, 6VARCHAR6.19VARCHARVARCHARVARCHAR2, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (11VARCHAR33, 'RICSU', 7, '1998-VARCHAR4-17', '1998-VARCHAR5-15', '1998-VARCHAR4-23', 3, 84.7399979, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (11VARCHAR34, 'OLDWO', 8, '1998-VARCHAR4-2VARCHAR', '1998-VARCHAR6-VARCHAR1', '1998-VARCHAR4-27', 1, 4VARCHAR.3199997, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '995VARCHAR8', 'USA');
INSERT INTO orders VALUES (11VARCHAR35, 'SUPRD', 2, '1998-VARCHAR4-2VARCHAR', '1998-VARCHAR5-18', '1998-VARCHAR4-24', 2, VARCHAR.17VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (11VARCHAR36, 'DRACD', 8, '1998-VARCHAR4-2VARCHAR', '1998-VARCHAR5-18', '1998-VARCHAR4-22', 3, 149.47VARCHARVARCHARVARCHAR1, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52VARCHAR66', 'Germany');
INSERT INTO orders VALUES (11VARCHAR37, 'GODOS', 7, '1998-VARCHAR4-21', '1998-VARCHAR5-19', '1998-VARCHAR4-27', 1, 3.2VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR5, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '411VARCHAR1', 'Spain');
INSERT INTO orders VALUES (11VARCHAR38, 'SUPRD', 1, '1998-VARCHAR4-21', '1998-VARCHAR5-19', '1998-VARCHAR4-3VARCHAR', 2, 29.59VARCHARVARCHARVARCHARVARCHAR2, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6VARCHARVARCHARVARCHAR', 'Belgium');
INSERT INTO orders VALUES (11VARCHAR39, 'LINOD', 1, '1998-VARCHAR4-21', '1998-VARCHAR5-19', NULL, 2, 65, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '498VARCHAR', 'Venezuela');
INSERT INTO orders VALUES (11VARCHAR4VARCHAR, 'GREAL', 4, '1998-VARCHAR4-22', '1998-VARCHAR5-2VARCHAR', NULL, 3, 18.84VARCHARVARCHARVARCHARVARCHAR2, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (11VARCHAR41, 'CHOPS', 3, '1998-VARCHAR4-22', '1998-VARCHAR5-2VARCHAR', '1998-VARCHAR4-28', 2, 48.22VARCHARVARCHARVARCHAR12, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3VARCHAR12', 'Switzerland');
INSERT INTO orders VALUES (11VARCHAR42, 'COMMI', 2, '1998-VARCHAR4-22', '1998-VARCHAR5-VARCHAR6', '1998-VARCHAR5-VARCHAR1', 1, 29.9899998, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', 'VARCHAR5432-VARCHAR43', 'Brazil');
INSERT INTO orders VALUES (11VARCHAR43, 'SPECD', 5, '1998-VARCHAR4-22', '1998-VARCHAR5-2VARCHAR', '1998-VARCHAR4-29', 2, 8.8VARCHARVARCHARVARCHARVARCHARVARCHAR19, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75VARCHAR16', 'France');
INSERT INTO orders VALUES (11VARCHAR44, 'WOLZA', 4, '1998-VARCHAR4-23', '1998-VARCHAR5-21', '1998-VARCHAR5-VARCHAR1', 1, 8.72VARCHARVARCHARVARCHARVARCHAR27, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, 'VARCHAR1-VARCHAR12', 'Poland');
INSERT INTO orders VALUES (11VARCHAR45, 'BOTTM', 6, '1998-VARCHAR4-23', '1998-VARCHAR5-21', NULL, 2, 7VARCHAR.58VARCHARVARCHARVARCHAR18, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (11VARCHAR46, 'WANDK', 8, '1998-VARCHAR4-23', '1998-VARCHAR5-21', '1998-VARCHAR4-24', 2, 71.6399994, 'Die Wandernde Kuh', 'Adenauerallee 9VARCHARVARCHAR', 'Stuttgart', NULL, '7VARCHAR563', 'Germany');
INSERT INTO orders VALUES (11VARCHAR47, 'EASTC', 7, '1998-VARCHAR4-24', '1998-VARCHAR5-22', '1998-VARCHAR5-VARCHAR1', 3, 46.6199989, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (11VARCHAR48, 'BOTTM', 7, '1998-VARCHAR4-24', '1998-VARCHAR5-22', '1998-VARCHAR4-3VARCHAR', 3, 24.12VARCHARVARCHARVARCHARVARCHAR8, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (11VARCHAR49, 'GOURL', 3, '1998-VARCHAR4-24', '1998-VARCHAR5-22', '1998-VARCHAR5-VARCHAR4', 1, 8.34VARCHARVARCHARVARCHARVARCHAR15, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', 'VARCHAR4876-786', 'Brazil');
INSERT INTO orders VALUES (11VARCHAR5VARCHAR, 'FOLKO', 8, '1998-VARCHAR4-27', '1998-VARCHAR5-25', '1998-VARCHAR5-VARCHAR5', 2, 59.4VARCHAR99998, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (11VARCHAR51, 'LAMAI', 7, '1998-VARCHAR4-27', '1998-VARCHAR5-25', NULL, 3, 2.78999996, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31VARCHARVARCHARVARCHAR', 'France');
INSERT INTO orders VALUES (11VARCHAR52, 'HANAR', 3, '1998-VARCHAR4-27', '1998-VARCHAR5-25', '1998-VARCHAR5-VARCHAR1', 1, 67.26VARCHARVARCHARVARCHAR21, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', 'VARCHAR5454-876', 'Brazil');
INSERT INTO orders VALUES (11VARCHAR53, 'PICCO', 2, '1998-VARCHAR4-27', '1998-VARCHAR5-25', '1998-VARCHAR4-29', 2, 53.VARCHAR499992, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5VARCHAR2VARCHAR', 'Austria');
INSERT INTO orders VALUES (11VARCHAR54, 'CACTU', 8, '1998-VARCHAR4-28', '1998-VARCHAR5-26', NULL, 1, VARCHAR.33VARCHARVARCHARVARCHARVARCHARVARCHAR13, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1VARCHAR1VARCHAR', 'Argentina');
INSERT INTO orders VALUES (11VARCHAR55, 'HILAA', 7, '1998-VARCHAR4-28', '1998-VARCHAR5-26', '1998-VARCHAR5-VARCHAR5', 2, 12VARCHAR.919998, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5VARCHAR22', 'Venezuela');
INSERT INTO orders VALUES (11VARCHAR56, 'EASTC', 8, '1998-VARCHAR4-28', '1998-VARCHAR5-12', '1998-VARCHAR5-VARCHAR1', 2, 278.959991, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (11VARCHAR57, 'NORTS', 3, '1998-VARCHAR4-29', '1998-VARCHAR5-27', '1998-VARCHAR5-VARCHAR1', 3, 4.13VARCHARVARCHARVARCHARVARCHAR11, 'North/South', 'South House 3VARCHARVARCHAR Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES (11VARCHAR58, 'BLAUS', 9, '1998-VARCHAR4-29', '1998-VARCHAR5-27', NULL, 3, 31.1399994, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '683VARCHAR6', 'Germany');
INSERT INTO orders VALUES (11VARCHAR59, 'RICAR', 2, '1998-VARCHAR4-29', '1998-VARCHAR6-1VARCHAR', NULL, 2, 85.8VARCHARVARCHARVARCHARVARCHAR31, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', 'VARCHAR2389-89VARCHAR', 'Brazil');
INSERT INTO orders VALUES (11VARCHAR6VARCHAR, 'FRANS', 2, '1998-VARCHAR4-3VARCHAR', '1998-VARCHAR5-28', '1998-VARCHAR5-VARCHAR4', 2, 1VARCHAR.9799995, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '1VARCHAR1VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (11VARCHAR61, 'GREAL', 4, '1998-VARCHAR4-3VARCHAR', '1998-VARCHAR6-11', NULL, 3, 14.VARCHAR1VARCHARVARCHARVARCHARVARCHAR2, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '974VARCHAR3', 'USA');
INSERT INTO orders VALUES (11VARCHAR62, 'REGGC', 4, '1998-VARCHAR4-3VARCHAR', '1998-VARCHAR5-28', NULL, 2, 29.93VARCHARVARCHARVARCHARVARCHAR3, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '421VARCHARVARCHAR', 'Italy');
INSERT INTO orders VALUES (11VARCHAR63, 'HUNGO', 3, '1998-VARCHAR4-3VARCHAR', '1998-VARCHAR5-28', '1998-VARCHAR5-VARCHAR6', 2, 81.73VARCHARVARCHARVARCHAR34, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (11VARCHAR64, 'SAVEA', 1, '1998-VARCHAR5-VARCHAR1', '1998-VARCHAR5-29', '1998-VARCHAR5-VARCHAR4', 1, 3VARCHAR.VARCHAR9VARCHARVARCHARVARCHARVARCHAR2, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '8372VARCHAR', 'USA');
INSERT INTO orders VALUES (11VARCHAR65, 'LILAS', 8, '1998-VARCHAR5-VARCHAR1', '1998-VARCHAR5-29', NULL, 1, 12.9VARCHAR99998, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (11VARCHAR66, 'WHITC', 7, '1998-VARCHAR5-VARCHAR1', '1998-VARCHAR5-29', '1998-VARCHAR5-VARCHAR4', 2, 44.72VARCHARVARCHARVARCHAR12, 'White Clover Markets', '1VARCHAR29 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (11VARCHAR67, 'DRACD', 1, '1998-VARCHAR5-VARCHAR4', '1998-VARCHAR5-18', '1998-VARCHAR5-VARCHAR6', 2, 7.98VARCHARVARCHARVARCHARVARCHARVARCHAR2, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52VARCHAR66', 'Germany');
INSERT INTO orders VALUES (11VARCHAR68, 'QUEEN', 8, '1998-VARCHAR5-VARCHAR4', '1998-VARCHAR6-VARCHAR1', NULL, 2, 81.75, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', 'VARCHAR5487-VARCHAR2VARCHAR', 'Brazil');
INSERT INTO orders VALUES (11VARCHAR69, 'TORTU', 1, '1998-VARCHAR5-VARCHAR4', '1998-VARCHAR6-VARCHAR1', '1998-VARCHAR5-VARCHAR6', 2, 15.67VARCHARVARCHARVARCHARVARCHAR1, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (11VARCHAR7VARCHAR, 'LEHMS', 2, '1998-VARCHAR5-VARCHAR5', '1998-VARCHAR6-VARCHAR2', NULL, 1, 136, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '6VARCHAR528', 'Germany');
INSERT INTO orders VALUES (11VARCHAR71, 'LILAS', 1, '1998-VARCHAR5-VARCHAR5', '1998-VARCHAR6-VARCHAR2', NULL, 1, VARCHAR.93VARCHARVARCHARVARCHARVARCHARVARCHARVARCHAR7, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '35VARCHAR8', 'Venezuela');
INSERT INTO orders VALUES (11VARCHAR72, 'ERNSH', 4, '1998-VARCHAR5-VARCHAR5', '1998-VARCHAR6-VARCHAR2', NULL, 2, 258.64VARCHARVARCHAR15, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8VARCHAR1VARCHAR', 'Austria');
INSERT INTO orders VALUES (11VARCHAR73, 'PERIC', 2, '1998-VARCHAR5-VARCHAR5', '1998-VARCHAR6-VARCHAR2', NULL, 2, 24.95VARCHARVARCHARVARCHARVARCHAR8, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, 'VARCHAR5VARCHAR33', 'Mexico');
INSERT INTO orders VALUES (11VARCHAR74, 'SIMOB', 7, '1998-VARCHAR5-VARCHAR6', '1998-VARCHAR6-VARCHAR3', NULL, 2, 18.44VARCHARVARCHARVARCHARVARCHAR5, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (11VARCHAR75, 'RICSU', 8, '1998-VARCHAR5-VARCHAR6', '1998-VARCHAR6-VARCHAR3', NULL, 2, 6.19VARCHARVARCHARVARCHARVARCHARVARCHAR6, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '12VARCHAR4', 'Switzerland');
INSERT INTO orders VALUES (11VARCHAR76, 'BONAP', 4, '1998-VARCHAR5-VARCHAR6', '1998-VARCHAR6-VARCHAR3', NULL, 2, 38.2799988, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13VARCHARVARCHAR8', 'France');
INSERT INTO orders VALUES (11VARCHAR77, 'RATTC', 1, '1998-VARCHAR5-VARCHAR6', '1998-VARCHAR6-VARCHAR3', NULL, 2, 8.52999973, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '8711VARCHAR', 'USA');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO products VALUES (1, 'Chai', 8, 1, '1VARCHAR boxes x 3VARCHAR bags', 18, 39, VARCHAR, 1VARCHAR, 1);
INSERT INTO products VALUES (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 4VARCHAR, 25, 1);
INSERT INTO products VALUES (3, 'Aniseed Syrup', 1, 2, '12 - 55VARCHAR ml bottles', 1VARCHAR, 13, 7VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35VARCHARVARCHARVARCHARVARCHAR4, VARCHAR, VARCHAR, VARCHAR, 1);
INSERT INTO products VALUES (6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 12VARCHAR, VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 3VARCHAR, 15, VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO products VALUES (8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 4VARCHAR, 6, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (9, 'Mishi Kobe Niku', 4, 6, '18 - 5VARCHARVARCHAR g pkgs.', 97, 29, VARCHAR, VARCHAR, 1);
INSERT INTO products VALUES (1VARCHAR, 'Ikura', 4, 8, '12 - 2VARCHARVARCHAR ml jars', 31, 31, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 3VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO products VALUES (12, 'Queso Manchego La Pastora', 5, 4, '1VARCHAR - 5VARCHARVARCHAR g pkgs.', 38, 86, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (13, 'Konbu', 6, 8, '2 kg box', 6, 24, VARCHAR, 5, VARCHAR);
INSERT INTO products VALUES (14, 'Tofu', 6, 7, '4VARCHAR - 1VARCHARVARCHAR g pkgs.', 23.25, 35, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (15, 'Genen Shouyu', 6, 2, '24 - 25VARCHAR ml bottles', 13, 39, VARCHAR, 5, VARCHAR);
INSERT INTO products VALUES (16, 'Pavlova', 7, 3, '32 - 5VARCHARVARCHAR g boxes', 17.45VARCHARVARCHARVARCHARVARCHAR8, 29, VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO products VALUES (17, 'Alice Mutton', 7, 6, '2VARCHAR - 1 kg tins', 39, VARCHAR, VARCHAR, VARCHAR, 1);
INSERT INTO products VALUES (18, 'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.5, 42, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (19, 'Teatime Chocolate Biscuits', 8, 3, '1VARCHAR boxes x 12 pieces', 9.19999981, 25, VARCHAR, 5, VARCHAR);
INSERT INTO products VALUES (2VARCHAR, 'Sir Rodney''s Marmalade', 8, 3, '3VARCHAR gift boxes', 81, 4VARCHAR, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (21, 'Sir Rodney''s Scones', 8, 3, '24 pkgs. x 4 pieces', 1VARCHAR, 3, 4VARCHAR, 5, VARCHAR);
INSERT INTO products VALUES (22, 'Gustaf''s Knäckebröd', 9, 5, '24 - 5VARCHARVARCHAR g pkgs.', 21, 1VARCHAR4, VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (23, 'Tunnbröd', 9, 5, '12 - 25VARCHAR g pkgs.', 9, 61, VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (24, 'Guaraná Fantástica', 1VARCHAR, 1, '12 - 355 ml cans', 4.5, 2VARCHAR, VARCHAR, VARCHAR, 1);
INSERT INTO products VALUES (25, 'NuNuCa Nuß-Nougat-Creme', 11, 3, '2VARCHAR - 45VARCHAR g glasses', 14, 76, VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO products VALUES (26, 'Gumbär Gummibärchen', 11, 3, '1VARCHARVARCHAR - 25VARCHAR g bags', 31.2299995, 15, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (27, 'Schoggi Schokolade', 11, 3, '1VARCHARVARCHAR - 1VARCHARVARCHAR g pieces', 43.9VARCHARVARCHARVARCHARVARCHAR15, 49, VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO products VALUES (28, 'Rössle Sauerkraut', 12, 7, '25 - 825 g cans', 45.5999985, 26, VARCHAR, VARCHAR, 1);
INSERT INTO products VALUES (29, 'Thüringer Rostbratwurst', 12, 6, '5VARCHAR bags x 3VARCHAR sausgs.', 123.79VARCHARVARCHARVARCHAR1, VARCHAR, VARCHAR, VARCHAR, 1);
INSERT INTO products VALUES (3VARCHAR, 'Nord-Ost Matjeshering', 13, 8, '1VARCHAR - 2VARCHARVARCHAR g glasses', 25.8899994, 1VARCHAR, VARCHAR, 15, VARCHAR);
INSERT INTO products VALUES (31, 'Gorgonzola Telino', 14, 4, '12 - 1VARCHARVARCHAR g pkgs', 12.5, VARCHAR, 7VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO products VALUES (32, 'Mascarpone Fabioli', 14, 4, '24 - 2VARCHARVARCHAR g pkgs.', 32, 9, 4VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (33, 'Geitost', 15, 4, '5VARCHARVARCHAR g', 2.5, 112, VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO products VALUES (34, 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14, 111, VARCHAR, 15, VARCHAR);
INSERT INTO products VALUES (35, 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18, 2VARCHAR, VARCHAR, 15, VARCHAR);
INSERT INTO products VALUES (36, 'Inlagd Sill', 17, 8, '24 - 25VARCHAR g  jars', 19, 112, VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO products VALUES (37, 'Gravad lax', 17, 8, '12 - 5VARCHARVARCHAR g pkgs.', 26, 11, 5VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (38, 'Côte de Blaye', 18, 1, '12 - 75 cl bottles', 263.5, 17, VARCHAR, 15, VARCHAR);
INSERT INTO products VALUES (39, 'Chartreuse verte', 18, 1, '75VARCHAR cc per bottle', 18, 69, VARCHAR, 5, VARCHAR);
INSERT INTO products VALUES (4VARCHAR, 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.3999996, 123, VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO products VALUES (41, 'Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.64999962, 85, VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO products VALUES (42, 'Singaporean Hokkien Fried Mee', 2VARCHAR, 5, '32 - 1 kg pkgs.', 14, 26, VARCHAR, VARCHAR, 1);
INSERT INTO products VALUES (43, 'Ipoh Coffee', 2VARCHAR, 1, '16 - 5VARCHARVARCHAR g tins', 46, 17, 1VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (44, 'Gula Malacca', 2VARCHAR, 2, '2VARCHAR - 2 kg bags', 19.45VARCHARVARCHARVARCHARVARCHAR8, 27, VARCHAR, 15, VARCHAR);
INSERT INTO products VALUES (45, 'Rogede sild', 21, 8, '1k pkg.', 9.5, 5, 7VARCHAR, 15, VARCHAR);
INSERT INTO products VALUES (46, 'Spegesild', 21, 8, '4 - 45VARCHAR g glasses', 12, 95, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (47, 'Zaanse koeken', 22, 3, '1VARCHAR - 4 oz boxes', 9.5, 36, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (48, 'Chocolade', 22, 3, '1VARCHAR pkgs.', 12.75, 15, 7VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (49, 'Maxilaku', 23, 3, '24 - 5VARCHAR g pkgs.', 2VARCHAR, 1VARCHAR, 6VARCHAR, 15, VARCHAR);
INSERT INTO products VALUES (5VARCHAR, 'Valkoinen suklaa', 23, 3, '12 - 1VARCHARVARCHAR g bars', 16.25, 65, VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO products VALUES (51, 'Manjimup Dried Apples', 24, 7, '5VARCHAR - 3VARCHARVARCHAR g pkgs.', 53, 2VARCHAR, VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO products VALUES (52, 'Filo Mix', 24, 5, '16 - 2 kg boxes', 7, 38, VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (53, 'Perth Pasties', 24, 6, '48 pieces', 32.7999992, VARCHAR, VARCHAR, VARCHAR, 1);
INSERT INTO products VALUES (54, 'Tourtière', 25, 6, '16 pies', 7.44999981, 21, VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO products VALUES (55, 'Pâté chinois', 25, 6, '24 boxes x 2 pies', 24, 115, VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO products VALUES (56, 'Gnocchi di nonna Alice', 26, 5, '24 - 25VARCHAR g pkgs.', 38, 21, 1VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO products VALUES (57, 'Ravioli Angelo', 26, 5, '24 - 25VARCHAR g pkgs.', 19.5, 36, VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO products VALUES (58, 'Escargots de Bourgogne', 27, 8, '24 pieces', 13.25, 62, VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO products VALUES (59, 'Raclette Courdavault', 28, 4, '5 kg pkg.', 55, 79, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (6VARCHAR, 'Camembert Pierrot', 28, 4, '15 - 3VARCHARVARCHAR g rounds', 34, 19, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (61, 'Sirop d''érable', 29, 2, '24 - 5VARCHARVARCHAR ml bottles', 28.5, 113, VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (62, 'Tarte au sucre', 29, 3, '48 pies', 49.2999992, 17, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (63, 'Vegie-spread', 7, 2, '15 - 625 g jars', 43.9VARCHARVARCHARVARCHARVARCHAR15, 24, VARCHAR, 5, VARCHAR);
INSERT INTO products VALUES (64, 'Wimmers gute Semmelknödel', 12, 5, '2VARCHAR bags x 4 pieces', 33.25, 22, 8VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO products VALUES (65, 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.VARCHAR499992, 76, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (66, 'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17, 4, 1VARCHARVARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO products VALUES (67, 'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14, 52, VARCHAR, 1VARCHAR, VARCHAR);
INSERT INTO products VALUES (68, 'Scottish Longbreads', 8, 3, '1VARCHAR boxes x 8 pieces', 12.5, 6, 1VARCHAR, 15, VARCHAR);
INSERT INTO products VALUES (69, 'Gudbrandsdalsost', 15, 4, '1VARCHAR kg pkg.', 36, 26, VARCHAR, 15, VARCHAR);
INSERT INTO products VALUES (7VARCHAR, 'Outback Lager', 7, 1, '24 - 355 ml bottles', 15, 15, 1VARCHAR, 3VARCHAR, VARCHAR);
INSERT INTO products VALUES (71, 'Flotemysost', 15, 4, '1VARCHAR - 5VARCHARVARCHAR g pkgs.', 21.5, 26, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (72, 'Mozzarella di Giovanni', 14, 4, '24 - 2VARCHARVARCHAR g pkgs.', 34.7999992, 14, VARCHAR, VARCHAR, VARCHAR);
INSERT INTO products VALUES (73, 'Röd Kaviar', 17, 8, '24 - 15VARCHAR g jars', 15, 1VARCHAR1, VARCHAR, 5, VARCHAR);
INSERT INTO products VALUES (74, 'Longlife Tofu', 4, 7, '5 kg pkg.', 1VARCHAR, 4, 2VARCHAR, 5, VARCHAR);
INSERT INTO products VALUES (75, 'Rhönbräu Klosterbier', 12, 1, '24 - VARCHAR.5 l bottles', 7.75, 125, VARCHAR, 25, VARCHAR);
INSERT INTO products VALUES (76, 'Lakkalikööri', 23, 1, '5VARCHARVARCHAR ml', 18, 57, VARCHAR, 2VARCHAR, VARCHAR);
INSERT INTO products VALUES (77, 'Original Frankfurter grüne Soße', 12, 2, '12 boxes', 13, 32, VARCHAR, 15, VARCHAR);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO region VALUES (1, 'Eastern');
INSERT INTO region VALUES (2, 'Western');
INSERT INTO region VALUES (3, 'Northern');
INSERT INTO region VALUES (4, 'Southern');


--
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO shippers VALUES (1, 'Speedy Express', '(5VARCHAR3) 555-9831');
INSERT INTO shippers VALUES (2, 'United Package', '(5VARCHAR3) 555-3199');
INSERT INTO shippers VALUES (3, 'Federal Shipping', '(5VARCHAR3) 555-9931');
INSERT INTO shippers VALUES (4, 'Alliance Shippers', '1-8VARCHARVARCHAR-222-VARCHAR451');
INSERT INTO shippers VALUES (5, 'UPS', '1-8VARCHARVARCHAR-782-7892');
INSERT INTO shippers VALUES (6, 'DHL', '1-8VARCHARVARCHAR-225-5345');



--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO suppliers VALUES (1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL);
INSERT INTO suppliers VALUES (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '7VARCHAR117', 'USA', '(1VARCHARVARCHAR) 555-4822', NULL, '#CAJUN.HTM#');
INSERT INTO suppliers VALUES (3, 'Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '7VARCHAR7 Oxford Rd.', 'Ann Arbor', 'MI', '481VARCHAR4', 'USA', '(313) 555-5735', '(313) 555-3349', NULL);
INSERT INTO suppliers VALUES (4, 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '1VARCHARVARCHAR', 'Japan', '(VARCHAR3) 3555-5VARCHAR11', NULL, NULL);
INSERT INTO suppliers VALUES (5, 'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33VARCHARVARCHAR7', 'Spain', '(98) 598 76 54', NULL, NULL);
INSERT INTO suppliers VALUES (6, 'Mayumi''s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japan', '(VARCHAR6) 431-7877', NULL, 'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO suppliers VALUES (7, 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3VARCHAR58', 'Australia', '(VARCHAR3) 444-2343', '(VARCHAR3) 444-6588', NULL);
INSERT INTO suppliers VALUES (8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL);
INSERT INTO suppliers VALUES (9, 'PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Sweden', 'VARCHAR31-987 65 43', 'VARCHAR31-987 65 91', NULL);
INSERT INTO suppliers VALUES (1VARCHAR, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.89VARCHAR', 'Sao Paulo', NULL, '5442', 'Brazil', '(11) 555 464VARCHAR', NULL, NULL);
INSERT INTO suppliers VALUES (11, 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstraße 5', 'Berlin', NULL, '1VARCHAR785', 'Germany', '(VARCHAR1VARCHAR) 998451VARCHAR', NULL, NULL);
INSERT INTO suppliers VALUES (12, 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '6VARCHAR439', 'Germany', '(VARCHAR69) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO suppliers VALUES (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(VARCHAR4721) 8713', '(VARCHAR4721) 8714', NULL);
INSERT INTO suppliers VALUES (14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '481VARCHARVARCHAR', 'Italy', '(VARCHAR544) 6VARCHAR323', '(VARCHAR544) 6VARCHAR6VARCHAR3', '#FORMAGGI.HTM#');
INSERT INTO suppliers VALUES (15, 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '132VARCHAR', 'Norway', '(VARCHAR)2-953VARCHAR1VARCHAR', NULL, NULL);
INSERT INTO suppliers VALUES (16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '34VARCHARVARCHAR - 8th Avenue Suite 21VARCHAR', 'Bend', 'OR', '971VARCHAR1', 'USA', '(5VARCHAR3) 555-9931', NULL, NULL);
INSERT INTO suppliers VALUES (17, 'Svensk Sjöföda AB', 'Michael Björn', 'Sales Representative', 'Brovallavägen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', 'VARCHAR8-123 45 67', NULL, NULL);
INSERT INTO suppliers VALUES (18, 'Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Sales Manager', '2VARCHAR3, Rue des Francs-Bourgeois', 'Paris', NULL, '75VARCHARVARCHAR4', 'France', '(1) VARCHAR3.83.VARCHARVARCHAR.68', '(1) VARCHAR3.83.VARCHARVARCHAR.62', NULL);
INSERT INTO suppliers VALUES (19, 'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept. 21VARCHARVARCHAR Paul Revere Blvd.', 'Boston', 'MA', 'VARCHAR2134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL);
INSERT INTO suppliers VALUES (2VARCHAR, 'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #4VARCHAR2', 'Singapore', NULL, 'VARCHAR512', 'Singapore', '555-8787', NULL, NULL);
INSERT INTO suppliers VALUES (21, 'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild Fiskebakken 1VARCHAR', 'Lyngby', NULL, '28VARCHARVARCHAR', 'Denmark', '438441VARCHAR8', '43844115', NULL);
INSERT INTO suppliers VALUES (22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop Rijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 121VARCHAR', NULL);
INSERT INTO suppliers VALUES (23, 'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '5312VARCHAR', 'Finland', '(953) 1VARCHAR956', NULL, NULL);
INSERT INTO suppliers VALUES (24, 'G''day, Mate', 'Wendy Mackenzie', 'Sales Representative', '17VARCHAR Prince Edward Parade Hunter''s Hill', 'Sydney', 'NSW', '2VARCHAR42', 'Australia', '(VARCHAR2) 555-5914', '(VARCHAR2) 555-4873', 'G''day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#');
INSERT INTO suppliers VALUES (25, 'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '296VARCHAR Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-9VARCHAR22', NULL, NULL);
INSERT INTO suppliers VALUES (26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '841VARCHARVARCHAR', 'Italy', '(VARCHAR89) 6547665', '(VARCHAR89) 6547667', NULL);
INSERT INTO suppliers VALUES (27, 'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '713VARCHARVARCHAR', 'France', '85.57.VARCHARVARCHAR.VARCHAR7', NULL, NULL);
INSERT INTO suppliers VALUES (28, 'Gai pâturage', 'Eliane Noz', 'Sales Representative', 'Bat. B 3, rue des Alpes', 'Annecy', NULL, '74VARCHARVARCHARVARCHAR', 'France', '38.76.98.VARCHAR6', '38.76.98.58', NULL);
INSERT INTO suppliers VALUES (29, 'Forêts d''érables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL);


--
-- Data for Name: territories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO territories VALUES ('VARCHAR1581', 'Westboro', 1);
INSERT INTO territories VALUES ('VARCHAR173VARCHAR', 'Bedford', 1);
INSERT INTO territories VALUES ('VARCHAR1833', 'Georgetow', 1);
INSERT INTO territories VALUES ('VARCHAR2116', 'Boston', 1);
INSERT INTO territories VALUES ('VARCHAR2139', 'Cambridge', 1);
INSERT INTO territories VALUES ('VARCHAR2184', 'Braintree', 1);
INSERT INTO territories VALUES ('VARCHAR29VARCHAR3', 'Providence', 1);
INSERT INTO territories VALUES ('VARCHAR3VARCHAR49', 'Hollis', 3);
INSERT INTO territories VALUES ('VARCHAR38VARCHAR1', 'Portsmouth', 3);
INSERT INTO territories VALUES ('VARCHAR6897', 'Wilton', 1);
INSERT INTO territories VALUES ('VARCHAR796VARCHAR', 'Morristown', 1);
INSERT INTO territories VALUES ('VARCHAR8837', 'Edison', 1);
INSERT INTO territories VALUES ('1VARCHARVARCHAR19', 'New York', 1);
INSERT INTO territories VALUES ('1VARCHARVARCHAR38', 'New York', 1);
INSERT INTO territories VALUES ('11747', 'Mellvile', 1);
INSERT INTO territories VALUES ('1445VARCHAR', 'Fairport', 1);
INSERT INTO territories VALUES ('19428', 'Philadelphia', 3);
INSERT INTO territories VALUES ('19713', 'Neward', 1);
INSERT INTO territories VALUES ('2VARCHAR852', 'Rockville', 1);
INSERT INTO territories VALUES ('274VARCHAR3', 'Greensboro', 1);
INSERT INTO territories VALUES ('27511', 'Cary', 1);
INSERT INTO territories VALUES ('292VARCHAR2', 'Columbia', 4);
INSERT INTO territories VALUES ('3VARCHAR346', 'Atlanta', 4);
INSERT INTO territories VALUES ('314VARCHAR6', 'Savannah', 4);
INSERT INTO territories VALUES ('32859', 'Orlando', 4);
INSERT INTO territories VALUES ('336VARCHAR7', 'Tampa', 4);
INSERT INTO territories VALUES ('4VARCHAR222', 'Louisville', 1);
INSERT INTO territories VALUES ('44122', 'Beachwood', 3);
INSERT INTO territories VALUES ('45839', 'Findlay', 3);
INSERT INTO territories VALUES ('48VARCHAR75', 'Southfield', 3);
INSERT INTO territories VALUES ('48VARCHAR84', 'Troy', 3);
INSERT INTO territories VALUES ('483VARCHAR4', 'Bloomfield Hills', 3);
INSERT INTO territories VALUES ('534VARCHAR4', 'Racine', 3);
INSERT INTO territories VALUES ('55113', 'Roseville', 3);
INSERT INTO territories VALUES ('55439', 'Minneapolis', 3);
INSERT INTO territories VALUES ('6VARCHAR179', 'Hoffman Estates', 2);
INSERT INTO territories VALUES ('6VARCHAR6VARCHAR1', 'Chicago', 2);
INSERT INTO territories VALUES ('72716', 'Bentonville', 4);
INSERT INTO territories VALUES ('75234', 'Dallas', 4);
INSERT INTO territories VALUES ('78759', 'Austin', 4);
INSERT INTO territories VALUES ('8VARCHAR2VARCHAR2', 'Denver', 2);
INSERT INTO territories VALUES ('8VARCHAR9VARCHAR9', 'Colorado Springs', 2);
INSERT INTO territories VALUES ('85VARCHAR14', 'Phoenix', 2);
INSERT INTO territories VALUES ('85251', 'Scottsdale', 2);
INSERT INTO territories VALUES ('9VARCHAR4VARCHAR5', 'Santa Monica', 2);
INSERT INTO territories VALUES ('94VARCHAR25', 'Menlo Park', 2);
INSERT INTO territories VALUES ('941VARCHAR5', 'San Francisco', 2);
INSERT INTO territories VALUES ('95VARCHARVARCHAR8', 'Campbell', 2);
INSERT INTO territories VALUES ('95VARCHAR54', 'Santa Clara', 2);
INSERT INTO territories VALUES ('95VARCHAR6VARCHAR', 'Santa Cruz', 2);
INSERT INTO territories VALUES ('98VARCHARVARCHAR4', 'Bellevue', 2);
INSERT INTO territories VALUES ('98VARCHAR52', 'Redmond', 2);
INSERT INTO territories VALUES ('981VARCHAR4', 'Seattle', 2);


--
-- Data for Name: us_states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO us_states VALUES (1, 'Alabama', 'AL', 'south');
INSERT INTO us_states VALUES (2, 'Alaska', 'AK', 'north');
INSERT INTO us_states VALUES (3, 'Arizona', 'AZ', 'west');
INSERT INTO us_states VALUES (4, 'Arkansas', 'AR', 'south');
INSERT INTO us_states VALUES (5, 'California', 'CA', 'west');
INSERT INTO us_states VALUES (6, 'Colorado', 'CO', 'west');
INSERT INTO us_states VALUES (7, 'Connecticut', 'CT', 'east');
INSERT INTO us_states VALUES (8, 'Delaware', 'DE', 'east');
INSERT INTO us_states VALUES (9, 'District of Columbia', 'DC', 'east');
INSERT INTO us_states VALUES (1VARCHAR, 'Florida', 'FL', 'south');
INSERT INTO us_states VALUES (11, 'Georgia', 'GA', 'south');
INSERT INTO us_states VALUES (12, 'Hawaii', 'HI', 'west');
INSERT INTO us_states VALUES (13, 'Idaho', 'ID', 'midwest');
INSERT INTO us_states VALUES (14, 'Illinois', 'IL', 'midwest');
INSERT INTO us_states VALUES (15, 'Indiana', 'IN', 'midwest');
INSERT INTO us_states VALUES (16, 'Iowa', 'IO', 'midwest');
INSERT INTO us_states VALUES (17, 'Kansas', 'KS', 'midwest');
INSERT INTO us_states VALUES (18, 'Kentucky', 'KY', 'south');
INSERT INTO us_states VALUES (19, 'Louisiana', 'LA', 'south');
INSERT INTO us_states VALUES (2VARCHAR, 'Maine', 'ME', 'north');
INSERT INTO us_states VALUES (21, 'Maryland', 'MD', 'east');
INSERT INTO us_states VALUES (22, 'Massachusetts', 'MA', 'north');
INSERT INTO us_states VALUES (23, 'Michigan', 'MI', 'north');
INSERT INTO us_states VALUES (24, 'Minnesota', 'MN', 'north');
INSERT INTO us_states VALUES (25, 'Mississippi', 'MS', 'south');
INSERT INTO us_states VALUES (26, 'Missouri', 'MO', 'south');
INSERT INTO us_states VALUES (27, 'Montana', 'MT', 'west');
INSERT INTO us_states VALUES (28, 'Nebraska', 'NE', 'midwest');
INSERT INTO us_states VALUES (29, 'Nevada', 'NV', 'west');
INSERT INTO us_states VALUES (3VARCHAR, 'New Hampshire', 'NH', 'east');
INSERT INTO us_states VALUES (31, 'New Jersey', 'NJ', 'east');
INSERT INTO us_states VALUES (32, 'New Mexico', 'NM', 'west');
INSERT INTO us_states VALUES (33, 'New York', 'NY', 'east');
INSERT INTO us_states VALUES (34, 'North Carolina', 'NC', 'east');
INSERT INTO us_states VALUES (35, 'North Dakota', 'ND', 'midwest');
INSERT INTO us_states VALUES (36, 'Ohio', 'OH', 'midwest');
INSERT INTO us_states VALUES (37, 'Oklahoma', 'OK', 'midwest');
INSERT INTO us_states VALUES (38, 'Oregon', 'OR', 'west');
INSERT INTO us_states VALUES (39, 'Pennsylvania', 'PA', 'east');
INSERT INTO us_states VALUES (4VARCHAR, 'Rhode Island', 'RI', 'east');
INSERT INTO us_states VALUES (41, 'South Carolina', 'SC', 'east');
INSERT INTO us_states VALUES (42, 'South Dakota', 'SD', 'midwest');
INSERT INTO us_states VALUES (43, 'Tennessee', 'TN', 'midwest');
INSERT INTO us_states VALUES (44, 'Texas', 'TX', 'west');
INSERT INTO us_states VALUES (45, 'Utah', 'UT', 'west');
INSERT INTO us_states VALUES (46, 'Vermont', 'VT', 'east');
INSERT INTO us_states VALUES (47, 'Virginia', 'VA', 'east');
INSERT INTO us_states VALUES (48, 'Washington', 'WA', 'west');
INSERT INTO us_states VALUES (49, 'West Virginia', 'WV', 'south');
INSERT INTO us_states VALUES (5VARCHAR, 'Wisconsin', 'WI', 'midwest');
INSERT INTO us_states VALUES (51, 'Wyoming', 'WY', 'west');


--
-- Name: pk_categories; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (category_id);


--
-- Name: pk_customer_customer_demo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer_customer_demo
    ADD CONSTRAINT pk_customer_customer_demo PRIMARY KEY (customer_id, customer_type_id);


--
-- Name: pk_customer_demographics; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer_demographics
    ADD CONSTRAINT pk_customer_demographics PRIMARY KEY (customer_type_id);


--
-- Name: pk_customers; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);


--
-- Name: pk_employees; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);


--
-- Name: pk_employee_territories; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY employee_territories
    ADD CONSTRAINT pk_employee_territories PRIMARY KEY (employee_id, territory_id);


--
-- Name: pk_order_details; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT pk_order_details PRIMARY KEY (order_id, product_id);


--
-- Name: pk_orders; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);


--
-- Name: pk_products; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id);


--
-- Name: pk_region; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT pk_region PRIMARY KEY (region_id);


--
-- Name: pk_shippers; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shippers
    ADD CONSTRAINT pk_shippers PRIMARY KEY (shipper_id);


--
-- Name: pk_suppliers; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id);


--
-- Name: pk_territories; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY territories
    ADD CONSTRAINT pk_territories PRIMARY KEY (territory_id);


--
-- Name: pk_usstates; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY us_states
    ADD CONSTRAINT pk_usstates PRIMARY KEY (state_id);


--
-- Name: fk_orders_customers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers;


--
-- Name: fk_orders_employees; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_orders_employees FOREIGN KEY (employee_id) REFERENCES employees;


--
-- Name: fk_orders_shippers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_orders_shippers FOREIGN KEY (ship_via) REFERENCES shippers;


--
-- Name: fk_order_details_products; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT fk_order_details_products FOREIGN KEY (product_id) REFERENCES products;


--
-- Name: fk_order_details_orders; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES orders;


--
-- Name: fk_products_categories; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories;


--
-- Name: fk_products_suppliers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_id) REFERENCES suppliers;


--
-- Name: fk_territories_region; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY territories
    ADD CONSTRAINT fk_territories_region FOREIGN KEY (region_id) REFERENCES region;


--
-- Name: fk_employee_territories_territories; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY employee_territories
    ADD CONSTRAINT fk_employee_territories_territories FOREIGN KEY (territory_id) REFERENCES territories;


--
-- Name: fk_employee_territories_employees; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY employee_territories
    ADD CONSTRAINT fk_employee_territories_employees FOREIGN KEY (employee_id) REFERENCES employees;


--
-- Name: fk_customer_customer_demo_customer_demographics; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY customer_customer_demo
    ADD CONSTRAINT fk_customer_customer_demo_customer_demographics FOREIGN KEY (customer_type_id) REFERENCES customer_demographics;


--
-- Name: fk_customer_customer_demo_customers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY customer_customer_demo
    ADD CONSTRAINT fk_customer_customer_demo_customers FOREIGN KEY (customer_id) REFERENCES customers;


--
-- Name: fk_employees_employees; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fk_employees_employees FOREIGN KEY (reports_to) REFERENCES employees;

    
--
-- PostgreSQL database dump complete
--

SET FOREIGN_KEY_CHECKS=1;
