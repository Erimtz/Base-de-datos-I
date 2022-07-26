CREATE TABLE usuario(
id_usuario INT NOT NULL AUTO_INCREMENT,
email VARCHAR(50),
contrasenia CHAR(8),
nombre_usuario VARCHAR(50),
fecha_nacimiento DATE,
pais VARCHAR(50),
codigo_postal VARCHAR(50),
id_avatar INT,
PRIMARY KEY (id_usuario),
FOREIGN KEY (id_avatar) REFERENCES avatar(id_avatar)
);

CREATE TABLE video(
id_video INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(100),
descripcion TEXT,
tamanio_mb INT,
nombre_archivo VARCHAR(100),
duracion_segs INT,
path_imagen VARCHAR(300),
reproducciones INT,
publico TINYINT(1),
id_usuario_creador INT,
fecha_hora_creacion DATETIME(6),
FOREIGN KEY (id_usuario_creador) REFERENCES usuario(id_usuario),
PRIMARY KEY (id_video)
);

CREATE TABLE etiqueta(
id_etiqueta INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
PRIMARY KEY (id_etiqueta)
);

CREATE TABLE etiquetaxVideo(
id_etiquetaxvideo INT NOT NULL AUTO_INCREMENT,
id_etiqueta INT,
id_video INT,
PRIMARY KEY (id_etiquetaxvideo),
FOREIGN KEY (id_etiqueta) references etiqueta(id_etiqueta),
FOREIGN KEY (id_video) references video(id_video)
);

CREATE TABLE canal(
id_canal INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (100),
descripcion TEXT,
fecha_creacion DATE,
usuario_creador INT,
PRIMARY KEY (id_canal),
FOREIGN KEY (usuario_creador) REFERENCES usuario(id_usuario)
);

CREATE TABLE playlist(
id_playlist INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (100),
fecha_creacion DATE,
usuario_creador INT,
publica TINYINT(1),
PRIMARY KEY (id_playlist),
FOREIGN KEY (usuario_creador) REFERENCES usuario(id_usuario)
);

CREATE TABLE avatar(
id_avatar INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
url_imagen VARCHAR (300),
PRIMARY KEY (id_avatar)
);

CREATE TABLE reaccion(
id_reaccion INT NOT NULL AUTO_INCREMENT,
tipo_reaccion VARCHAR(50),
PRIMARY KEY (id_reaccion)
);

CREATE TABLE reaccionxVideo(
id_reaccionxVideo INT NOT NULL AUTO_INCREMENT,
id_reaccion INT,
id_video INT,
total_reacciones INT,
PRIMARY KEY (id_reaccionxVideo),
FOREIGN KEY (id_reaccion) REFERENCES reaccion(id_reaccion),
FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE reaccionxUsuario(
id_reaccionxUsuario INT NOT NULL AUTO_INCREMENT,
id_reaccion INT,
id_usuario INT,
fecha_hora DATETIME,
PRIMARY KEY (id_reaccionxUsuario),
FOREIGN KEY (id_reaccion) REFERENCES reaccion(id_reaccion),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE reaccionxUsuarioxVideo(
id_reaccionxUsuarioxVideo INT NOT NULL AUTO_INCREMENT,
id_video INT,
id_reaccionxUsuario INT,
PRIMARY KEY (id_reaccionxUsuarioxVideo),
FOREIGN KEY (id_video) REFERENCES video(id_video),
FOREIGN KEY (id_reaccionxUsuario) REFERENCES reaccionxUsuario(id_reaccionxUsuario)
);

