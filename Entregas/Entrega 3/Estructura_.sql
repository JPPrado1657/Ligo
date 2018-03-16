/* Creacion de tablas*/
CREATE TABLE Horario(
Id_Horario INT IDENTITY(1,1) NOT NULL,
InicioHorario TIME(3) NOT NULL,
FinHorario TIME(3)
)
CREATE TABLE Permiso(
 Id_Permiso INT IDENTITY (1,1) NOT NULL ,
 Descripcion VARCHAR (MAX)
)
CREATE TABLE Rol(
Id_Rol  INT IDENTITY (1,1) NOT NULL ,
NombreRol VARCHAR (50) NOT NULL
)
CREATE TABLE RolPermiso(
Id_Rol  INT  NOT NULL ,
Id_Permiso INT NOT NULL,
Fecha DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
)
CREATE TABLE Carrera(
Id_Carrera  INT IDENTITY (1,1) NOT NULL ,
Nombre VARCHAR (50),
Acronimo VARCHAR (10) NOT NULL
)
CREATE TABLE Compra(
Id_Usuario INT NOT NULL,
Id_Producto INT NOT NULL,
Id_Compra  INT IDENTITY (1,1) NOT NULL ,
Id_Horario INT NOT NULL,
IVA MONEY NOT NULL,
CostoEnvio MONEY,
Importe MONEY  NOT NULL,
Cantidad NUMERIC (5) NOT NULL,
Entregado BIT,
Fecha DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL /* Preguntar Ricardo*/
)
CREATE TABLE Estado(
Id_Estado  INT IDENTITY (1,1) NOT NULL ,
Nombre VARCHAR (50) NOT NULL,
Descripcion VARCHAR (MAX)
)
CREATE TABLE Registro(
Id_Registro  INT IDENTITY (1,1) NOT NULL ,
Accion VARCHAR (MAX) NOT NULL
)
CREATE TABLE AccionRegistrada(
Id_Usuario INT NOT NULL,
Id_Registro INT NOT NULL,
Fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP/* Preguntar Ricardo*/
)
CREATE TABLE RolUsuario(
Id_Usuario INT NOT NULL,
Id_Rol INT NOT NULL,
Fecha DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
)
CREATE TABLE EstadoUsuario(
Id_Usuario INT NOT NULL,
Id_Estado INT NOT NULL,
Fecha DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
)
CREATE TABLE CarreraUsuario(
Id_Usuario INT NOT NULL,
Id_Carrera INT NOT NULL,
Fecha DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
)
CREATE TABLE Usuario(
Id_Usuario  INT IDENTITY (1,1) NOT NULL ,
Nombre VARCHAR (60) NOT NULL,
Apellido_P VARCHAR (60) NOT NULL,
Apellido_M VARCHAR (60),
Nombre_Usuario VARCHAR (60) NOT NULL,
Contrasena VARCHAR(60) NOT NULL ,
Correo VARCHAR (60) NOT NULL,
Anio_Ing DATE  NOT NULL,
Semestre BIT NOT NULL,
Id_Calificaciones INT DEFAULT 1  NOT NULL
)
CREATE TABLE Ubicacion(
 Id_Ubicacion  INT IDENTITY (1,1) NOT NULL ,
 Nombre VARCHAR(60),
 Coordenadas VARCHAR(100),
 Descripcion VARCHAR(MAX),
 Creacion DATETIME  DEFAULT CURRENT_TIMESTAMP NOT NULL
)
CREATE TABLE Salon(
 Id_Ubicacion INT NOT NULL ,
 Id_Salon INT IDENTITY (1,1) NOT NULL,
 Numero NUMERIC (6) NOT NULL,
 Piso VARCHAR(60)
)
CREATE TABLE UbicacionUsuario(
 Id_Ubicacion INT NOT NULL,
 Id_Usuario INT NOT NULL,
 Fecha DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
)

/*Sam*/
CREATE TABLE Archivos_Multimedia (
 Id_Archivos_Multimedia INT IDENTITY (1, 1) NOT NULL,
 Extension              VARCHAR(30)          NOT NULL
)
CREATE TABLE Calificaciones (
 Id_Calificaciones INT IDENTITY (1, 1) NOT NULL,
 Calificacion      FLOAT(3) DEFAULT (0)
)

CREATE TABLE Subcategoria (
 Id_Subcategoria     INT IDENTITY (1, 1) NOT NULL,
 Nombre_Subcategoria VARCHAR(60)         NOT NULL,
 Id_Categoria        INT                 NOT NULL
)

CREATE TABLE Categoria (
 Id_Categoria          INT IDENTITY (1, 1) NOT NULL,
 Nombre_Categoria      VARCHAR(60)         NOT NULL,
 Descripcion_Categoria VARCHAR(MAX)         NOT NULL
)
CREATE TABLE Publicados (
 Id_Publicados    INT IDENTITY (1, 1)                NOT NULL,
 Fecha_Publicados DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
 Dias_Restantes   NUMERIC(2)                         NOT NULL,
)

CREATE TABLE Correos (
 Id_Correo         INT IDENTITY (1, 1) NOT NULL,
 Matricula_Correos VARCHAR(60),
 Id_UsuarioR INT NOT NULL,
 Id_UsuarioE       INT                 NOT NULL,
)

CREATE TABLE Anuncios (
 Id_Anuncio           INT IDENTITY (1, 1)                NOT NULL,
 Titulo_Anuncio       VARCHAR(60)                        NOT NULL,
 Texto_Anuncio        VARCHAR(MAX),
 Fecha_Inicio_Anuncio DATE,
 Fecha_Fin_Anuncio    DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
 Id_Producto          INT                                NOT NULL
)

CREATE TABLE Comentarios (
 Id_Comentarios   INT IDENTITY (1, 1) NOT NULL,
 Texto_Comentario VARCHAR(MAX)        NOT NULL
)


CREATE TABLE Producto (
 Id_Producto          INT IDENTITY (1, 1) NOT NULL,
 Nombre_Producto      VARCHAR(60)         NOT NULL,
 Descripcion_Producto VARCHAR(MAX),
 Precio_Producto      DECIMAL(9,2)          NOT NULL,
 Marca_Producto       VARCHAR(MAX),
 Id_Calificaciones    INT
)


CREATE TABLE Correos_Archivos_Multimedia (
 Id_Correo              INT                                NOT NULL,
 Id_Archivos_Multimedia INT                                NOT NULL,
 Fecha                  DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
)

CREATE TABLE Usuario_Correos (
 Id_Correo  INT NOT NULL,
 Id_Usuario INT NOT NULL
)

CREATE TABLE Producto_Archivos_Multimedia (
 Id_Archivos_Multimedia INT NOT NULL,
 Id_Producto            INT NOT NULL
)

CREATE TABLE Producto_Categoria (
 Id_Producto  INT NOT NULL,
 Id_Categoria INT NOT NULL
)

CREATE TABLE Usuario_Archivos_Multimedia (
 Id_Usuario             INT NOT NULL,
 Id_Archivos_Multimedia INT NOT NULL
)

CREATE TABLE Usuario_Publicados (
 Id_Usuario    INT NOT NULL,
 Id_Publicados INT NOT NULL
)

CREATE TABLE Usuario_Anuncios (
 Id_Usuario    INT NOT NULL,
 Id_Anuncio INT NOT NULL
)
CREATE TABLE Usuario_Comentarios (
 Id_Usuario     INT NOT NULL,
 Id_Comentarios INT NOT NULL
)


CREATE TABLE Usuario_Producto (
 Id_Usuario  INT NOT NULL,
 Id_Producto INT NOT NULL
)

CREATE TABLE Comentarios_Publicados (
 Id_Comentarios INT      NOT NULL,
 Id_Publicados  INT  NOT NULL
)

CREATE TABLE Anuncios_Publicados (
 Id_Publicados INT NOT NULL,
 Id_Anuncio    INT NOT NULL
)
CREATE TABLE Producto_Anuncios (
 Id_Anuncio  INT NOT NULL,
 Id_Producto INT NOT NULL
)
CREATE TABLE Producto_Publicados (
 Id_Producto   INT NOT NULL,
 Id_Publicados INT NOT NULL
)
CREATE TABLE Producto_Estado (
 Id_Producto INT NOT NULL,
 Id_Estado   INT NOT NULL
)
CREATE TABLE Producto_Ubicacion (
 Id_Producto  INT NOT NULL,
 Id_Ubicacion INT NOT NULL,
)


 /*Llaves */


ALTER TABLE Permiso ADD CONSTRAINT LlavePermiso PRIMARY KEY (Id_Permiso)
ALTER TABLE Rol ADD CONSTRAINT LlaveRol PRIMARY KEY (Id_Rol)
ALTER TABLE RolPermiso ADD CONSTRAINT LlaveRolPer PRIMARY KEY (Id_Rol,Id_Permiso,Fecha)
ALTER TABLE Carrera ADD CONSTRAINT LlaveCarrera PRIMARY KEY (Id_Carrera)
ALTER TABLE Calificaciones ADD CONSTRAINT LlaveCalificaciones PRIMARY KEY (Id_Calificaciones)
ALTER TABLE Usuario ADD CONSTRAINT LlaveUsuario PRIMARY KEY (Id_Usuario)
ALTER TABLE Compra ADD CONSTRAINT LlaveCompra PRIMARY KEY (Id_Compra,Id_Usuario)
ALTER TABLE Estado ADD CONSTRAINT LlaveEstado PRIMARY KEY (Id_Estado)
ALTER TABLE Registro ADD CONSTRAINT LlaveRegistro PRIMARY KEY (Id_Registro)
ALTER TABLE AccionRegistrada ADD CONSTRAINT LlaveAccionRegistrada PRIMARY KEY (Id_Usuario,Id_Registro,Fecha)
ALTER TABLE RolUsuario ADD CONSTRAINT LlaveRolUsuario PRIMARY KEY (Id_Usuario,Id_Rol,Fecha)
ALTER TABLE EstadoUsuario ADD CONSTRAINT LlaveEstadoUsuario PRIMARY KEY (Id_Usuario,Id_Estado,Fecha)
ALTER TABLE CarreraUsuario ADD CONSTRAINT LlaveCarreraUsuario PRIMARY KEY (Id_Usuario,Id_Carrera,Fecha)
ALTER TABLE Ubicacion ADD CONSTRAINT LlaveUbicacion PRIMARY KEY (Id_Ubicacion)
ALTER TABLE Salon ADD CONSTRAINT LlaveSalon PRIMARY KEY (Id_Ubicacion,Id_Salon)
ALTER TABLE UbicacionUsuario ADD CONSTRAINT LlaveUbicacionUsuario PRIMARY KEY (Id_Usuario,Id_Ubicacion,Fecha)
ALTER TABLE Horario ADD CONSTRAINT LlaveHorario PRIMARY KEY (Id_Horario)
/*Sam*/

ALTER TABLE Archivos_Multimedia ADD CONSTRAINT LlaveArchivos PRIMARY KEY (Id_Archivos_Multimedia)
ALTER TABLE Categoria ADD CONSTRAINT LlaveCategoria PRIMARY KEY (Id_Categoria)
ALTER TABLE Subcategoria ADD CONSTRAINT LlaveSubcategoria PRIMARY KEY (Id_Subcategoria)
ALTER TABLE Publicados ADD CONSTRAINT LlavePublicados PRIMARY KEY (Id_Publicados)
ALTER TABLE Correos ADD CONSTRAINT LlaveCorreos PRIMARY KEY (Id_Correo)
ALTER TABLE Producto ADD CONSTRAINT LlaveProducto PRIMARY KEY (Id_Producto)
ALTER TABLE Comentarios ADD CONSTRAINT LlaveComentarios PRIMARY KEY (Id_Comentarios)
ALTER TABLE Anuncios ADD CONSTRAINT LlaveAnuncios PRIMARY KEY (Id_Anuncio)
ALTER TABLE Correos_Archivos_Multimedia ADD CONSTRAINT LlaveCorreosArchivosMultimedia PRIMARY KEY (Id_Correo,Id_Archivos_Multimedia,Fecha)
ALTER TABLE Usuario_Correos ADD CONSTRAINT LlaveUsuarioCorreos PRIMARY KEY (Id_Correo,Id_Usuario)
ALTER TABLE Producto_Archivos_Multimedia ADD CONSTRAINT LlaveProductoArchivosMultimedia PRIMARY KEY (Id_Producto,Id_Archivos_Multimedia)
ALTER TABLE Producto_Categoria ADD CONSTRAINT LlaveProductoCategoria PRIMARY KEY (Id_Producto,Id_Categoria)
ALTER TABLE Usuario_Archivos_Multimedia ADD CONSTRAINT LlaveUsuarioArchivosMultimedia PRIMARY KEY (Id_Usuario,Id_Archivos_Multimedia)
ALTER TABLE Usuario_Publicados ADD CONSTRAINT LlaveUsuarioPublicados PRIMARY KEY (Id_Usuario,Id_Publicados)
ALTER TABLE Usuario_Anuncios ADD CONSTRAINT LlaveUsuarioAnuncios PRIMARY KEY (Id_Usuario,Id_Anuncio)
ALTER TABLE Usuario_Producto ADD CONSTRAINT LlaveUsuarioProducto PRIMARY KEY (Id_Usuario,Id_Producto)
ALTER TABLE Usuario_Comentarios ADD CONSTRAINT LlaveUsuarioComentarios PRIMARY KEY (Id_Usuario,Id_Comentarios)
ALTER TABLE Anuncios_Publicados ADD CONSTRAINT LlaveAnunciosPublicados PRIMARY KEY (Id_Anuncio,Id_Publicados)
ALTER TABLE Producto_Anuncios ADD CONSTRAINT LlaveAnunciosProducto PRIMARY KEY (Id_Anuncio,Id_Producto)
ALTER TABLE Producto_Publicados ADD CONSTRAINT LlaveProductoPublicados PRIMARY KEY (Id_Publicados,Id_Producto)
ALTER TABLE Producto_Estado ADD CONSTRAINT LlaveProductoEstado PRIMARY KEY (Id_Estado,Id_Producto)
ALTER TABLE Producto_Ubicacion ADD CONSTRAINT LlaveProductoUbicacion PRIMARY KEY (Id_Ubicacion,Id_Producto)










ALTER TABLE RolPermiso ADD CONSTRAINT CF_RPRol FOREIGN KEY (Id_Rol) REFERENCES Rol(Id_Rol)
ALTER TABLE RolPermiso ADD CONSTRAINT CF_RPPermiso FOREIGN KEY (Id_Permiso) REFERENCES Permiso(Id_Permiso)
ALTER TABLE Compra ADD CONSTRAINT CF_CUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
ALTER TABLE Compra ADD CONSTRAINT CF_CProducto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
ALTER TABLE Compra ADD CONSTRAINT CF_CHorario FOREIGN KEY (Id_Horario) REFERENCES Horario(Id_Horario)
ALTER TABLE AccionRegistrada ADD CONSTRAINT CF_ARUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
ALTER TABLE AccionRegistrada ADD CONSTRAINT CF_ARRegistro FOREIGN KEY (Id_Registro) REFERENCES Registro(Id_Registro)
ALTER TABLE RolUsuario ADD CONSTRAINT CF_RUUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
ALTER TABLE RolUsuario ADD CONSTRAINT CF_RURol FOREIGN KEY (Id_Rol) REFERENCES Rol(Id_Rol)
ALTER TABLE EstadoUsuario ADD CONSTRAINT CF_EUUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
ALTER TABLE EstadoUsuario ADD CONSTRAINT CF_EUEstado FOREIGN KEY (Id_Estado) REFERENCES Estado(Id_Estado)
ALTER TABLE CarreraUsuario ADD CONSTRAINT CF_CUUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
ALTER TABLE CarreraUsuario ADD CONSTRAINT CF_CUCarrera FOREIGN KEY (Id_Carrera) REFERENCES Carrera(Id_Carrera)
ALTER TABLE Usuario ADD CONSTRAINT CF_URating FOREIGN KEY (Id_Calificaciones) REFERENCES Calificaciones(Id_Calificaciones)
ALTER TABLE Salon ADD CONSTRAINT CF_SEdificio FOREIGN KEY (Id_Ubicacion) REFERENCES Ubicacion(Id_Ubicacion)
ALTER TABLE UbicacionUsuario ADD CONSTRAINT CF_UUUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
ALTER TABLE UbicacionUsuario ADD CONSTRAINT CF_UUUbicacion FOREIGN KEY (Id_Ubicacion) REFERENCES Ubicacion(Id_Ubicacion)



  ALTER TABLE Subcategoria ADD CONSTRAINT CF_SCategoria FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id_Categoria)

  ALTER TABLE Correos ADD CONSTRAINT CF_CUsuarioEmisor FOREIGN KEY (Id_UsuarioR) REFERENCES Usuario(Id_Usuario)
  ALTER TABLE Correos ADD CONSTRAINT CC_CUsuarioReceptor FOREIGN KEY (Id_UsuarioE) REFERENCES Usuario(Id_Usuario)
  ALTER TABLE Anuncios ADD CONSTRAINT CF_AProducto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
  ALTER TABLE Producto ADD CONSTRAINT CF_PCalificaciones FOREIGN KEY (Id_Calificaciones) REFERENCES Calificaciones(Id_Calificaciones)

  ALTER TABLE Correos_Archivos_Multimedia ADD CONSTRAINT CF_CAMCorreo FOREIGN KEY (Id_Correo) REFERENCES Correos(Id_Correo)
  ALTER TABLE Correos_Archivos_Multimedia ADD CONSTRAINT CF_CAMArchivos FOREIGN KEY (Id_Archivos_Multimedia) REFERENCES Archivos_Multimedia(Id_Archivos_Multimedia)
  ALTER TABLE Usuario_Correos ADD CONSTRAINT CF_UCCorreos FOREIGN KEY (Id_Correo) REFERENCES Correos(Id_Correo)
  ALTER TABLE Usuario_Correos ADD CONSTRAINT CF_UCoUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
  ALTER TABLE Producto_Archivos_Multimedia ADD CONSTRAINT CF_PAMProducto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
  ALTER TABLE Producto_Archivos_Multimedia ADD CONSTRAINT CF_PAMArchivos FOREIGN KEY (Id_Archivos_Multimedia) REFERENCES Archivos_Multimedia(Id_Archivos_Multimedia)
  ALTER TABLE Producto_Categoria ADD CONSTRAINT CF_PCProducto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
  ALTER TABLE Producto_Categoria ADD CONSTRAINT CF_PCCategoria FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id_Categoria)
  ALTER TABLE Usuario_Archivos_Multimedia ADD CONSTRAINT CF_UAMUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
  ALTER TABLE Usuario_Archivos_Multimedia ADD CONSTRAINT CF_UAMArchivos FOREIGN KEY (Id_Archivos_Multimedia) REFERENCES Archivos_Multimedia(Id_Archivos_Multimedia)
  ALTER TABLE Usuario_Publicados ADD CONSTRAINT CF_UPubUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
  ALTER TABLE Usuario_Publicados ADD CONSTRAINT CF_UPPublicados FOREIGN KEY (Id_Publicados) REFERENCES Publicados(Id_Publicados)
  ALTER TABLE Usuario_Anuncios ADD CONSTRAINT CF_UAUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
  ALTER TABLE Usuario_Anuncios ADD CONSTRAINT CF_UAAnuncios FOREIGN KEY (Id_Anuncio) REFERENCES Anuncios(Id_Anuncio)
  ALTER TABLE Usuario_Comentarios ADD CONSTRAINT CF_UComUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
  ALTER TABLE Usuario_Comentarios ADD CONSTRAINT CF_UCComentarios FOREIGN KEY (Id_Comentarios) REFERENCES Comentarios(Id_Comentarios)
  ALTER TABLE Usuario_Producto ADD CONSTRAINT CF_UProUsuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
  ALTER TABLE Usuario_Producto ADD CONSTRAINT CF_UPProducto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
  ALTER TABLE Anuncios_Publicados ADD CONSTRAINT CF_APAnuncios FOREIGN KEY (Id_Anuncio) REFERENCES Anuncios(Id_Anuncio)
  ALTER TABLE Anuncios_Publicados ADD CONSTRAINT CF_APPublicados FOREIGN KEY (Id_Publicados) REFERENCES Publicados(Id_Publicados)
  ALTER TABLE Producto_Anuncios ADD CONSTRAINT CF_PAAnuncios FOREIGN KEY (Id_Anuncio) REFERENCES Anuncios(Id_Anuncio)
  ALTER TABLE Producto_Anuncios ADD CONSTRAINT CF_PAProducto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
  ALTER TABLE Producto_Publicados ADD CONSTRAINT CF_PPublicados FOREIGN KEY (Id_Publicados) REFERENCES Publicados(Id_Publicados)
  ALTER TABLE Producto_Publicados ADD CONSTRAINT CF_PPProducto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
  ALTER TABLE Producto_Estado ADD CONSTRAINT CF_PEEstado FOREIGN KEY (Id_Estado) REFERENCES Estado(Id_Estado)
  ALTER TABLE Producto_Estado ADD CONSTRAINT CF_PEProducto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
  ALTER TABLE Producto_Ubicacion ADD CONSTRAINT CF_PUUbicacion FOREIGN KEY (Id_Ubicacion) REFERENCES Ubicacion(Id_Ubicacion)
  ALTER TABLE Producto_Ubicacion ADD CONSTRAINT CF_PUProducto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)


/*Carga de Datos*/


INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Tecnología', 'Productos que procesen algún tipo de información');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Comida', 'Productos con los que se alimenta el ser humano');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Muebles', 'Productos para la casa');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Ropa', 'Productos para vestir');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Accesorios', 'Productos para vestir que no sean ropa');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Deportes', 'Productos que formen parte en cualquier deporte');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Apartamentos', 'Apartamentos de la zona');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Arte', 'Productos que tengan algo que ver con arte');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Musica', 'Instrumentos, discos, entre otros productos en el ambito musical');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Mascotas', 'desde lo que necesite tu mascota hasta una nueva mascota');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Coches', 'Productos con multiples ruedeas que transportan a seres humanos');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Libros', 'Pedazos de arbol procesado en las cuales se le pintan letras para poder leer');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Escuela', 'Productos que sean utiles en la escuela');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Jardinería', 'Productos para mejorar tu jardin');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Relojes', 'Diapostivos modernos que te pueden decir el tiempo');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Electrodomesticos', 'Productos electronicos para mejorar el manejo del hogar');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Bebidas', 'Productos para hidratar el cuerpo humano ');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Jugetes', 'Productos con los que te puedes divertir ');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Higiene', 'Productos para cuidar la salud humana');
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES ('Servicios', 'Servicios para ayudar al usuario');


INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('00:00:00','01:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('01:00:00','02:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('02:00:00','03:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('03:00:00','04:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('04:00:00','05:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('05:00:00','06:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('06:00:00','07:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('07:00:00','08:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('08:00:00','09:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('09:00:00','10:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('10:00:00','11:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('11:00:00','12:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('12:00:00','13:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('13:00:00','14:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('14:00:00','15:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('15:00:00','16:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('16:00:00','17:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('17:00:00','18:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('18:00:00','19:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('19:00:00','20:00:00 ');
INSERT INTO Horario (InicioHorario, FinHorario) VALUES ('20:00:00','21:00:00 ');


INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Radios',1);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Playeras',2);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Postres',3);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Refrigeradores',4);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Chamarras',5);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Garnachas',6);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Instrumentos',7);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Novelas',8);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Para Gatos',9);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Llantas',10);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Televisiones',11);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Cellulares',12);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Computadoras',13);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Libretas',14);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Collares',15);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Refrescos',16);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Sillones',17);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Videojuegos',18);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Teclados',19);
INSERT INTO Subcategoria (Nombre_Subcategoria, Id_Categoria) VALUES ('Violines',20);


INSERT INTO Archivos_Multimedia (Extension) VALUES ('.png');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.jpg');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.jgp');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.png');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.jpg');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.gif');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.jpeg');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.png');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.png');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.gif');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.gif');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.jpg');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.jpg');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.png');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.png');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.gif');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('png');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.jpeg');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.gif');
INSERT INTO Archivos_Multimedia (Extension) VALUES ('.png');

INSERT INTO Registro(Accion) VALUES('Grupo estudiantil');
INSERT INTO Registro(Accion) VALUES('Usuario generico');
INSERT INTO Registro(Accion) VALUES('Administrador');
INSERT INTO Registro(Accion) VALUES('Usuario registrado');
INSERT INTO Registro(Accion) VALUES('Super usuario');
INSERT INTO Registro(Accion) VALUES('Agregar usuario');
INSERT INTO Registro(Accion) VALUES('Agregar compra');
INSERT INTO Registro(Accion) VALUES('Agregar producto');
INSERT INTO Registro(Accion) VALUES('Eliminar producto');
INSERT INTO Registro(Accion) VALUES('Eliminar usuario');
INSERT INTO Registro(Accion) VALUES('Eliminar grupo estudiantil');
INSERT INTO Registro(Accion) VALUES('Agregar anuncio');
INSERT INTO Registro(Accion) VALUES('Publicitar producto');
INSERT INTO Registro(Accion) VALUES('Registrar usuario');
INSERT INTO Registro(Accion) VALUES('Eliminar anuncio');
INSERT INTO Registro(Accion) VALUES('Eliminar publicidad');
INSERT INTO Registro(Accion) VALUES('Solicitar compra');
INSERT INTO Registro(Accion) VALUES('Buscar Producto');
INSERT INTO Registro(Accion) VALUES('Agregar Comentario');
INSERT INTO Registro(Accion) VALUES('Mandar Correo');

INSERT INTO Permiso(Descripcion) VALUES('Grupo estudiantil');
INSERT INTO Permiso(Descripcion) VALUES('Usuario generico');
INSERT INTO Permiso(Descripcion) VALUES('Administrador');
INSERT INTO Permiso(Descripcion) VALUES('Usuario registrado');
INSERT INTO Permiso(Descripcion) VALUES('Super usuario');
INSERT INTO Permiso(Descripcion) VALUES('Agregar usuario');
INSERT INTO Permiso(Descripcion) VALUES('Agregar compra');
INSERT INTO Permiso(Descripcion) VALUES('Agregar producto');
INSERT INTO Permiso(Descripcion) VALUES('Eliminar producto');
INSERT INTO Permiso(Descripcion) VALUES('Eliminar usuario');
INSERT INTO Permiso(Descripcion) VALUES('Eliminar grupo estudiantil');
INSERT INTO Permiso(Descripcion) VALUES('Agregar anuncio');
INSERT INTO Permiso(Descripcion) VALUES('Publicitar producto');
INSERT INTO Permiso(Descripcion) VALUES('Registrar usuario');
INSERT INTO Permiso(Descripcion) VALUES('Eliminar anuncio');
INSERT INTO Permiso(Descripcion) VALUES('Eliminar publicidad');
INSERT INTO Permiso(Descripcion) VALUES('Solicitar compra');
INSERT INTO Permiso(Descripcion) VALUES('Buscar Producto');
INSERT INTO Permiso(Descripcion) VALUES('Agregar Comentario');
INSERT INTO Permiso(Descripcion) VALUES('Mandar Correo');

INSERT INTO Rol(NombreRol) VALUES('Grupo estudiantil');
INSERT INTO Rol(NombreRol) VALUES('Usuario generico');
INSERT INTO Rol(NombreRol) VALUES('Administrador');
INSERT INTO Rol(NombreRol) VALUES('Usuario registrado');
INSERT INTO Rol(NombreRol) VALUES('Super usuario');


INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 1','20.6160009,-100.4098904','Edificio de Civil');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 2','20.6160008,-100.4098904','Edificio de Sistemas');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 3','20.6160007,-100.4098904','Edificio Ciencias');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 4','20.6160006,-100.4098904','Edificio Licenciatura');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 5','20.6160005,-100.4098904','Edificio Ciencias Basicas');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 6','20.6160004,-100.4098904','Edificio de Biblioteca');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 7','20.6160003,-100.4098904','Edificio de Punto Azul');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 8','20.6160002,-100.4098904','Salon de Congresos');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 9','20.6160001,-100.4098904','Gym');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 10','20.6160000,-100.4098904','Edificio de Centro de Medios');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 11','20.6160019,-100.4098904','Edificio de Preparatoria');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 12','20.6160029,-100.4098904','Edificio de Residencias');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 13','20.6160039,-100.4098904','DICI');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 14','20.6160049,-100.4098904','Edificio de Arquitectura');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 15','20.6160059,-100.4098904','Parque Tecnologico');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Edificio 16','20.6160069,-100.4098904','Edifico CIMA');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Jardin 16','20.6160008,-100.4098904','Jardin Ubicado Frente al Edificio 16');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Ciber Plaza','20.6160072,-100.4098904','Plaza de Nutrisa');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Parque Tecnologico','20.6160082,-100.4098904','Frente a entrada 3 del Tec');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Borrego Cimarron','20.6160092,-100.4098904','Jardin Ubicado Frente al Edificio 9');
INSERT INTO Ubicacion (Nombre, Coordenadas, Descripcion) VALUES ('Fuente 3','20.616102,-100.4098904','Jardin Ubicado Frente al Edificio 9');




INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2101,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2102,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2103,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2104,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2105,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2001,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2002,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2003,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2004,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (2,2005,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3101,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3102,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3103,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3104,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3105,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3001,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3002,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3003,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3004,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (3,3005,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (4,4101,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (4,4102,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (4,4103,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (4,4104,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (4,4105,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9001,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9002,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9003,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9004,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9005,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9101,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9102,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9103,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9104,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (9,9105,'Pimero');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (16,16001,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (16,16002,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (16,16003,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (16,16004,'Sotano');
INSERT INTO Salon (Id_Ubicacion, Numero, Piso) VALUES (16,16005,'Sotano');


INSERT INTO Estado (Nombre, Descripcion) VALUES ('Conectado','El usuario se encuentra disponible');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Desconectado','El usuario se encuentra desconectado');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Ausente','El usuario se encuentra ausente');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Ocupado','El usuario se encuentra ocupado');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Comprando','El usuario se encuentra comprando');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Buscando','El usuario se encuentra buscando');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Pagando','El usuario se encuentra pagando');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Esperando','El usuario se encuentra esperando una respuesta');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Respondiendo','El usuario se encuentra respondiendo una pregunta');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('No Confirmado','El usuario no ha confirmado su cuenta');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('General','El usuario no esta registrado');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Contactando','El usuario se encuentra contactando a otro usuario');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Hambriento','El usuario se encuentra buscando algo de comer');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Sediento','El usuario se encuentra buscando algo de beber');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Bienes Raices','El usuario se encuentra busacndo bienes raices');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Atormentado','El usuario se encuentra buscando relajacion extrema');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Durmiendo','El usuario se encuentra cansado');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Parciales','El usuario se encuentra casi muriendo');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('FactorTec','El usuario se encuentra con la innovacion en mano');
INSERT INTO Estado (Nombre, Descripcion) VALUES ('Emprendiendo','El usuario se encuentra buscando ideas o creandolas');


INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria en Sistemas Computacionales','ISC');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria en Sistemas Digitales y Robotica','ISDR');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria en Mecatronica','IMT');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria en Desarrollo Sustentable','IDS');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria Industrial y de Sistemas','IIS');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria en Industrias Alimentarias','IIA');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria en Agronomia','IA');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Licenciatura en Animacion Digital','LAD');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Licenciatura en Administracion de Empresas','LAE');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Licenciatura en Comunicacion y Medios Digitales','LCM');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria Civil','IC');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria Mecanica Administrativa','IMA');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Licenciatura en Arquitectura','ARQ');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Licenciatura en Administracion Financiera','LAF');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria en Biotecnologia','IBT');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria Fisica Industrial','IFI');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria Quimica Administrativa','IQA');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Licenciatura en Relaciones Internacionales','LRI');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria en Innovacion y Desarrollo','IID');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria en Tecnologias de Informacion','ITI');
INSERT INTO Carrera(Nombre,Acronimo) VALUES ('Ingenieria Mecanica Electricista','IME');


INSERT INTO Calificaciones (Calificacion) VALUES (90);
INSERT INTO Calificaciones (Calificacion) VALUES (100);
INSERT INTO Calificaciones (Calificacion) VALUES (80);
INSERT INTO Calificaciones (Calificacion) VALUES (77);
INSERT INTO Calificaciones (Calificacion) VALUES (63);
INSERT INTO Calificaciones (Calificacion) VALUES (92);
INSERT INTO Calificaciones (Calificacion) VALUES (90);
INSERT INTO Calificaciones (Calificacion) VALUES (99);
INSERT INTO Calificaciones (Calificacion) VALUES (92);
INSERT INTO Calificaciones (Calificacion) VALUES (95);
INSERT INTO Calificaciones (Calificacion) VALUES (67);
INSERT INTO Calificaciones (Calificacion) VALUES (83);
INSERT INTO Calificaciones (Calificacion) VALUES (32);
INSERT INTO Calificaciones (Calificacion) VALUES (87);
INSERT INTO Calificaciones (Calificacion) VALUES (88);
INSERT INTO Calificaciones (Calificacion) VALUES (87);
INSERT INTO Calificaciones (Calificacion) VALUES (78);
INSERT INTO Calificaciones (Calificacion) VALUES (75);
INSERT INTO Calificaciones (Calificacion) VALUES (72);
INSERT INTO Calificaciones (Calificacion) VALUES (93);


INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Manuel','Garcia','Huerta','mgarcia98','GH123456789*','manuelgh98@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Pablo','Prado','Ayala','jpprado','PA123456789*','jpprado@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Guillermo','Carsolio','Gonzales','mexbox97','CG123456789*','memocarsolio@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Samantha','Hernandez','Hernandez','samhdzhdz','SH123456789*','samanthahdz@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Miguel','Navarro','Mata','miguelxnxm','NM123456789*','miguelnm@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Gabriela','Perez','Sanchez','gabyperez','PS123456789*','gabrielaperez@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Daniela','Ibarra','Martinez','daniibarra','IM123456789*','daniibarra@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Daniel','Dorantes','Guerra','danielguerra','DG123456789*','dorantesguerra@hotmail.com','2017',0,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Valeria','Mendez','Fernandez','valeriafermen','MF123456789*','valefdz@hotmail.com','2017',0,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Diego','Lopez','Morales','diegolm','LM123456789*','diegolm@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Roberto','Diaz','Zamora','robzam','DZ123456789*','diazzamora@hotmail.com','2017',0,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Rogelio','Garcia','Sanchez','robertogs','GS123456789*','garciasanchez@hotmail.com','2015',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Filiberto','Hernandez','Fernandez','filihdz','HF123456789*','filihdz@hotmail.com','2015',0,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Xochitl','Lopez','Portillo','xochitlportillo','LP123456789*','lopezportillo@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Laura','Pimienta','Cardenas','teypimienta','PC123456789*','teypimienta@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Maria','Sanchez','Romero','mariasanchez','SR123456789*','sanchezromero@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Sofia','Meza','Torres','sofiamtz','MT123456789*','sofiamtz@hotmail.com','2016',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Emilia','Garcia','Flores','emiliagf','GF123456789*','emiliagf@hotmail.com','2014',0,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Rosa','Torres','Gonzales','torresrosa','TG123456789*','rosatorres@hotmail.com','2014',1,1);
INSERT INTO Usuario(Nombre,Apellido_P,Apellido_M,Nombre_Usuario,Contrasena,Correo,Anio_Ing,Semestre,Id_Calificaciones) VALUES ('Karen','Rosales','Ramirez','karenrosales','RR123456789*','rosalesramirez@hotmail.com','2016',1,1);

INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (1,1);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (2,2);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (3,3);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (4,4);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (5,5);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (6,6);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (7,7);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (8,8);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (9,9);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (10,10);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (11,11);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (12,12);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (13,13);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (14,14);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (15,15);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (16,16);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (17,17);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (18,18);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (19,19);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (20,20);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (1,2);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (2,3);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (3,4);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (4,5);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (5,6);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (6,7);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (7,8);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (8,9);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (9,10);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (10,11);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (11,12);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (12,13);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (13,14);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (14,15);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (15,16);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (16,17);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (17,18);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (18,19);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (19,20);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (20,21);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (1,1);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (2,2);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (3,3);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (4,4);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (5,5);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (6,6);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (7,7);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (8,8);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (9,9);
INSERT INTO CarreraUsuario (Id_Usuario, Id_Carrera) VALUES (10,10);



INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,1);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (2,2);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (3,3);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (4,4);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (5,5);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (6,6);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (7,7);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (8,8);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (9,9);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (10,10);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (11,11);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (12,12);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (13,13);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (14,14);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (15,15);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (16,16);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (17,17);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (18,18);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (19,19);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (20,20);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,2);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,3);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,4);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,5);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,6);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,7);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,8);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,9);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,10);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,11);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,12);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,13);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,14);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,15);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,16);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,17);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,18);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,19);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,20);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,1);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,2);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,3);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,4);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,5);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,6);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,7);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,8);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,9);
INSERT INTO EstadoUsuario (Id_Usuario, Id_Estado) VALUES (1,10);




INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (1,1);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (2,2);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (3,3);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (4,4);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (5,5);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (6,6);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (7,7);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (8,8);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (9,9);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (10,10);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (11,11);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (12,12);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (13,13);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (14,14);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (15,15);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (16,16);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (17,17);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (18,18);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (19,19);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (20,20);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (1,2);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (2,3);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (3,4);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (4,5);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (5,6);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (6,7);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (7,8);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (8,9);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (9,10);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (10,11);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (11,12);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (12,13);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (13,14);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (14,15);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (15,16);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (16,17);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (17,18);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (18,19);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (19,20);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (20,1);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (1,8);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (2,9);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (3,10);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (4,11);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (5,12);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (6,13);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (7,14);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (8,15);
INSERT INTO UbicacionUsuario (Id_Ubicacion, Id_Usuario) VALUES (9,16);

INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(4,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(8,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(18,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(3,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(2,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(6,2);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(7,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(6,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(13,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(2,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(16,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(8,2);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(8,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(18,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(16,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(14,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(9,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(8,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(18,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(12,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(14,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(11,2);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(4,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(18,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(1,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(12,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(2,2);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(12,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(3,2);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(18,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(5,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(18,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(4,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(16,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(18,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(11,2);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(7,2);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(13,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(16,2);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(17,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(3,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(12,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(4,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(8,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(5,1);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(16,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(3,4);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(9,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(7,3);
INSERT INTO RolUsuario (Id_Usuario, Id_Rol) VALUES(16,2);


INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,19);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,15);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,12);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,4);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,12);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,7);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,13);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,17);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,11);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,3);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,13);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,2);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(1,14);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,2);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,3);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,10);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,6);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,1);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,4);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,15);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,5);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,10);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,10);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,17);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,10);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,19);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,2);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,16);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,14);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,19);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(1,15);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,19);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(1,11);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(1,13);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(1,1);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,18);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,4);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,18);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,18);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,15);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,8);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(1,5);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(1,4);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,5);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(4,13);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(1,7);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,19);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,12);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(3,12);
INSERT INTO RolPermiso(Id_Rol,Id_Permiso) VALUES(2,12);




INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(4,19);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(8,15);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(18,12);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(3,4);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(2,12);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(6,7);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(7,13);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(6,17);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(13,11);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(2,3);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(16,13);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(8,2);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(8,14);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(18,2);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(16,3);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(14,10);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(9,6);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(8,1);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(18,4);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(12,15);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(14,5);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(11,10);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(4,10);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(18,17);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(1,10);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(12,19);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(2,2);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(12,16);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(3,14);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(18,19);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(5,15);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(18,19);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(4,11);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(16,13);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(18,1);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(11,18);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(7,4);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(13,18);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(16,18);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(17,15);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(3,8);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(12,5);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(4,4);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(8,5);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(5,13);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(16,7);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(3,19);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(9,12);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(7,12);
INSERT INTO AccionRegistrada(Id_Usuario, Id_Registro) VALUES(16,12);





/*Memo*/




INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('13/11/2017', 1);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('14/11/2017', 5);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('15/11/2017', 7);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('16/11/2017', 9);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('17/11/2017', 10);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('18/11/2017', 2);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('19/11/2017', 1);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('20/11/2017', 1);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('10/11/2017', 2);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('13/12/2017', 2);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('12/12/2017', 2);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('16/12/2017', 3);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('15/12/2017', 4);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('14/12/2017', 7);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('13/12/2017', 8);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('12/12/2017', 10);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('11/12/2017', 2);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('11/12/2017', 1);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('14/12/2017', 2);
INSERT INTO Publicados (Fecha_Publicados, Dias_Restantes) VALUES ('17/12/2017', 5);

INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700041', 1,1);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700042', 2,2);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700043', 3,3);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700544', 4,4);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01703445', 5,5);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700046', 6,6);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700047', 7,7);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700048', 8,8);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01706449', 9,9);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700050', 10,10);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700051', 11,11);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01702342', 12,12);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700053', 13,13);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01704354', 14,13);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700055', 15,15);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700056', 16,16);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700057', 17,17);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700058', 18,18);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700059', 19,19);
INSERT INTO Correos (Matricula_Correos, Id_UsuarioR, Id_UsuarioE) VALUES ('a01700060', 20,20);


INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Brownies','Brownies de chocolate',15,'NA',85);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Iphone 6','Smartphone del 2014',8000 ,'Apple',90);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Tacos Manolo','Tacos de guisados',12,'NA',97);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('SmoothieLocos','Liquados de sabores exoticos',40,'NA',65);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Samsung S6','Smartphone nuevo 2013',6500,'Samsung',90);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Adidas Pants','Pants de licra',800,'Adidas',75);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('NMD 2X4','Tennis modernos',3000,'Adidas',95);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Monitor SXLT','Monitor para jugar videojuegos',2500,'BENQ',98);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('MacBook Pro 2014','Laptop 16gb RAM 256 gb de SSD',3000,'Apple',85);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('La chica del tren','Novela de tipo thriller',450,'NA', 89);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Marshall MG','Amplificador para guitarra electrica',750,'Marshall',90);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Tortas el guero','Tortas muy ricas de todo',10,'NA',50);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Cocu Cola','Refresco de sabor incognito',15,'NA', 99);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Pulsera Azteca','Pulser hecha de tela',100,'NA',70);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Chamarra Boss','Chamarra para invierno',4000 ,'Hugo Boss',97);
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, Precio_Producto, Marca_Producto, Id_Calificaciones) VALUES ('Perrorade','Es como gatorade pero más rico',30,'NA',30);




INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Brownies Nuevos', 'nuevos y deliciosos brownies hechos en casa', '14/12/2017','15/12/2017', 1);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Paletas halloweenescas', 'Paletas para celebrar octubre', '15/12/2017','16/12/2017', 2);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Iphone 6s para todos', 'En perfectas condiciones y casi nuevo', '16/12/2017','17/12/2017', 3);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Consolas Vintage', 'Vendo consolas antiguas a un muy buen precio', '17/12/2017','18/12/2017', 4);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Monitor viejo', 'Quiero vender mi monitor viejo porfavor compralo', '18/12/2017','19/12/2017', 5);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('NMDS Usados', 'nuevos y deliciosos brownies hechos en casa', '19/12/2017', '20/12/2017',6);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Chamarra Armani', 'nuevos y deliciosos brownies hechos en casa', '20/12/2017','21/12/2017', 7);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Mac pro 2015', 'nuevos y deliciosos brownies hechos en casa', '21/12/2017','22/12/2017', 8);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Tacos sudados muy ricos', 'nuevos y deliciosos brownies hechos en casa', '22/12/2017','23/12/2017', 9);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Pizza de little C', 'nuevos y deliciosos brownies hechos en casa', '23/12/2017','24/12/2017', 10);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Chocolates Franceces', 'nuevos y deliciosos brownies hechos en casa', '24/12/2017','25/12/2017', 11);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Playera firmada por CH14', 'Es amigo de mi prima y es real', '25/12/2017','26/12/2017', 12);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Reloj antiguo', 'No se que marca es y me quiero deshacer de el', '26/12/2017','27/12/2017', 13);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Boletos para el partido del viernes', 'por si quieres ver a los gallos ganarle a los tigres', '27/12/2017','28/12/2017', 14);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Labial de Kyle Jenner', 'por si quieres ser toda una kardashian', '28/12/2017','29/12/2017', 15);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Corta uñas nuevo', 'Muy muy muy barato', '29/12/2017','30/12/2017', 16);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Clases de Guitarra', 'Por si quieres volverte todo un artista', '30/12/2017','31/12/2017', 17);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Razer Nueva y Mejorada', 'Yo y unos amigos mejoramos computadoras del mercado y esta fue nuestra última', '31/12/2017','1/01/2018', 18);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Toras de la guera a tu salon', 'Traemos a la escuela tortas la guera', '1/01/2018','2/01/2018', 19);
INSERT INTO Anuncios (Titulo_Anuncio, Texto_Anuncio, Fecha_Inicio_Anuncio, Fecha_Fin_Anuncio, Id_Producto) VALUES ('Cafe colombiano', 'Cafe de familia colombiana', '2/01/2018','3/01/2018', 20);

INSERT INTO Comentarios (Texto_Comentario) VALUES ('Muy ricos la verdad');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('No me gusto la calidad del producto');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('Estaba en buenas condiciones');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('La verdad son las peores pizzas que me e comido');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('la verdad me lo entrego roto');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('saben horrible las galletas');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('Muy creativo el diseño 10/10');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('Bonito pero caro');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('Rico y barato');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('NUNCA ME ENTREGO EL PRODUCTO');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('La foto engaña, muy MALO');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('Mi playera favorita');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('Super rapido');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('No no no muy  muy malooooo');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('holi :)');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('me agrado mucho');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('Muy rico pero un poquito caro');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('La verdad super original');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('No puedo creer que esto lo vendan en el tec, Super padre');
INSERT INTO Comentarios (Texto_Comentario) VALUES ('muy muy rico');







INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (1, 3, '9/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (2, 42, '10/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (3, 54, '11/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (5, 22, '12/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (4, 9, '13/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (5, 12, '14/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (6, 45, '15/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (7, 22, '16/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (8, 62, '17/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (9, 82, '8/5/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (10, 2, '9/6/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (11, 42, '10/6/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (12, 62, '11/6/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (13, 22, '12/6/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (14, 52, '13/6/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (15, 72, '14/6/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (16, 8, '15/6/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (17, 7, '16/6/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (18, 8, '17/6/2017');
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (19, 65, '18/6/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (20, 43, '8/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (21, 23, '9/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (22, 54, '10/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (23, 32, '11/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (24, 83, '12/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (25, 43, '13/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (26, 54, '14/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (27, 86, '15/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (28, 32, '16/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (29, 21, '17/7/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (30, 43, '8/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (31, 23, '9/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (32, 54, '10/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (33, 32, '11/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (34, 83, '12/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (35, 43, '13/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (36, 54, '14/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (37, 86, '15/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (38, 32, '16/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (39, 21, '17/8/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (40, 43, '8/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (41, 23, '9/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (42, 54, '10/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (43, 32, '11/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (44, 83, '12/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (45, 43, '13/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (46, 54, '14/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (47, 86, '15/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (48, 32, '16/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (49, 21, '17/9/2017'); 
INSERT INTO Correos_Archivos_Multimedia (Id_Correo, Id_Archivos_Multimedia, Fecha) VALUES (50, 21, '18/9/2017'); 

INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (1,1);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (2,2);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (3,3);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (4,4);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (5,5);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (6,6);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (7,7);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (8,8);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (9,9);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (10,10);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (11,11);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (12,12);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (13,13);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (14,14);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (15,15);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (16,16);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (17,17);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (18,18);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (19,19);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (20,20);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (21,21);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (22,22);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (23,23);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (24,24);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (25,25);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (26,26);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (27,27);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (28,28);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (29,29);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (30,30);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (31,31);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (32,32);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (33,33);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (34,34);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (35,35);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (36,36);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (37,37);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (38,38);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (39,39);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (40,40);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (41,41);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (42,42);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (43,43);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (44,44);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (45,45);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (46,46);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (47,47);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (48,48);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (49,49);
INSERT INTO Usuario_Correos (Id_Correo, Id_Usuario) VALUES (50,50);

INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (1,1);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (2,2);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (3,3);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (4,4);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (5,5);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (6,6);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (7,7);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (8,8);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (9,9);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (10,10);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (11,11);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (12,12);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (13,13);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (14,14);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (15,15);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (16,16);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (17,17);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (18,18);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (19,19);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (20,20);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (21,21);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (22,22);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (23,23);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (24,24);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (25,25);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (26,26);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (27,27);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (28,28);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (29,29);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (30,30);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (31,41);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (32,42);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (33,43);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (34,44);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (35,45);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (36,46);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (37,47);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (38,48);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (39,49);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (40,40);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (41,41);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (42,42);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (43,43);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (44,44);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (45,45);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (46,46);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (47,47);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (48,48);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (49,49);
INSERT INTO Producto_Archivos_Multimedia (Id_Archivos_Multimedia, Id_Producto) VALUES (50,50);


INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (1,1);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (2,2);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (3,3);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (4,4);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (5,5);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (6,6);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (7,7);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (8,8);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (9,9);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (10,10);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (21,21);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (22,22);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (23,23);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (24,24);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (25,25);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (26,26);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (27,27);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (28,28);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (29,29);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (30,30);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (31,31);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (32,32);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (33,33);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (34,34);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (35,35);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (36,36);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (37,37);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (38,38);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (39,39);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (40,40);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (41,41);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (42,42);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (43,43);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (44,44);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (45,45);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (46,46);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (47,47);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (48,48);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (49,49);
INSERT INTO Producto_Categoria (Id_Producto, Id_Categoria) VALUES (50,50);

INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (1,1);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (2,2);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (3,3);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (4,4);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (5,5);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (6,6);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (7,7);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (8,8);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (9,9);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (10,10);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (11,11);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (12,12);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (13,13);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (14,14);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (15,15);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (16,16);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (17,17);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (18,18);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (19,19);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (20,20);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (21,21);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (22,22);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (23,23);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (24,24);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (25,25);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (26,26);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (27,27);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (28,28);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (29,29);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (30,30);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (31,31);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (32,32);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (33,33);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (34,34);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (35,35);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (36,36);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (37,37);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (38,38);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (39,39);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (40,40);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (41,41);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (42,42);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (43,43);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (44,44);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (45,45);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (46,46);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (47,47);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (48,48);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (49,49);
INSERT INTO Usuario_Archivos_Multimedia (Id_Usuario, Id_Archivos_Multimedia) VALUES (50,50);

INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (1,1);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (2,2);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (3,3);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (4,4);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (5,5);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (6,6);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (7,7);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (8,8);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (9,9);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (10,10);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (11,11);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (12,12);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (13,13);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (14,14);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (15,15);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (16,16);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (17,17);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (18,18);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (19,19);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (20,20);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (21,21);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (22,22);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (23,23);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (24,24);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (25,25);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (26,26);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (27,27);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (28,28);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (29,29);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (30,30);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (31,31);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (32,32);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (33,33);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (34,34);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (35,35);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (36,36);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (37,37);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (38,38);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (39,39);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (40,40);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (41,41);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (42,42);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (43,43);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (44,44);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (45,45);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (46,46);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (47,47);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (48,48);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (49,49);
INSERT INTO Usuario_Publicados (Id_Usuario, Id_Publicados) VALUES (50,50);

INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (1,1);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (2,2);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (3,3);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (4,4);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (5,5);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (6,6);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (7,7);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (8,8);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (9,9);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (10,10);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (11,11);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (12,12);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (13,13);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (14,14);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (15,15);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (16,16);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (17,17);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (18,18);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (19,19);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (20,20);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (21,21);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (22,22);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (23,23);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (24,24);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (25,25);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (26,26);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (27,27);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (28,28);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (29,29);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (30,30);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (31,31);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (32,32);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (33,33);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (34,34);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (35,35);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (36,36);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (37,37);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (38,38);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (39,39);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (40,40);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (41,41);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (42,42);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (43,43);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (44,44);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (45,45);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (46,46);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (47,47);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (48,48);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (49,49);
INSERT INTO Usuario_Anuncios (Id_Usuario, Id_Anuncio) VALUES (50,50);

INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (1,1);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (2,2);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (3,3);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (4,4);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (5,5);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (6,6);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (7,7);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (8,8);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (9,9);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (10,10);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (11,11);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (12,12);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (13,13);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (14,14);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (15,15);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (16,16);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (17,17);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (18,18);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (19,19);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (20,20);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (21,21);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (22,22);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (23,23);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (24,24);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (25,25);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (26,26);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (27,27);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (28,28);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (29,29);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (30,30);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (31,31);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (32,32);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (33,33);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (34,34);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (35,35);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (36,36);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (37,37);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (38,38);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (39,39);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (40,40);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (41,41);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (42,42);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (43,43);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (44,44);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (45,45);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (46,46);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (47,47);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (48,48);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (49,49);
INSERT INTO Usuario_Comentarios (Id_Usuario, Id_Comentarios) VALUES (50,50);

INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (1,1);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (2,2);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (3,3);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (4,4);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (5,5);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (6,6);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (7,7);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (8,8);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (9,9);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (10,10);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (11,1);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (12,12);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (13,13);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (14,14);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (15,15);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (16,16);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (17,17);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (18,18);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (19,19);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (20,20);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (21,21);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (22,22);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (23,23);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (24,24);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (25,25);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (26,26);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (27,27);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (28,28);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (29,29);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (30,30);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (31,31);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (32,32);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (33,33);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (34,34);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (35,35);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (36,36);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (37,37);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (38,38);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (39,39);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (40,40);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (41,41);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (42,42);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (43,43);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (44,44);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (45,45);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (46,46);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (47,47);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (48,48);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (49,49);
INSERT INTO Usuario_Producto (Id_Usuario, Id_Producto) VALUES (50,50);

INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (1,1);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (2,2);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (3,3);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (4,4);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (5,5);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (6,6);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (7,7);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (8,8);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (9,9);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (10,10);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (11,11);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (12,12);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (13,13);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (14,14);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (15,15);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (16,16);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (17,17);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (18,18);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (19,19);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (20,20);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (21,21);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (22,22);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (23,23);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (24,24);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (25,25);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (26,26);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (27,27);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (28,28);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (29,29);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (30,30);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (31,31);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (32,32);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (33,33);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (34,34);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (35,35);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (36,36);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (37,37);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (38,38);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (39,39);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (40,40);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (41,41);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (42,42);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (43,43);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (44,44);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (45,45);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (46,46);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (47,47);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (48,48);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (49,49);
INSERT INTO Comentarios_Publicados (Id_Comentarios, Id_Publicados) VALUES (50,50);

INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (1,1);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (2,2);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (3,3);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (4,4);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (5,5);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (6,6);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (7,7);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (8,8);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (9,9);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (10,10);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (11,11);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (12,12);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (13,13);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (14,14);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (15,15);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (16,16);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (17,17);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (18,18);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (19,19);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (20,20);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (21,21);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (22,22);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (23,23);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (24,24);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (25,25);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (26,26);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (27,27);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (28,28);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (29,29);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (30,30);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (31,31);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (32,32);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (33,33);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (34,34);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (35,35);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (36,36);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (37,37);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (38,38);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (39,39);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (40,40);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (41,41);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (42,42);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (43,43);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (44,44);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (45,45);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (46,46);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (47,47);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (48,48);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (49,49);
INSERT INTO Anuncios_Publicados (Id_Anuncio, Id_Publicados) VALUES (50,50);

INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (1,1);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (2,2);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (3,3);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (4,4);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (5,5);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (6,6);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (7,7);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (8,8);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (9,9);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (10,10);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (11,11);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (12,12);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (13,13);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (14,14);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (15,15);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (16,16);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (17,17);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (18,18);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (19,19);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (20,20);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (21,21);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (22,22);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (23,23);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (24,24);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (25,25);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (26,26);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (27,27);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (28,28);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (29,29);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (30,30);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (31,31);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (32,32);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (33,33);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (34,34);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (35,35);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (36,36);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (37,37);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (38,38);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (39,39);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (40,40);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (41,41);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (42,42);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (43,43);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (44,44);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (45,45);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (46,46);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (47,47);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (48,48);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (49,49);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (50,50);

INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (1,1);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (2,2);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (3,3);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (4,4);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (5,5);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (6,6);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (7,7);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (8,8);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (9,9);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (10,10);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (11,11);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (12,12);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (13,13);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (14,14);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (15,15);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (16,16);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (17,17);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (18,18);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (19,19);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (20,20);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (21,21);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (22,22);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (23,23);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (24,24);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (25,25);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (26,26);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (27,27);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (28,28);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (29,29);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (30,30);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (31,31);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (32,32);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (33,33);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (34,34);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (35,35);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (36,36);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (37,37);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (38,38);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (39,39);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (40,40);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (41,41);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (42,42);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (43,43);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (44,44);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (45,45);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (46,46);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (47,47);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (48,48);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (49,49);
INSERT INTO Producto_Publicados (Id_Producto, Id_Publicados) VALUES (50,50);

INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (1,1);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (2,2);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (3,3);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (4,4);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (5,5);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (6,6);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (7,7);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (8,8);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (9,9);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (10,10);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (11,11);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (12,12);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (13,13);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (14,14);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (15,15);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (16,16);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (17,17);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (18,18);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (19,19);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (20,20);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (21,21);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (22,22);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (23,23);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (24,24);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (25,25);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (26,26);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (27,27);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (28,28);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (29,29);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (30,30);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (31,31);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (32,32);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (33,33);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (34,34);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (35,35);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (36,36);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (37,37);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (38,38);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (39,39);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (40,40);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (41,41);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (42,42);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (43,43);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (44,44);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (45,45);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (46,46);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (47,47);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (48,48);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (49,49);
INSERT INTO Producto_Estado (Id_Producto, Id_Estado) VALUES (50,50);

INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (1,1);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (2,2);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (3,3);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (4,4);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (5,5);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (6,6);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (7,7);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (8,8);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (9,9);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (10,10);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (11,11);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (12,12);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (13,13);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (14,14);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (15,15);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (16,16);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (17,17);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (18,18);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (19,19);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (20,20);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (21,21);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (22,22);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (23,23);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (24,24);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (25,25);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (26,26);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (27,27);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (28,28);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (29,29);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (30,30);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (31,31);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (32,32);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (33,33);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (34,34);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (35,35);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (36,36);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (37,37);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (38,38);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (39,39);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (40,40);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (41,41);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (42,42);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (43,43);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (44,44);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (45,45);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (46,46);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (47,47);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (48,48);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (49,49);
INSERT INTO Producto_Anuncios (Id_Producto, Id_Anuncio) VALUES (50,50);





INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (1,20,1,16.0,12.00,72.00,2,1);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (2,19,2,16.0,130.00,34.00,1,1);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (3,18,3,16.0,200.00,66.00,3,1);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (4,17,4,16.0,54.00,55.00,1,1);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (5,16,5,16.0,52.00,89.00,2,1);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (6,15,6,16.0,890.00,123.00,1,1);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (7,14,7,16.0,56.00,1111.00,1,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (8,13,8,16.0,431.50,1234.00,3,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (9,12,9,16.0,341.00,19.50,4,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (10,11,10,16.0,123.123,66.00,1,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (11,10,11,16.0,234.23,27.99,1,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (12,9,12,16.0,34.45,79.99,1,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (13,8,13,16.0,78.99,34.35,1,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (14,7,14,16.0,99.99,56.00,1,1);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (15,6,15,16.0,0.00,12.00,1,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (16,5,16,16.0,0.00,54.00,1,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (17,4,17,16.0,0.00,56.50,1,1);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (18,3,18,16.0,0.00,123.12,1,1);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (19,2,19,16.0,0.00,431.50,2,0);
INSERT INTO Compra(Id_Producto,Id_Usuario,Id_Horario,IVA,CostoEnvio,Importe,Cantidad,Entregado) VALUES (20,1,20,16.0,0.00,19.50,2,0);









