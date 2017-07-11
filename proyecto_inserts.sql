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
	
	
	

