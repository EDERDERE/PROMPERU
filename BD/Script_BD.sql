USE [TestPromPeru_Dev]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria](
	[Audi_ID] [int] IDENTITY(1,1) NOT NULL,
	[Prog_ID] [int] NULL,
	[Clie_ID] [int] NULL,
	[Bann_ID] [int] NULL,
	[Info_ID] [int] NULL,
	[Requ_ID] [int] NULL,
	[Insc_ID] [int] NULL,
	[Bene_ID] [int] NULL,
	[Cexi_ID] [int] NULL,
	[Egra_ID] [int] NULL,
	[Cont_ID] [int] NULL,
	[Curs_ID] [int] NULL,
	[Mult_ID] [int] NULL,
	[Usua_ID] [int] NULL,
	[Preg_ID] [int] NULL,
	[Resp_ID] [int] NULL,
	[Eval_ID] [int] NULL,
	[Audi_UsuarioCreacion] [varchar](50) NULL,
	[Audi_UsuarioEdicion] [varchar](50) NULL,
	[Audi_UsuarioEliminacion] [varchar](50) NULL,
	[Audi_FechaCreacion] [datetime] NULL,
	[Audi_FechaEdicion] [datetime] NULL,
	[Audi_FechaEliminacion] [datetime] NULL,
	[Audi_IpCreacion] [varchar](20) NULL,
	[Audi_IpEdicion] [varchar](20) NULL,
	[Audi_IpEliminacion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Audi_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[Bann_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mult_ID] [int] NULL,
	[Bann_Orden] [int] NULL,
	[Bann_Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Bann_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beneficio]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficio](
	[Bene_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mult_ID] [int] NULL,
	[Bene_Beneficio] [varchar](50) NULL,
	[Bene_Descripcion] [varchar](200) NULL,
	[Bene_Orden] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Bene_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasoExito]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasoExito](
	[Cexi_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mult_ID] [int] NULL,
	[Cexi_Casos] [varchar](50) NULL,
	[Cexi_Orden] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cexi_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Clie_ID] [int] IDENTITY(1,1) NOT NULL,
	[Clie_RUC] [varchar](11) NULL,
	[Clie_RazonSocial] [varchar](20) NULL,
	[Clie_NombreComercial] [varchar](20) NULL,
	[Clie_Telefono] [varchar](15) NULL,
	[Clie_Celular] [varchar](15) NULL,
	[Clie_Correo] [varchar](50) NULL,
	[Clie_Region] [varchar](15) NULL,
	[Clie_Provincia] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Clie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[Cont_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cont_Nombre] [varchar](50) NULL,
	[Cont_Apellido] [varchar](50) NULL,
	[Cont_Correo] [varchar](50) NULL,
	[Cont_Mensaje] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cont_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Curs_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mult_ID] [int] NULL,
	[Preg_ID] [int] NULL,
	[Curs_NombreCurso] [varchar](50) NULL,
	[Curs_Descripcion] [varchar](200) NULL,
	[Curs_Objetivo] [varchar](200) NULL,
	[Curs_FechaInicio] [date] NULL,
	[Curs_FechaFin] [date] NULL,
	[Curs_DuracionHoras] [int] NULL,
	[Curs_Modalidad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Curs_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpresaGraduada]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpresaGraduada](
	[Egra_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mult_ID] [int] NULL,
	[Egra_NombreEmpresa] [varchar](50) NULL,
	[Egra_Orden] [int] NULL,
	[Egra_Descripcion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Egra_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etapa]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etapa](
	[Etap_ID] [int] IDENTITY(1,1) NOT NULL,
	[Clie_ID] [int] NULL,
	[Preg_ID] [int] NULL,
	[Etap_Etapa] [varchar](50) NULL,
	[Etap_Descripcion] [varchar](200) NULL,
	[Etap_Orden] [int] NULL,
	[Etap_FechaInscripcion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Etap_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluacion]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluacion](
	[Eval_ID] [int] IDENTITY(1,1) NOT NULL,
	[Eval_Alternativa] [varchar](1) NULL,
	[Eval_RespuestaCorrecta] [varchar](500) NULL,
	[Eval_Aprobado] [bit] NULL,
	[Eval_PuntajePregunta] [decimal](5, 2) NULL,
	[Eval_PuntajeIndividual] [decimal](5, 2) NULL,
	[Eval_PuntajeGlobal] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Eval_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Informacion]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informacion](
	[Info_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mult_ID] [int] NULL,
	[Info_Titulo] [varchar](255) NULL,
	[Info_Descripcion] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Info_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[Insc_ID] [int] IDENTITY(1,1) NOT NULL,
	[Etap_ID] [int] NULL,
	[Mult_ID] [int] NULL,
	[Insc_Titulo] [varchar](50) NULL,
	[Insc_Contenido] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Insc_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Multimedia]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Multimedia](
	[Mult_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mult_URLImagen] [varchar](255) NULL,
	[Mult_URLVideo] [varchar](255) NULL,
	[Mult_URLIcon] [varchar](255) NULL,
	[Mult_URLFile] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Mult_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[Preg_ID] [int] IDENTITY(1,1) NOT NULL,
	[Resp_ID] [int] NULL,
	[Eval_ID] [int] NULL,
	[Preg_Pregunta] [varchar](500) NULL,
	[Preg_Orden] [int] NULL,
	[Preg_TipoPregunta] [varchar](50) NULL,
	[Preg_FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Preg_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa](
	[Prog_ID] [int] IDENTITY(1,1) NOT NULL,
	[Clie_ID] [int] NULL,
	[Bann_ID] [int] NULL,
	[Info_ID] [int] NULL,
	[Requ_ID] [int] NULL,
	[Insc_ID] [int] NULL,
	[Bene_ID] [int] NULL,
	[Cexi_ID] [int] NULL,
	[Egra_ID] [int] NULL,
	[Cont_ID] [int] NULL,
	[Curs_ID] [int] NULL,
	[Mult_ID] [int] NULL,
	[Prog_Titulo] [varchar](50) NULL,
	[Prog_Contenido] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Prog_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requisito]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requisito](
	[Requ_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mult_ID] [int] NULL,
	[Requ_Orden] [int] NULL,
	[Requ_Requisito] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Requ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[Resp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Resp_Alternativa] [varchar](1) NULL,
	[Resp_Respuesta] [varchar](500) NULL,
	[Resp_Orden] [int] NULL,
	[Resp_FechaRespuesta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Resp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Usua_ID] [int] IDENTITY(1,1) NOT NULL,
	[Usua_Usuario] [varchar](50) NULL,
	[Usua_Contrasenia] [varchar](200) NULL,
	[Usua_Cargo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Usua_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Usua_ID], [Usua_Usuario], [Usua_Contrasenia], [Usua_Cargo]) VALUES (1, N'Super_Admin', N'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', N'Super Administrador')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Bann_ID])
REFERENCES [dbo].[Banner] ([Bann_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Bene_ID])
REFERENCES [dbo].[Beneficio] ([Bene_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Cexi_ID])
REFERENCES [dbo].[CasoExito] ([Cexi_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Clie_ID])
REFERENCES [dbo].[Cliente] ([Clie_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Cont_ID])
REFERENCES [dbo].[Contacto] ([Cont_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Curs_ID])
REFERENCES [dbo].[Curso] ([Curs_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Egra_ID])
REFERENCES [dbo].[EmpresaGraduada] ([Egra_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Eval_ID])
REFERENCES [dbo].[Evaluacion] ([Eval_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Informacion] ([Info_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Insc_ID])
REFERENCES [dbo].[Inscripcion] ([Insc_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Preg_ID])
REFERENCES [dbo].[Pregunta] ([Preg_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Prog_ID])
REFERENCES [dbo].[Programa] ([Prog_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Requ_ID])
REFERENCES [dbo].[Requisito] ([Requ_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Resp_ID])
REFERENCES [dbo].[Respuesta] ([Resp_ID])
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD FOREIGN KEY([Usua_ID])
REFERENCES [dbo].[Usuario] ([Usua_ID])
GO
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
ALTER TABLE [dbo].[Beneficio]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
ALTER TABLE [dbo].[CasoExito]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
ALTER TABLE [dbo].[EmpresaGraduada]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
ALTER TABLE [dbo].[Etapa]  WITH CHECK ADD FOREIGN KEY([Clie_ID])
REFERENCES [dbo].[Cliente] ([Clie_ID])
GO
ALTER TABLE [dbo].[Etapa]  WITH CHECK ADD FOREIGN KEY([Preg_ID])
REFERENCES [dbo].[Pregunta] ([Preg_ID])
GO
ALTER TABLE [dbo].[Informacion]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD FOREIGN KEY([Eval_ID])
REFERENCES [dbo].[Evaluacion] ([Eval_ID])
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD FOREIGN KEY([Resp_ID])
REFERENCES [dbo].[Respuesta] ([Resp_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Bann_ID])
REFERENCES [dbo].[Banner] ([Bann_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Bene_ID])
REFERENCES [dbo].[Beneficio] ([Bene_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Cexi_ID])
REFERENCES [dbo].[CasoExito] ([Cexi_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Clie_ID])
REFERENCES [dbo].[Cliente] ([Clie_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Cont_ID])
REFERENCES [dbo].[Contacto] ([Cont_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Curs_ID])
REFERENCES [dbo].[Curso] ([Curs_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Egra_ID])
REFERENCES [dbo].[EmpresaGraduada] ([Egra_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Informacion] ([Info_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Insc_ID])
REFERENCES [dbo].[Inscripcion] ([Insc_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD FOREIGN KEY([Requ_ID])
REFERENCES [dbo].[Requisito] ([Requ_ID])
GO
ALTER TABLE [dbo].[Requisito]  WITH CHECK ADD FOREIGN KEY([Mult_ID])
REFERENCES [dbo].[Multimedia] ([Mult_ID])
GO
/****** Object:  StoredProcedure [dbo].[USP_Auditoria_INS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Auditoria_INS]
    @Prog_ID INT = NULL,
    @Clie_ID INT = NULL,
    @Bann_ID INT = NULL,
    @Info_ID INT = NULL,
    @Requ_ID INT = NULL,
    @Insc_ID INT = NULL,
    @Bene_ID INT = NULL,
    @Cexi_ID INT = NULL,
    @Egra_ID INT = NULL,
    @Cont_ID INT = NULL,
    @Curs_ID INT = NULL,
    @Mult_ID INT = NULL,
    @Usua_ID INT = NULL,
    @Preg_ID INT = NULL,
    @Resp_ID INT = NULL,
    @Eval_ID INT = NULL,
    @Audi_Usuario VARCHAR(50),   
    @Audi_Ip VARCHAR(20) = NULL,
    @Audi_NuevoID INT = NULL,
    @Audi_Accion CHAR(1) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Determinar la acción y preparar los valores a insertar
    DECLARE @Audi_UsuarioCreacion VARCHAR(50),
            @Audi_UsuarioEdicion VARCHAR(50),
            @Audi_UsuarioEliminacion VARCHAR(50),
            @Audi_FechaCreacion DATETIME,
            @Audi_FechaEdicion DATETIME,
            @Audi_FechaEliminacion DATETIME,
            @Audi_IpCreacion VARCHAR(20),
            @Audi_IpEdicion VARCHAR(20),
            @Audi_IpEliminacion VARCHAR(20);

    SET @Audi_FechaCreacion = GETDATE();
    SET @Audi_FechaEdicion = NULL;
    SET @Audi_FechaEliminacion = NULL;

    -- Asignar valores según la acción
    IF @Audi_Accion = 'I' -- Insertar
    BEGIN
        SET @Audi_UsuarioCreacion = @Audi_Usuario;
        SET @Audi_IpCreacion = @Audi_Ip;
		SET @Audi_FechaCreacion = @Audi_FechaCreacion;
        SET @Audi_UsuarioEdicion = NULL;
        SET @Audi_UsuarioEliminacion = NULL;
        SET @Audi_IpEdicion = NULL;
        SET @Audi_IpEliminacion = NULL;
    END
    ELSE IF @Audi_Accion = 'E' -- Editar
    BEGIN
        SET @Audi_UsuarioCreacion = NULL;
        SET @Audi_IpCreacion = NULL;
        SET @Audi_UsuarioEdicion = @Audi_Usuario;
        SET @Audi_FechaEdicion = @Audi_FechaCreacion;
        SET @Audi_IpEdicion = @Audi_Ip;
        SET @Audi_UsuarioEliminacion = NULL;
        SET @Audi_IpEliminacion = NULL;
    END
    ELSE IF @Audi_Accion = 'D' -- Eliminar
    BEGIN
        SET @Audi_UsuarioCreacion = NULL;
        SET @Audi_IpCreacion = NULL;
        SET @Audi_UsuarioEdicion = NULL;
        SET @Audi_FechaEdicion = NULL;
        SET @Audi_IpEdicion = NULL;
        SET @Audi_UsuarioEliminacion = @Audi_Usuario;
        SET @Audi_FechaEliminacion = @Audi_FechaCreacion;
        SET @Audi_IpEliminacion = @Audi_Ip;
    END

    -- Insertar en la tabla Auditoria
    INSERT INTO Auditoria (
        Prog_ID, Clie_ID, Bann_ID, Info_ID, Requ_ID, Insc_ID, Bene_ID, Cexi_ID, Egra_ID, 
        Cont_ID, Curs_ID, Mult_ID, Usua_ID, Preg_ID, Resp_ID, Eval_ID, 
        Audi_UsuarioCreacion, Audi_UsuarioEdicion, Audi_UsuarioEliminacion, 
        Audi_FechaCreacion, Audi_FechaEdicion, Audi_FechaEliminacion, 
        Audi_IpCreacion, Audi_IpEdicion, Audi_IpEliminacion
    )
    VALUES (
        @Prog_ID, @Clie_ID, @Bann_ID, @Info_ID, @Requ_ID, @Insc_ID, @Bene_ID, @Cexi_ID, @Egra_ID, 
        @Cont_ID, @Curs_ID, @Mult_ID, @Usua_ID, @Preg_ID, @Resp_ID, @Eval_ID, 
        @Audi_UsuarioCreacion, @Audi_UsuarioEdicion, @Audi_UsuarioEliminacion, 
        @Audi_FechaCreacion, @Audi_FechaEdicion, @Audi_FechaEliminacion, 
        @Audi_IpCreacion, @Audi_IpEdicion, @Audi_IpEliminacion
    );
    
    -- Retornar el ID del registro recién insertado
    SELECT SCOPE_IDENTITY() AS Audi_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Banner_DEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminación de Banner
CREATE PROCEDURE [dbo].[USP_Banner_DEL]
    @Bann_ID INT
AS
BEGIN
    DELETE FROM Banner WHERE Bann_ID = @Bann_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Banner_INS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Inserción en Banner
CREATE PROCEDURE [dbo].[USP_Banner_INS]
    @Mult_ID INT,
    @Bann_Orden INT,
    @Bann_Nombre VARCHAR(50)
AS
BEGIN
    INSERT INTO Banner (Mult_ID, Bann_Orden, Bann_Nombre)
    VALUES (@Mult_ID, @Bann_Orden, @Bann_Nombre);

    SELECT SCOPE_IDENTITY() AS Bann_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Banner_LIS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listado de todos los registros de Banner
CREATE PROCEDURE [dbo].[USP_Banner_LIS]
AS
BEGIN
    SELECT Bann_ID, Mult_ID, Bann_Orden, Bann_Nombre
    FROM Banner;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Banner_RPT]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Reporte de Banner (Ejemplo)
CREATE PROCEDURE [dbo].[USP_Banner_RPT]
AS
BEGIN
    SELECT Bann_ID, Bann_Nombre, Bann_Orden
    FROM Banner
    WHERE Bann_Orden > 1; -- Condición específica para reporte
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Banner_SEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Selección de un registro específico de Banner
CREATE PROCEDURE [dbo].[USP_Banner_SEL]
    @Bann_ID INT
AS
BEGIN
    SELECT Bann_ID, Mult_ID, Bann_Orden, Bann_Nombre
    FROM Banner
    WHERE Bann_ID = @Bann_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Banner_UPD]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualización de Banner
CREATE PROCEDURE [dbo].[USP_Banner_UPD]
    @Bann_ID INT,
    @Mult_ID INT,
    @Bann_Orden INT,
    @Bann_Nombre VARCHAR(50)
AS
BEGIN
    UPDATE Banner
    SET Mult_ID = @Mult_ID,
        Bann_Orden = @Bann_Orden,
        Bann_Nombre = @Bann_Nombre
    WHERE Bann_ID = @Bann_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Beneficio_DEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminación de Beneficio
CREATE PROCEDURE [dbo].[USP_Beneficio_DEL]
    @Bene_ID INT
AS
BEGIN
    DELETE FROM Beneficio WHERE Bene_ID = @Bene_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_CasoExito_DEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_CasoExito_DEL]
    @Cexi_ID INT
AS
BEGIN
    DELETE FROM CasoExito WHERE Cexi_ID = @Cexi_ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CasoExito_INS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_CasoExito_INS]
    @Mult_ID INT,
    @Cexi_Casos VARCHAR(50),
    @Cexi_Orden INT
AS
BEGIN
    INSERT INTO CasoExito (Mult_ID, Cexi_Casos, Cexi_Orden)
    VALUES (@Mult_ID, @Cexi_Casos, @Cexi_Orden)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CasoExito_LIS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_CasoExito_LIS]
AS
BEGIN
    SELECT * FROM CasoExito
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CasoExito_RPT]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_CasoExito_RPT]
AS
BEGIN
    SELECT 
        Cexi_ID, 
        Cexi_Casos, 
        Cexi_Orden, 
        Mult_URLImagen
    FROM CasoExito
    JOIN Multimedia ON CasoExito.Mult_ID = Multimedia.Mult_ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CasoExito_SEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_CasoExito_SEL]
    @Cexi_ID INT
AS
BEGIN
    SELECT * FROM CasoExito WHERE Cexi_ID = @Cexi_ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CasoExito_UPD]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_CasoExito_UPD]
    @Cexi_ID INT,
    @Mult_ID INT,
    @Cexi_Casos VARCHAR(50),
    @Cexi_Orden INT
AS
BEGIN
    UPDATE CasoExito
    SET 
        Mult_ID = @Mult_ID,
        Cexi_Casos = @Cexi_Casos,
        Cexi_Orden = @Cexi_Orden
    WHERE Cexi_ID = @Cexi_ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Informacion_DEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar un registro de la tabla Informacion
CREATE PROCEDURE [dbo].[USP_Informacion_DEL]
    @Info_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Informacion
    WHERE Info_ID = @Info_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Informacion_INS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para insertar un registro en la tabla Informacion
CREATE PROCEDURE [dbo].[USP_Informacion_INS]
    @Mult_ID INT,
    @Info_Titulo VARCHAR(255),
    @Info_Descripcion VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Informacion (Mult_ID, Info_Titulo, Info_Descripcion)
    VALUES (@Mult_ID, @Info_Titulo, @Info_Descripcion);

    SELECT SCOPE_IDENTITY() AS NuevoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Informacion_LIS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para listar todos los registros de la tabla Informacion
CREATE PROCEDURE [dbo].[USP_Informacion_LIS]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Info_ID, Mult_ID, Info_Titulo, Info_Descripcion
    FROM Informacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Informacion_RPT]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para generar un reporte desde la tabla Informacion
CREATE PROCEDURE [dbo].[USP_Informacion_RPT]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Info_ID, Mult_ID, Info_Titulo, Info_Descripcion
    FROM Informacion
    ORDER BY Info_Titulo ASC; -- Ordenar alfabéticamente por título como ejemplo
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Informacion_SEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para seleccionar un registro específico de la tabla Informacion
CREATE PROCEDURE [dbo].[USP_Informacion_SEL]
    @Info_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Info_ID, Mult_ID, Info_Titulo, Info_Descripcion
    FROM Informacion
    WHERE Info_ID = @Info_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Informacion_UPD]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para actualizar un registro de la tabla Informacion
CREATE PROCEDURE [dbo].[USP_Informacion_UPD]
    @Info_ID INT,
    @Mult_ID INT,
    @Info_Titulo VARCHAR(255),
    @Info_Descripcion VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Informacion
    SET Mult_ID = @Mult_ID,
        Info_Titulo = @Info_Titulo,
        Info_Descripcion = @Info_Descripcion
    WHERE Info_ID = @Info_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Inscripcion_DEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar un registro en la tabla Inscripcion
CREATE PROCEDURE [dbo].[USP_Inscripcion_DEL]
    @Insc_ID INT
AS
BEGIN
    DELETE FROM Inscripcion
    WHERE Insc_ID = @Insc_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Inscripcion_INS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para insertar un registro en la tabla Inscripcion
CREATE PROCEDURE [dbo].[USP_Inscripcion_INS]
    @Etap_ID INT,
    @Mult_ID INT,
    @Insc_Titulo VARCHAR(50),
    @Insc_Contenido VARCHAR(200)
AS
BEGIN
    INSERT INTO Inscripcion (Etap_ID, Mult_ID, Insc_Titulo, Insc_Contenido)
    VALUES (@Etap_ID, @Mult_ID, @Insc_Titulo, @Insc_Contenido);
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Inscripcion_LIS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para listar los registros en la tabla Inscripcion
CREATE PROCEDURE [dbo].[USP_Inscripcion_LIS]
AS
BEGIN
    SELECT Insc_ID, Etap_ID, Mult_ID, Insc_Titulo, Insc_Contenido
    FROM Inscripcion;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Inscripcion_RPT]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para generar un reporte de registros en la tabla Inscripcion
CREATE PROCEDURE [dbo].[USP_Inscripcion_RPT]
AS
BEGIN
    SELECT Insc_ID, Etap_ID, Mult_ID, Insc_Titulo, Insc_Contenido
    FROM Inscripcion
    ORDER BY Insc_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Inscripcion_SEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para seleccionar un registro en la tabla Inscripcion
CREATE PROCEDURE [dbo].[USP_Inscripcion_SEL]
    @Insc_ID INT
AS
BEGIN
    SELECT Insc_ID, Etap_ID, Mult_ID, Insc_Titulo, Insc_Contenido
    FROM Inscripcion
    WHERE Insc_ID = @Insc_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Inscripcion_UPD]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para actualizar un registro en la tabla Inscripcion
CREATE PROCEDURE [dbo].[USP_Inscripcion_UPD]
    @Insc_ID INT,
    @Etap_ID INT,
    @Mult_ID INT,
    @Insc_Titulo VARCHAR(50),
    @Insc_Contenido VARCHAR(200)
AS
BEGIN
    UPDATE Inscripcion
    SET Etap_ID = @Etap_ID,
        Mult_ID = @Mult_ID,
        Insc_Titulo = @Insc_Titulo,
        Insc_Contenido = @Insc_Contenido
    WHERE Insc_ID = @Insc_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Multimedia_DEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_Multimedia_DEL]
    @Mult_ID INT
AS
BEGIN
    DELETE FROM Multimedia WHERE Mult_ID = @Mult_ID;
END;

GO
/****** Object:  StoredProcedure [dbo].[USP_Multimedia_INS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Multimedia_INS]
    @Mult_URLImagen VARCHAR(255),
    @Mult_URLVideo VARCHAR(255),
    @Mult_URLIcon VARCHAR(255),
    @Mult_URLFile VARCHAR(255)
AS
BEGIN
    INSERT INTO Multimedia (Mult_URLImagen, Mult_URLVideo, Mult_URLIcon, Mult_URLFile)
    VALUES (@Mult_URLImagen, @Mult_URLVideo, @Mult_URLIcon, @Mult_URLFile);

    SELECT SCOPE_IDENTITY() AS NuevoID;
END;

GO
/****** Object:  StoredProcedure [dbo].[USP_Multimedia_LIS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_Multimedia_LIS]
AS
BEGIN
    SELECT Mult_ID, Mult_URLImagen, Mult_URLVideo, Mult_URLIcon, Mult_URLFile
    FROM Multimedia;
END;

GO
/****** Object:  StoredProcedure [dbo].[USP_Multimedia_RPT]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_Multimedia_RPT]
AS
BEGIN
    SELECT Mult_ID, Mult_URLImagen, Mult_URLVideo, Mult_URLIcon, Mult_URLFile
    FROM Multimedia
    WHERE LEN(Mult_URLImagen) > 0; -- Condición específica para reporte
END;

GO
/****** Object:  StoredProcedure [dbo].[USP_Multimedia_SEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_Multimedia_SEL]
    @Mult_ID INT
AS
BEGIN
    SELECT Mult_ID, Mult_URLImagen, Mult_URLVideo, Mult_URLIcon, Mult_URLFile
    FROM Multimedia
    WHERE Mult_ID = @Mult_ID;
END;

GO
/****** Object:  StoredProcedure [dbo].[USP_Multimedia_UPD]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_Multimedia_UPD]
    @Mult_ID INT,
    @Mult_URLImagen VARCHAR(255),
    @Mult_URLVideo VARCHAR(255),
    @Mult_URLIcon VARCHAR(255),
    @Mult_URLFile VARCHAR(255)
AS
BEGIN
    UPDATE Multimedia
    SET Mult_URLImagen = @Mult_URLImagen,
        Mult_URLVideo = @Mult_URLVideo,
        Mult_URLIcon = @Mult_URLIcon,
        Mult_URLFile = @Mult_URLFile
    WHERE Mult_ID = @Mult_ID;
END;

GO
/****** Object:  StoredProcedure [dbo].[USP_Requisito_DEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_Requisito_DEL]
    @Requ_ID INT
AS
BEGIN
    DELETE FROM Requisito WHERE Requ_ID = @Requ_ID;
END;

GO
/****** Object:  StoredProcedure [dbo].[USP_Requisito_INS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para insertar un registro en la tabla Requisito
CREATE PROCEDURE [dbo].[USP_Requisito_INS]
    @Mult_ID INT,
    @Requ_Orden INT,
    @Requ_Requisito VARCHAR(50)
AS
BEGIN
    INSERT INTO Requisito (Mult_ID, Requ_Orden, Requ_Requisito)
    VALUES (@Mult_ID, @Requ_Orden, @Requ_Requisito);
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Requisito_LIS]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para listar todos los registros de la tabla Requisito
CREATE PROCEDURE [dbo].[USP_Requisito_LIS]
AS
BEGIN
    SELECT Requ_ID, Mult_ID, Requ_Orden, Requ_Requisito
    FROM Requisito;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Requisito_RPT]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para reporte de registros en la tabla Requisito
CREATE PROCEDURE [dbo].[USP_Requisito_RPT]
AS
BEGIN
    SELECT r.Requ_ID, r.Mult_ID, m.Mult_URLImagen, r.Requ_Orden, r.Requ_Requisito
    FROM Requisito r
    INNER JOIN Multimedia m ON r.Mult_ID = m.Mult_ID
    ORDER BY r.Requ_Orden;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Requisito_SEL]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para seleccionar un registro específico de la tabla Requisito
CREATE PROCEDURE [dbo].[USP_Requisito_SEL]
    @Requ_ID INT
AS
BEGIN
    SELECT Requ_ID, Mult_ID, Requ_Orden, Requ_Requisito
    FROM Requisito
    WHERE Requ_ID = @Requ_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_Requisito_UPD]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para actualizar un registro en la tabla Requisito
CREATE PROCEDURE [dbo].[USP_Requisito_UPD]
    @Requ_ID INT,
    @Mult_ID INT,
    @Requ_Orden INT,
    @Requ_Requisito VARCHAR(50)
AS
BEGIN
    UPDATE Requisito
    SET Mult_ID = @Mult_ID,
        Requ_Orden = @Requ_Orden,
        Requ_Requisito = @Requ_Requisito
    WHERE Requ_ID = @Requ_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_ValidarUsuario]    Script Date: 2/01/2025 03:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ValidarUsuario]
    @Usuario NVARCHAR(50),
    @Contrasenia NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Usua_ID, Usua_Usuario,Usua_Contrasenia,Usua_Cargo
    FROM Usuario
    WHERE Usua_Usuario = @Usuario AND Usua_Contrasenia = @Contrasenia;
END;
GO
