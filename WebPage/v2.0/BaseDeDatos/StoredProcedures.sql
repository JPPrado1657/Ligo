DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `existe`(
    IN uCorreo VARCHAR(254)
)
BEGIN
  SELECT Correo FROM Usuario
  WHERE Correo = uCorreo;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarCuenta`(IN `uNombre_Usuario` VARCHAR(25), IN `uContraseña` VARCHAR(25), IN `uCorreo` VARCHAR(254), IN `uNombre` VARCHAR(40), IN `uApellido_P` VARCHAR(40), IN `uApellido_M` VARCHAR(40), IN `uAño_Ing` VARCHAR(4), IN `uSemestre` INT(1))
BEGIN
  INSERT INTO Usuario
(
    Nombre_Usuario,
    Contrasena,
    Correo,
    Nombre,
    Apellido_P,
    Apellido_M,
    Año_Ing,
    Semestre
) VALUES
(
    uNombre_Usuario,
    uContrasena,
    uCorreo,
    uNombre,
    uApellido_P,
    uApellido_M,
    uAño_Ing,
    uSemestre
);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `country_hos`(IN uNombre_Usuario VARCHAR(25))
BEGIN
  SELECT Nombre, Apellido_P, Apellido_M, Contrasena  FROM Usuario
  WHERE Nombre_Usuario = uNombre_Usuario;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `corraborarDatos`(IN `uNombre_Usuario` VARCHAR(25))
BEGIN
  SELECT Nombre_Usuario, Contrasena FROM Usuario
  WHERE Nombre_Usuario = uNombre_Usuario;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `informacionUsuario`(IN uNombre_Usuario VARCHAR(25))
BEGIN
  SELECT Nombre, Apellido_P, Apellido_M,Contrasena FROM Usuario
  WHERE Nombre_Usuario = uNombre_Usuario;
END$$
DELIMITER ;
