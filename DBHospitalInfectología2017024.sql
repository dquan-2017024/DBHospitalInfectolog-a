/*
	Nombre del Programador: Daniel Enrique Cruz
    Código Técnico: IN5AM
    Carnet: 2017024
    Creación: 2021-02-7
    Modificaciones:
		DDL: 2021-02-7
        DML: 2021-02-9
*/

Drop database if exists DBHospitalInfectología2017024;
Create database DBHospitalInfectología2017024;
Use  DBHospitalInfectología2017024;

-- DDL

Create table if not exists Medicos(
	PK_CodigoMedico int auto_increment not null,
    Licencia_Medica int not null,
    Nombres varchar(100) not null,
    Apellidos varchar(100) not null,
    Horario_Entrada time not null,
    Horario_Salida time not null,
    Turno_Maximo time not null,
    sexo varchar(20) not null,
    primary key (PK_CodigoMedico)
);

Create table if not exists Pacientes(
	PK_CodigoPaciente int auto_increment not null,
    DPI varchar(20) not null,
    Apellidos Varchar(100) not null,
    Nombres varchar(100) not null,
    Fecha_Nacimiento Date not null,
    Edad int,
    direccion varchar(150) not null,
    ocupacion varchar(50) not null,
    sexo varchar(15) not null,
    primary key (PK_CodigoPaciente)
);

Create table if not exists Areas(
	PK_CodigoArea int auto_increment not null,
    Nombre_Area varchar(45) not null,
    primary key (PK_CodigoArea)
);

Create table if not exists Cargos(
	PK_CodigoCargo int not null auto_increment,
    Nombre_Cargo varchar(45) not null,
    primary key (PK_CodigoCargo)
);

Create table if not exists Especialidades(
	PK_CodigoEspecialidad int auto_increment not null,
    Nombre_Especialidad varchar(45),
    primary key (PK_CodigoEspecialidad)
);

Create table if not exists Horario(
	PK_CodigoHorario int auto_increment not null,
    Horario_Inicio time not null,
    Horario_Salida time not null,
    Lunes time,
    Martes time,
    Miercoles time,
    Jueves time,
    Viernes time,
    primary key (PK_CodigoHorario)
);

Create table if not exists TelefonosMedicos(
	PK_CodigoTelefonos int auto_increment not null,
    Telefono_Personal varchar(15) not null,
    Telefono_Trabajo varchar(15),
    Codigo_Medico int not null,
    primary key (PK_CodigoTelefonos),
    Constraint FK_Medicos_CodigoMedico foreign key
		(Codigo_Medico) references Medicos (PK_CodigoMedico)
);

Create table if not exists ContactoUrgencia(
	PK_CodigoContactoUrgencia INT auto_increment not null,
    Nombres varchar(100) not null,
    apellidos varchar(100) not null,
    Numero_Contacto varchar(10) not null,
    Codigo_Paciente int not null,
    primary key (PK_CodigoContactoUrgencia),
    Constraint FK_Codigo_Paciente foreign key
		(Codigo_Paciente) references Pacientes (PK_CodigoPaciente)
);

Create table if not exists ResponsableTurno(
	PK_CodigoResponsableTurno INT auto_increment not null,
    Nombre_Responsable varchar(75) not null,
    Apellidos_Responsable varchar(45) not null,
    Telefono_Personal varchar(10) not null,
    Codigo_Area int not null,
    Codigo_Cargo int not null,
    primary key (PK_CodigoResponsableTurno),
    Constraint FK_Codigo_Area foreign key
		(Codigo_Area) references Areas (PK_CodigoArea),
	Constraint FK_Codigo_Cargo foreign key
		(Codigo_Cargo) references Cargos (PK_CodigoCargo)
);

Create table if not exists MedicoEspecialidad(
	PK_CodigoMedicoEspecialidad int auto_increment not null,
    Codigo_Medico int not null,
    Codigo_Especialidad int not null,
    Codigo_Horario int not null,
    primary key (PK_CodigoMedicoEspecialidad),
    Constraint FK_Codigo_Medico foreign key
		(Codigo_Medico) references Medicos (PK_CodigoMedico),
	Constraint FK_Codigo_Especialidad foreign key
		(Codigo_Especialidad) references Especialidades (PK_CodigoEspecialidad),
	Constraint FK_Codigo_Horario foreign key
		(Codigo_Horario) references Horario (PK_CodigoHorario)
);

Create table if not exists Turno(
	PK_CodigoTurno int auto_increment not null,
    Fecha_Turno date not null,
    Fecha_Cita date not null,
    Valor_Cita decimal(10,2) not null,
    Codigo_MedicoEspecialidad int not null,
    Codigo_Turno int not null,
    Codigo_Paciente int not null,
    primary key (PK_CodigoTurno),
    Constraint FK_Codigo_MedicoEspecialidad foreign key
		(Codigo_MedicoEspecialidad) references MedicoEspecialidad (PK_CodigoMedicoEspecialidad),
	Constraint FK_Codigo_Turno foreign key
		(Codigo_Turno) references ResponsableTurno (PK_CodigoResponsableTurno),
	Constraint FK_Codigo_Pacientes foreign key
		(Codigo_Paciente) references Pacientes (PK_CodigoPaciente)
);

-- DML

#Insert
	# Medicos
		insert into Medicos (Licencia_Medica, Nombres, Apellidos, Horario_Entrada, Horario_Salida, Turno_Maximo, sexo) 
			values(1234, 'Daniel Enrique', 'Quan Cruz', '3:00', '13:00', '16:00', 'Masculino');
        insert into Medicos (Licencia_Medica, Nombres, Apellidos, Horario_Entrada, Horario_Salida, Turno_Maximo, sexo) 
			values(5678, 'Branddon Raul', 'Montenegro Mazariegos', '5:00', '14:00', '16:00', 'Masculino');
        insert into Medicos (Licencia_Medica, Nombres, Apellidos, Horario_Entrada, Horario_Salida, Turno_Maximo, sexo) 
			values(9087, 'Amner Jair', 'Muñoz Gutierrez', '4:00', '16:00', '19:00', 'Masculino');
        insert into Medicos (Licencia_Medica, Nombres, Apellidos, Horario_Entrada, Horario_Salida, Turno_Maximo, sexo) 
			values(6543, 'Sarah Yobell', 'De Leon Barreondo', '8:00', '15:00', '18:00', 'Femenino');
        insert into Medicos (Licencia_Medica, Nombres, Apellidos, Horario_Entrada, Horario_Salida, Turno_Maximo, sexo) 
			values(1235, 'Pablo Emilio', 'Escobar Gaviria', '12:00', '17:00', '20:00', 'Masculino');
      
	#Pacientes
		insert into Pacientes (DPI, Apellidos, Nombres, Fecha_Nacimiento, Edad, direccion, ocupacion, sexo) 
			values(1234-56739-8745, 'Cruz Nava', 'Luis Alejandro', '2003-10-12', 17, '2da callle 01-20 Zona 1', 'Gerente de Ventas', 'Masculino');
        insert into Pacientes (DPI, Apellidos, Nombres, Fecha_Nacimiento, Edad, direccion, ocupacion, sexo) 
			values(1453-67895-4560, 'Perez Ochoa', 'Jordan Steven', '2002-02-14', 18, '3ra avenida 03-15 Zona 9', 'Pintor', 'Masculino');
        insert into Pacientes (DPI, Apellidos, Nombres, Fecha_Nacimiento, Edad, direccion, ocupacion, sexo) 
			values(4567-89765-6734, 'De Leon Barreondo', 'Paola Maribel', '1996-12-13', 24, '4ta avenida 20-20 Zona 10', 'Chef', 'Femenino');
        insert into Pacientes (DPI, Apellidos, Nombres, Fecha_Nacimiento, Edad, direccion, ocupacion, sexo) 
			values(1543-67895-8769, 'Martinez ', 'Nicol', '2003-07-11', 17, '3ra calle 41-30 Zona 15', 'Profesora', 'Femenino');
        insert into Pacientes (DPI, Apellidos, Nombres, Fecha_Nacimiento, Edad, direccion, ocupacion, sexo) 
			values(1345-65437-7896, 'Santizo Perez', 'Byron Javier', '2003-11-3', 17, '5ta calle 50-67 Zona 13', 'Arquitecto', 'Maculino');
        
	#Areas
		insert into Areas (Nombre_Area) 
			values('Anestelogia');
        insert into Areas (Nombre_Area) 
			values('Farmacia');
		insert into Areas (Nombre_Area) 
			values('Ginecologia');
        insert into Areas (Nombre_Area) 
			values('Cardiologia');
        insert into Areas (Nombre_Area) 
			values('Traumotologia');

	#Cargos
		insert into Cargos (Nombre_Cargo) 
			values('Especialista');
		insert into Cargos (Nombre_Cargo) 
			values('Personal de enfermeria');
		insert into Cargos (Nombre_Cargo) 
			values('Fisio Terapeuta');
		insert into Cargos (Nombre_Cargo) 
			values('Logopeda');
		insert into Cargos (Nombre_Cargo) 
			values('Farmaceuticos');

	#Especialidades
		insert into Especialidades (Nombre_Especialidad) 
			values('Cardiologia Pediatrica');
        insert into Especialidades (Nombre_Especialidad) 
			values('Ginecologia');
        insert into Especialidades (Nombre_Especialidad) 
			values('Logopedia');
        insert into Especialidades (Nombre_Especialidad) 
			values('Psiquiatria');
        insert into Especialidades (Nombre_Especialidad) 
			values('Neumologia');

	#Horarios
		insert into Horario (Horario_Inicio, Horario_Salida, Lunes, Martes, Miercoles, Jueves, Viernes)
			values('0:00', '23:59', '5:00', '11:00', '15:00', '12:00', ' 14:00');
        insert into Horario (Horario_Inicio, Horario_Salida, Lunes, Martes, Miercoles, Jueves, Viernes)
			values('0:00', '23:59', '6:00', '13:00', '15:00', '13:00', ' 18:00');
        insert into Horario (Horario_Inicio, Horario_Salida, Lunes, Martes, Miercoles, Jueves, Viernes)
			values('0:00', '23:59', '8:00', '18:00', '15:00', '14:00', ' 17:00');
        insert into Horario (Horario_Inicio, Horario_Salida, Lunes, Martes, Miercoles, Jueves, Viernes)
			values('0:00', '23:59', '9:00', '15:00', '15:00', '16:00', ' 16:00');
        insert into Horario (Horario_Inicio, Horario_Salida, Lunes, Martes, Miercoles, Jueves, Viernes)
			values('0:00', '23:59', '4:00', '16:00', '13:00', '14:00', ' 15:00');
        
	#TelefonosMedicos
		insert into TelefonosMedicos (Telefono_Personal, Telefono_Trabajo, Codigo_Medico)
			values (23498714, 87954326, 1);
        insert into TelefonosMedicos (Telefono_Personal, Telefono_Trabajo, Codigo_Medico)
			values (12365478, 76512389, 5);
        insert into TelefonosMedicos (Telefono_Personal, Telefono_Trabajo, Codigo_Medico)
			values (98765412, 12346578, 4);
        insert into TelefonosMedicos (Telefono_Personal, Telefono_Trabajo, Codigo_Medico)
			values (56789125, 56743891, 3);
        insert into TelefonosMedicos (Telefono_Personal, Telefono_Trabajo, Codigo_Medico)
			values (56712309, 23487645, 2);
        
	#ContactoUrgencia
		insert into ContactoUrgencia (Nombres, apellidos, Numero_Contacto, Codigo_Paciente)
			values ('Brandon', 'Muñoz', 45981467, 5);
        insert into ContactoUrgencia (Nombres, apellidos, Numero_Contacto, Codigo_Paciente)
			values ('Jair', 'Mazariegos', 65981245, 4);
        insert into ContactoUrgencia (Nombres, apellidos, Numero_Contacto, Codigo_Paciente)
			values ('Daniel', 'Montenegro', 67345892, 1);
        insert into ContactoUrgencia (Nombres, apellidos, Numero_Contacto, Codigo_Paciente)
			values ('Raul', 'Quan', 56783423, 2);
        insert into ContactoUrgencia (Nombres, apellidos, Numero_Contacto, Codigo_Paciente)
			values ('Amner', 'Cruz', 56781234, 3);
        
	#ResponsableTurno
		insert into ResponsableTurno (Nombre_Responsable, Apellidos_Responsable, Telefono_Personal, Codigo_Area, Codigo_Cargo)
			values ('Tom', 'Holland', 23657896, 1, 5);
        insert into ResponsableTurno (Nombre_Responsable, Apellidos_Responsable, Telefono_Personal, Codigo_Area, Codigo_Cargo)
			values ('Robert', ' Downey', 56789134, 3, 2);
        insert into ResponsableTurno (Nombre_Responsable, Apellidos_Responsable, Telefono_Personal, Codigo_Area, Codigo_Cargo)
			values ('Leonardo', 'Di Caprio', 14567891, 5, 4);
        insert into ResponsableTurno (Nombre_Responsable, Apellidos_Responsable, Telefono_Personal, Codigo_Area, Codigo_Cargo)
			values ('Bradd', 'Pitt', 33457934, 4, 3);
        insert into ResponsableTurno (Nombre_Responsable, Apellidos_Responsable, Telefono_Personal, Codigo_Area, Codigo_Cargo)
			values ('Angelina', 'Jolie', 44456724, 2, 1);

	#MedicoEspecialidad
		insert into MedicoEspecialidad (Codigo_Medico, Codigo_Especialidad, Codigo_Horario)
			values (1, 3, 5);
        insert into MedicoEspecialidad (Codigo_Medico, Codigo_Especialidad, Codigo_Horario)
			values (2, 4, 4);
        insert into MedicoEspecialidad (Codigo_Medico, Codigo_Especialidad, Codigo_Horario)
			values (3, 5, 3);
        insert into MedicoEspecialidad (Codigo_Medico, Codigo_Especialidad, Codigo_Horario)
			values (4, 2, 2);
        insert into MedicoEspecialidad (Codigo_Medico, Codigo_Especialidad, Codigo_Horario)
			values (1, 1, 1);
        
	#Turno
		insert into Turno (Fecha_Turno, Fecha_Cita, Valor_Cita, Codigo_MedicoEspecialidad, Codigo_Turno, Codigo_Paciente)
			values ('2021-02-10', '2021-02-10', '250.00', 4, 5, 4);
		insert into Turno (Fecha_Turno, Fecha_Cita, Valor_Cita, Codigo_MedicoEspecialidad, Codigo_Turno, Codigo_Paciente)
			values ('2021-02-15', '2021-02-15', '250.00', 3, 1, 1);
		insert into Turno (Fecha_Turno, Fecha_Cita, Valor_Cita, Codigo_MedicoEspecialidad, Codigo_Turno, Codigo_Paciente)
			values ('2021-03-15', '2021-03-15', '250.00', 2, 2, 3);
		insert into Turno (Fecha_Turno, Fecha_Cita, Valor_Cita, Codigo_MedicoEspecialidad, Codigo_Turno, Codigo_Paciente)
			values ('2021-04-14', '2021-04-14', '250.00', 1, 3, 5);
		insert into Turno (Fecha_Turno, Fecha_Cita, Valor_Cita, Codigo_MedicoEspecialidad, Codigo_Turno, Codigo_Paciente)
			values ('2021-03-12', '2021-03-12', '250.00', 5, 4, 2);
            
#Drop
		-- Drop Table turno;
		-- Drop Table ContactoUrgencia;
		-- Drop Table ResponsableTurno;
		-- Drop Table TelefonosMedicos;
		-- Drop Table Medicos;
		-- Drop Table Pacientes;
		-- DroP Table Areas;
		-- Drop Table Especialidades;
		-- Drop Table Cargos;
		-- Drop Table Horario; 
		-- Drop Table MedicoEspecialidad;

#Select
		select*From Areas;
		Select*From Cargos;
        Select*From Horario;
        Select*From MedicoEspecialidad;
        Select*From Medicos;
        Select*From Pacientes;
		Select*From TelefonosMedicos;
        Select*From Especialidades;
        Select*From Turno;
        Select*From ResponsableTurno;
        Select*From ContactoUrgencia;
        
#Update
		Update Areas set Nombre_Area='Pediatra' where PK_CodigoArea=3;
        Update Cargos set Nombre_Cargo='Pediatra' where PK_CodigoCargo=3;		
        Update Horario set Hora_Inicio='1:00', Hora_Salida='0:00', Lunes='4:00', Martes='10:00', Miercoles='14:00', Jueves='10:00', Viernes='13:00' where PK_CodigoHorario=4;
		Update MedicoEspecialidad set Codigo_Medico =2, Codigo_Especialidad=4, Codigo_Horario=4 where PK_CodigoMedicoEspecialidad=2;
        Update Medicos set Licencia_Medica=4321, Nombres='Enrique Daniel', Apellidos='Cruz Quan', Horario_Entrada='8:00', Horario_Salida='15:00', Turno_Maximo='18:00', Sexo='Male' where Areas=1;
        Update Pacientes set DPI=1234-56455-6755 , Apellidos='Olsen', Nombres='Elizabeth', Fecha_Nacimiento='2000-02-10', Edad=21, direccion='3ra avenida 10-30 Zona 10', ocupacion='Actriz', sexo='Femenino' where PK_CodigoPaciente=1;
        Update TelefonosMedicos set Telefono_Personal=11446674, Telefono_Trabajo=12349846, Codigo_Medico=4 where PK_CodigoTelefonos=5;
		Update Especialidades set Nombre_Especialidad='Traumatologia' where PK_CodigoEspecialidad=4;
		Update Turno set Fecha_Turno='2021-03-04', Fecha_Cita='2021-03-04', Valor_Cita='300.00', Codigo_MedicoEspecialidad=1, Codigo_Turno=2, Codigo_Paciente=3 where PK_CodigoTurno=5;
		Update ResponsableTurno set Nombre_Responsable='Robert', Apellidos_Responsable='Deniro', Telefono_Personal=23457658 where PK_CodigoResponsableTurno=5;
		Update ContactoUrgencia set Nombres='Branddon', Apellidos='Cruz', Numero_Contacto=23457658, Codigo_Paciente=3 where PK_CodigoContactoUrgencia=4;
        
        
#Delete
		-- Delete from Areas Where PK_CodigoArea=4;
        -- Delete from Cargos Where PK_CodigoCargo=3;
        -- Delete from Horario Where PK_CodigoHorario=1;
        -- Delete from MedicoEspecialidad Where PK_CodigoMedicoEspecialidad=4;
        -- Delete from Medicos Where PK_CodigoPaciente=5;
        -- Delete from Pacientes Where PK_CodigoPaciente=5;
        -- Delete from TelefonosMedicos Where PK_CodigoTelefonos=3;
        -- Delete from Especialidades Where PK_CodigoEspecialidad=2;
        -- Delete from Turno WherePK_CodigoTurno=3;
        -- Delete from ResponsableTurno Where PK_CodigoResponsableTurno=4;
		-- Delete from ContactoUrgencia Where PK_CodigoContactoUrgencia=4;