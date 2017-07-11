-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.1
-- PostgreSQL version: 9.4
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: proyecto_bd | type: DATABASE --
-- -- DROP DATABASE IF EXISTS proyecto_bd;
-- CREATE DATABASE proyecto_bd
-- ;
-- -- ddl-end --
-- 

-- object: proyectos | type: SCHEMA --
-- DROP SCHEMA IF EXISTS proyectos CASCADE;

-- Prepended SQL commands --


-- ddl-end --

CREATE SCHEMA proyectos;
-- ddl-end --
ALTER SCHEMA proyectos OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,proyectos;
-- ddl-end --

-- object: proyectos.pro_distr | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_distr CASCADE;
CREATE TABLE proyectos.pro_distr(
	id_pro_distr serial NOT NULL,
	dis_nombr text NOT NULL,
	dis_codig text NOT NULL,
	dis_femod timestamp,
	dis_feing timestamp NOT NULL,
	id_pro_estat_pro_estat integer,
	CONSTRAINT pk_id_pro_distr PRIMARY KEY (id_pro_distr),
	CONSTRAINT uk_dis_codig UNIQUE (dis_codig)

);
-- ddl-end --
ALTER TABLE proyectos.pro_distr OWNER TO postgres;
-- ddl-end --

-- object: proyectos.pro_estat | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_estat CASCADE;
CREATE TABLE proyectos.pro_estat(
	id_pro_estat serial NOT NULL,
	est_nombr text NOT NULL,
	est_descr text NOT NULL,
	CONSTRAINT pk_id_pro_estat PRIMARY KEY (id_pro_estat)

);
-- ddl-end --
ALTER TABLE proyectos.pro_estat OWNER TO postgres;
-- ddl-end --

-- object: pro_estat_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_distr DROP CONSTRAINT IF EXISTS pro_estat_fk CASCADE;
ALTER TABLE proyectos.pro_distr ADD CONSTRAINT pro_estat_fk FOREIGN KEY (id_pro_estat_pro_estat)
REFERENCES proyectos.pro_estat (id_pro_estat) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: proyectos.pro_asist | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_asist CASCADE;
CREATE TABLE proyectos.pro_asist(
	id_pro_asist serial NOT NULL,
	asi_nombr text NOT NULL,
	asi_codig text NOT NULL,
	asi_femod timestamp,
	asi_ing timestamp NOT NULL,
	id_pro_estat_pro_estat integer,
	CONSTRAINT pk_id_pro_asist PRIMARY KEY (id_pro_asist),
	CONSTRAINT uk_asi_codig UNIQUE (asi_codig)

);
-- ddl-end --
COMMENT ON TABLE proyectos.pro_asist IS 'Parte 3: Tipo de ambulatorio u hospital';
-- ddl-end --
ALTER TABLE proyectos.pro_asist OWNER TO postgres;
-- ddl-end --

-- object: pro_estat_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_asist DROP CONSTRAINT IF EXISTS pro_estat_fk CASCADE;
ALTER TABLE proyectos.pro_asist ADD CONSTRAINT pro_estat_fk FOREIGN KEY (id_pro_estat_pro_estat)
REFERENCES proyectos.pro_estat (id_pro_estat) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: proyectos.pro_insti | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_insti CASCADE;
CREATE TABLE proyectos.pro_insti(
	id_pro_insti serial NOT NULL,
	ins_nombr text NOT NULL,
	ins_codig text NOT NULL,
	ins_femod timestamp,
	ins_feing timestamp NOT NULL,
	id_pro_estat_pro_estat integer,
	CONSTRAINT pk_id_pro_insti PRIMARY KEY (id_pro_insti),
	CONSTRAINT uk_ins_codig UNIQUE (ins_codig)

);
-- ddl-end --
COMMENT ON TABLE proyectos.pro_insti IS 'Parte 1: institucion';
-- ddl-end --
ALTER TABLE proyectos.pro_insti OWNER TO postgres;
-- ddl-end --

-- object: pro_estat_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_insti DROP CONSTRAINT IF EXISTS pro_estat_fk CASCADE;
ALTER TABLE proyectos.pro_insti ADD CONSTRAINT pro_estat_fk FOREIGN KEY (id_pro_estat_pro_estat)
REFERENCES proyectos.pro_estat (id_pro_estat) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: proyectos.pro_sitio | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_sitio CASCADE;
CREATE TABLE proyectos.pro_sitio(
	id_pro_sitio serial NOT NULL,
	sit_nombr text NOT NULL,
	sit_femod timestamp,
	sit_feing timestamp NOT NULL,
	id_pro_estat_pro_estat integer,
	CONSTRAINT pk_id_pro_sitio PRIMARY KEY (id_pro_sitio)

);
-- ddl-end --
COMMENT ON TABLE proyectos.pro_sitio IS 'Parte 4: sitio especifico';
-- ddl-end --
ALTER TABLE proyectos.pro_sitio OWNER TO postgres;
-- ddl-end --

-- object: pro_estat_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_sitio DROP CONSTRAINT IF EXISTS pro_estat_fk CASCADE;
ALTER TABLE proyectos.pro_sitio ADD CONSTRAINT pro_estat_fk FOREIGN KEY (id_pro_estat_pro_estat)
REFERENCES proyectos.pro_estat (id_pro_estat) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: proyectos.pro_sujet | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_sujet CASCADE;
CREATE TABLE proyectos.pro_sujet(
	id_pro_sujet serial NOT NULL,
	suj_nombr text NOT NULL,
	suj_femod timestamp,
	suj_feing timestamp NOT NULL,
	id_pro_estat_pro_estat integer,
	CONSTRAINT pk_id_pro_sujet PRIMARY KEY (id_pro_sujet)

);
-- ddl-end --
COMMENT ON TABLE proyectos.pro_sujet IS 'Parte 5: Sujeto del documento';
-- ddl-end --
ALTER TABLE proyectos.pro_sujet OWNER TO postgres;
-- ddl-end --

-- object: pro_estat_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_sujet DROP CONSTRAINT IF EXISTS pro_estat_fk CASCADE;
ALTER TABLE proyectos.pro_sujet ADD CONSTRAINT pro_estat_fk FOREIGN KEY (id_pro_estat_pro_estat)
REFERENCES proyectos.pro_estat (id_pro_estat) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: proyectos.pro_proye | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_proye CASCADE;
CREATE TABLE proyectos.pro_proye(
	id_pro_proye serial NOT NULL,
	id_pro_insti_pro_insti integer,
	id_pro_distr_pro_distr integer,
	id_pro_asist_pro_asist integer,
	id_pro_sitio_pro_sitio integer,
	id_pro_sujet_pro_sujet integer,
	pro_direc text,
	usu_femod timestamp,
	usu_feing timestamp NOT NULL,
	id_pro_usuar_pro_usuar integer,
	CONSTRAINT pk_id_pro_proye PRIMARY KEY (id_pro_proye)

);
-- ddl-end --
ALTER TABLE proyectos.pro_proye OWNER TO postgres;
-- ddl-end --

-- object: pro_insti_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_proye DROP CONSTRAINT IF EXISTS pro_insti_fk CASCADE;
ALTER TABLE proyectos.pro_proye ADD CONSTRAINT pro_insti_fk FOREIGN KEY (id_pro_insti_pro_insti)
REFERENCES proyectos.pro_insti (id_pro_insti) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_distr_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_proye DROP CONSTRAINT IF EXISTS pro_distr_fk CASCADE;
ALTER TABLE proyectos.pro_proye ADD CONSTRAINT pro_distr_fk FOREIGN KEY (id_pro_distr_pro_distr)
REFERENCES proyectos.pro_distr (id_pro_distr) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_asist_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_proye DROP CONSTRAINT IF EXISTS pro_asist_fk CASCADE;
ALTER TABLE proyectos.pro_proye ADD CONSTRAINT pro_asist_fk FOREIGN KEY (id_pro_asist_pro_asist)
REFERENCES proyectos.pro_asist (id_pro_asist) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_sitio_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_proye DROP CONSTRAINT IF EXISTS pro_sitio_fk CASCADE;
ALTER TABLE proyectos.pro_proye ADD CONSTRAINT pro_sitio_fk FOREIGN KEY (id_pro_sitio_pro_sitio)
REFERENCES proyectos.pro_sitio (id_pro_sitio) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_sujet_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_proye DROP CONSTRAINT IF EXISTS pro_sujet_fk CASCADE;
ALTER TABLE proyectos.pro_proye ADD CONSTRAINT pro_sujet_fk FOREIGN KEY (id_pro_sujet_pro_sujet)
REFERENCES proyectos.pro_sujet (id_pro_sujet) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: proyectos.pro_jerar | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_jerar CASCADE;
CREATE TABLE proyectos.pro_jerar(
	id_pro_jefep serial NOT NULL,
	jer_nombr varchar(255) NOT NULL,
	jer_jerar smallint NOT NULL,
	jer_femod timestamp,
	jer_feing timestamp NOT NULL,
	id_pro_estat_pro_estat integer,
	CONSTRAINT pk_id_pro_jefep PRIMARY KEY (id_pro_jefep)

);
-- ddl-end --
COMMENT ON TABLE proyectos.pro_jerar IS 'jerarquias en el area de proyectos';
-- ddl-end --
ALTER TABLE proyectos.pro_jerar OWNER TO postgres;
-- ddl-end --

-- object: proyectos.pro_usuar | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_usuar CASCADE;
CREATE TABLE proyectos.pro_usuar(
	id_pro_usuar serial NOT NULL,
	usu_liter char,
	usu_cedul smallint,
	usu_nomb1 varchar(255),
	usu_nomb2 varchar(255),
	usu_apel1 varchar(255),
	usu_apel2 varchar(255),
	usu_fenac date,
	usu_tehab integer,
	usu_tecel integer,
	usu_direc varchar(255),
	usu_email varchar(255),
	usu_login varchar(255),
	usu_clave varchar(255),
	usu_sexo smallint,
	usu_femod timestamp,
	usu_feing timestamp NOT NULL,
	id_pro_ramos_pro_ramos integer,
	id_pro_estat_pro_estat integer,
	CONSTRAINT pk_id_pro_usuar PRIMARY KEY (id_pro_usuar)

);
-- ddl-end --
ALTER TABLE proyectos.pro_usuar OWNER TO postgres;
-- ddl-end --

-- object: proyectos.pro_ramos | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_ramos CASCADE;
CREATE TABLE proyectos.pro_ramos(
	id_pro_ramos serial NOT NULL,
	ram_nombr text NOT NULL,
	ram_femod timestamp,
	ram_feing timestamp NOT NULL,
	id_pro_estat_pro_estat integer,
	CONSTRAINT pk_pro_ramos PRIMARY KEY (id_pro_ramos)

);
-- ddl-end --
COMMENT ON TABLE proyectos.pro_ramos IS 'Ramos profesionales';
-- ddl-end --
ALTER TABLE proyectos.pro_ramos OWNER TO postgres;
-- ddl-end --

-- object: pro_ramos_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_usuar DROP CONSTRAINT IF EXISTS pro_ramos_fk CASCADE;
ALTER TABLE proyectos.pro_usuar ADD CONSTRAINT pro_ramos_fk FOREIGN KEY (id_pro_ramos_pro_ramos)
REFERENCES proyectos.pro_ramos (id_pro_ramos) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: proyectos.pro_usuar_pro_jerar | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_usuar_pro_jerar CASCADE;
CREATE TABLE proyectos.pro_usuar_pro_jerar(
	id_pro_usuar_pro_jerar serial NOT NULL,
	id_pro_jefep_pro_jerar integer,
	id_pro_usuar_pro_usuar integer,
	pro_usuar_pro_jerar_femod timestamp,
	pro_usuar_pro_jerar_feing timestamp NOT NULL,
	id_pro_estat_pro_estat integer,
	CONSTRAINT pk_id_pro_usuar_pro_jerar PRIMARY KEY (id_pro_usuar_pro_jerar)

);
-- ddl-end --
ALTER TABLE proyectos.pro_usuar_pro_jerar OWNER TO postgres;
-- ddl-end --

-- object: pro_jerar_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_usuar_pro_jerar DROP CONSTRAINT IF EXISTS pro_jerar_fk CASCADE;
ALTER TABLE proyectos.pro_usuar_pro_jerar ADD CONSTRAINT pro_jerar_fk FOREIGN KEY (id_pro_jefep_pro_jerar)
REFERENCES proyectos.pro_jerar (id_pro_jefep) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_usuar_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_usuar_pro_jerar DROP CONSTRAINT IF EXISTS pro_usuar_fk CASCADE;
ALTER TABLE proyectos.pro_usuar_pro_jerar ADD CONSTRAINT pro_usuar_fk FOREIGN KEY (id_pro_usuar_pro_usuar)
REFERENCES proyectos.pro_usuar (id_pro_usuar) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_estat_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_jerar DROP CONSTRAINT IF EXISTS pro_estat_fk CASCADE;
ALTER TABLE proyectos.pro_jerar ADD CONSTRAINT pro_estat_fk FOREIGN KEY (id_pro_estat_pro_estat)
REFERENCES proyectos.pro_estat (id_pro_estat) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_estat_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_usuar_pro_jerar DROP CONSTRAINT IF EXISTS pro_estat_fk CASCADE;
ALTER TABLE proyectos.pro_usuar_pro_jerar ADD CONSTRAINT pro_estat_fk FOREIGN KEY (id_pro_estat_pro_estat)
REFERENCES proyectos.pro_estat (id_pro_estat) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_estat_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_usuar DROP CONSTRAINT IF EXISTS pro_estat_fk CASCADE;
ALTER TABLE proyectos.pro_usuar ADD CONSTRAINT pro_estat_fk FOREIGN KEY (id_pro_estat_pro_estat)
REFERENCES proyectos.pro_estat (id_pro_estat) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_usuar_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_proye DROP CONSTRAINT IF EXISTS pro_usuar_fk CASCADE;
ALTER TABLE proyectos.pro_proye ADD CONSTRAINT pro_usuar_fk FOREIGN KEY (id_pro_usuar_pro_usuar)
REFERENCES proyectos.pro_usuar (id_pro_usuar) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: proyectos.pro_espro | type: TABLE --
-- DROP TABLE IF EXISTS proyectos.pro_espro CASCADE;
CREATE TABLE proyectos.pro_espro(
	id_pro_espro serial NOT NULL,
	esp_revis text,
	esp_rev2 text,
	esp_minut text,
	esp_urlar text,
	esp_femod timestamp,
	esp_feing timestamp NOT NULL,
	id_pro_proye_pro_proye integer,
	CONSTRAINT pk_pro_espro PRIMARY KEY (id_pro_espro)

);
-- ddl-end --
ALTER TABLE proyectos.pro_espro OWNER TO postgres;
-- ddl-end --

-- object: pro_proye_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_espro DROP CONSTRAINT IF EXISTS pro_proye_fk CASCADE;
ALTER TABLE proyectos.pro_espro ADD CONSTRAINT pro_proye_fk FOREIGN KEY (id_pro_proye_pro_proye)
REFERENCES proyectos.pro_proye (id_pro_proye) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pro_estat_fk | type: CONSTRAINT --
-- ALTER TABLE proyectos.pro_ramos DROP CONSTRAINT IF EXISTS pro_estat_fk CASCADE;
ALTER TABLE proyectos.pro_ramos ADD CONSTRAINT pro_estat_fk FOREIGN KEY (id_pro_estat_pro_estat)
REFERENCES proyectos.pro_estat (id_pro_estat) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- Appended SQL commands --
/* 
	NOTA: Las sentencias INSERT son para llenar
	las tablas maestras y agilizar la vaina, y deben
	ir ubicadas al final del archivo *.sql
*/

-- INSERT proyectos.pro_estat
INSERT INTO proyectos.pro_estat(est_nombr, est_descr) VALUES('p','Activado');
INSERT INTO proyectos.pro_estat(est_nombr, est_descr) VALUES('p','Inactivo');
INSERT INTO proyectos.pro_estat(est_nombr, est_descr) VALUES('p','Eliminado');
INSERT INTO proyectos.pro_estat(est_nombr, est_descr) VALUES('p','Modificado');
INSERT INTO proyectos.pro_estat(est_nombr, est_descr) VALUES('a','Ejemplo 1');
INSERT INTO proyectos.pro_estat(est_nombr, est_descr) VALUES('a','Ejemplo 2');

-- INSERT proyectos.pro_asist
INSERT INTO proyectos.pro_insti(ins_nombr, ins_codig, ins_femod, ins_feing, id_pro_estat_pro_estat)
VALUES('CORPORACION DE SALUD TACHIRA (CORPO)', 'CORPO', NOW(), NOW(), 1);

-- con primer ingreso no se agrega FEMOD 

-- INSERT proyectos.pro_distr
INSERT INTO proyectos.pro_distr(dis_nombr, dis_codig, dis_femod, dis_feing, id_pro_estat_pro_estat) 
	VALUES('Distrito Sanitario No. 1 - (DS1)', 'DS1', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_distr(dis_nombr, dis_codig, dis_femod, dis_feing, id_pro_estat_pro_estat) 
	VALUES('Distrito Sanitario No. 2 - (DS2)', 'DS2', NOW(), NOW(), 1);	
INSERT INTO proyectos.pro_distr(dis_nombr, dis_codig, dis_femod, dis_feing, id_pro_estat_pro_estat) 
	VALUES('Distrito Sanitario No. 3 - (DS3)', 'DS3', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_distr(dis_nombr, dis_codig, dis_femod, dis_feing, id_pro_estat_pro_estat) 
	VALUES('Distrito Sanitario No. 4 - (DS4)', 'DS4', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_distr(dis_nombr, dis_codig, dis_femod, dis_feing, id_pro_estat_pro_estat)
 VALUES('Distrito Sanitario No. 5 - (DS5)', 'DS5', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_distr(dis_nombr, dis_codig, dis_femod, dis_feing, id_pro_estat_pro_estat) 
	VALUES('Distrito Sanitario No. 6 - (DS6)', 'DS6', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_distr(dis_nombr, dis_codig, dis_femod, dis_feing, id_pro_estat_pro_estat) 
	VALUES('Distrito Sanitario No. 7 - (DS7)', 'DS7', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_distr(dis_nombr, dis_codig, dis_femod, dis_feing, id_pro_estat_pro_estat) 
	VALUES('Distrito Sanitario No. 8 - (DS8)', 'DS8', NOW(), NOW(), 1);

	

-- INSERT proyectos.pro_asist
INSERT INTO proyectos.pro_asist(asi_nombr, asi_codig, asi_femod, asi_ing, id_pro_estat_pro_estat) 
	VALUES('Ambulatorio Rural Tipo I - (ARI)', 'ARI', NOW(), NOW(), 1);	
INSERT INTO proyectos.pro_asist(asi_nombr, asi_codig, asi_femod, asi_ing, id_pro_estat_pro_estat) 
	VALUES('Ambulatorio Rural Tipo II - (ARII)', 'ARII', NOW(), NOW(), 1);	
INSERT INTO proyectos.pro_asist(asi_nombr, asi_codig, asi_femod, asi_ing, id_pro_estat_pro_estat) 
	VALUES('Ambulatorio Urbano Tipo I - (AUI)', 'AUI', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_asist(asi_nombr, asi_codig, asi_femod, asi_ing, id_pro_estat_pro_estat) 
	VALUES('Ambulatorio Urbano Tipo II - (AUII)', 'AUII', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_asist(asi_nombr, asi_codig, asi_femod, asi_ing, id_pro_estat_pro_estat) 
	VALUES('Ambulatorio Urbano Tipo III - (AUIII)', 'AUIII', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_asist(asi_nombr, asi_codig, asi_femod, asi_ing, id_pro_estat_pro_estat) 
	VALUES('Hospital Tipo I - (HI)', 'HI', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_asist(asi_nombr, asi_codig, asi_femod, asi_ing, id_pro_estat_pro_estat) 
	VALUES('Hospital Tipo II - (HII)', 'HII', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_asist(asi_nombr, asi_codig, asi_femod, asi_ing, id_pro_estat_pro_estat) 
	VALUES('Hospital Tipo III - (HIII)', 'HIII', NOW(), NOW(), 1);
INSERT INTO proyectos.pro_asist(asi_nombr, asi_codig, asi_femod, asi_ing, id_pro_estat_pro_estat) 
	VALUES('Hospital Tipo IV - (HIV)', 'HIV', NOW(), NOW(), 1);


-- INSERT proyectos.pro_sitio
INSERT INTO proyectos.pro_sitio(sit_nombr, sit_feing, id_pro_estat_pro_estat) VALUES('QUIROFANO', NOW(), 1);
INSERT INTO proyectos.pro_sitio(sit_nombr, sit_feing, id_pro_estat_pro_estat) VALUES('LABORATORIO', NOW(), 1);
INSERT INTO proyectos.pro_sitio(sit_nombr, sit_feing, id_pro_estat_pro_estat) VALUES('EMERGENCIA', NOW(), 1);

-- INSERT proyectos.pro_sujet
INSERT INTO proyectos.pro_sujet(suj_nombr, suj_feing, id_pro_estat_pro_estat) VALUES('LAYOUT', NOW(), 1);
INSERT INTO proyectos.pro_sujet(suj_nombr, suj_feing, id_pro_estat_pro_estat) VALUES('PLANO', NOW(), 1);
INSERT INTO proyectos.pro_sujet(suj_nombr, suj_feing, id_pro_estat_pro_estat) VALUES('VISTA', NOW(), 1);
INSERT INTO proyectos.pro_sujet(suj_nombr, suj_feing, id_pro_estat_pro_estat) VALUES('CORTES', NOW(), 1);	

-- INSERT proyectos.pro_ramos
INSERT INTO proyectos.pro_ramos(ram_nombr, ram_feing, id_pro_estat_pro_estat) VALUES('Arquitecto', NOW(), 1);	
INSERT INTO proyectos.pro_ramos(ram_nombr, ram_feing, id_pro_estat_pro_estat) VALUES('Ing. Civil', NOW(), 1);	
INSERT INTO proyectos.pro_ramos(ram_nombr, ram_feing, id_pro_estat_pro_estat) VALUES('Ing. Mecanico', NOW(), 1);	
INSERT INTO proyectos.pro_ramos(ram_nombr, ram_feing, id_pro_estat_pro_estat) VALUES('Ing. Electricista', NOW(), 1);	
	
	
	


---
