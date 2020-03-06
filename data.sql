insert into joueur (username,password) values ('test1','1'),('test2','2'),('test3','3');
INSERT INTO `sprobleme`(`nom`) VALUES ('Violence'),('Vol ou vandalisme'),('Nudité ou contenu à caractère sexuel');
INSERT INTO `probleme`( `nom`) VALUES ('Erreurs sur la carte'),('Déplacements anormaux'),('Erreur d\'affichage de la mini-carte');

DELIMITER |
CREATE TRIGGER before_insert_message After INSERT
ON message FOR EACH ROW
BEGIN
   UPDATE `discussion` SET  `id_message`=NEW.id_message WHERE id_discussion=NEW.id_discussion;
END |
