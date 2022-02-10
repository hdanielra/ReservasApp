using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ReservasApp.Migrations
{
    public partial class migracion1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Cliente",
                columns: table => new
                {
                    ClienteId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cliente", x => x.ClienteId);
                });

            migrationBuilder.CreateTable(
                name: "Hotel",
                columns: table => new
                {
                    HotelId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Hotel", x => x.HotelId);
                });

            migrationBuilder.CreateTable(
                name: "Temporada",
                columns: table => new
                {
                    TemporadaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Temporada", x => x.TemporadaId);
                });

            migrationBuilder.CreateTable(
                name: "TipoHabitacion",
                columns: table => new
                {
                    TipoHabitacionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoHabitacion", x => x.TipoHabitacionId);
                });

            migrationBuilder.CreateTable(
                name: "CostoHabitacion",
                columns: table => new
                {
                    CostoHabitacionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    HotelId = table.Column<int>(type: "int", nullable: false),
                    TipoHabitacionId = table.Column<int>(type: "int", nullable: false),
                    TemporadaId = table.Column<int>(type: "int", nullable: false),
                    Precio = table.Column<decimal>(type: "decimal(16,2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CostoHabitacion", x => x.CostoHabitacionID);
                    table.ForeignKey(
                        name: "FK_CostoHabitacion_Hotel_HotelId",
                        column: x => x.HotelId,
                        principalTable: "Hotel",
                        principalColumn: "HotelId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CostoHabitacion_Temporada_TemporadaId",
                        column: x => x.TemporadaId,
                        principalTable: "Temporada",
                        principalColumn: "TemporadaId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CostoHabitacion_TipoHabitacion_TipoHabitacionId",
                        column: x => x.TipoHabitacionId,
                        principalTable: "TipoHabitacion",
                        principalColumn: "TipoHabitacionId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Habitacion",
                columns: table => new
                {
                    HabitacionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    HotelId = table.Column<int>(type: "int", nullable: false),
                    TipoHabitacionId = table.Column<int>(type: "int", nullable: false),
                    NumeroHabitacion = table.Column<int>(type: "int", nullable: false),
                    Cupo = table.Column<int>(type: "int", nullable: false),
                    Estado = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Habitacion", x => x.HabitacionId);
                    table.ForeignKey(
                        name: "FK_Habitacion_Hotel_HotelId",
                        column: x => x.HotelId,
                        principalTable: "Hotel",
                        principalColumn: "HotelId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Habitacion_TipoHabitacion_TipoHabitacionId",
                        column: x => x.TipoHabitacionId,
                        principalTable: "TipoHabitacion",
                        principalColumn: "TipoHabitacionId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Reserva",
                columns: table => new
                {
                    ReservaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ClienteId = table.Column<int>(type: "int", nullable: false),
                    HabitacionId = table.Column<int>(type: "int", nullable: false),
                    FechaInicio = table.Column<DateTime>(type: "datetime2", nullable: false),
                    FechaFin = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Reserva", x => x.ReservaId);
                    table.ForeignKey(
                        name: "FK_Reserva_Cliente_ClienteId",
                        column: x => x.ClienteId,
                        principalTable: "Cliente",
                        principalColumn: "ClienteId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Reserva_Habitacion_HabitacionId",
                        column: x => x.HabitacionId,
                        principalTable: "Habitacion",
                        principalColumn: "HabitacionId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CostoHabitacion_HotelId",
                table: "CostoHabitacion",
                column: "HotelId");

            migrationBuilder.CreateIndex(
                name: "IX_CostoHabitacion_TemporadaId",
                table: "CostoHabitacion",
                column: "TemporadaId");

            migrationBuilder.CreateIndex(
                name: "IX_CostoHabitacion_TipoHabitacionId",
                table: "CostoHabitacion",
                column: "TipoHabitacionId");

            migrationBuilder.CreateIndex(
                name: "IX_Habitacion_HotelId",
                table: "Habitacion",
                column: "HotelId");

            migrationBuilder.CreateIndex(
                name: "IX_Habitacion_TipoHabitacionId",
                table: "Habitacion",
                column: "TipoHabitacionId");

            migrationBuilder.CreateIndex(
                name: "IX_Reserva_ClienteId",
                table: "Reserva",
                column: "ClienteId");

            migrationBuilder.CreateIndex(
                name: "IX_Reserva_HabitacionId",
                table: "Reserva",
                column: "HabitacionId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CostoHabitacion");

            migrationBuilder.DropTable(
                name: "Reserva");

            migrationBuilder.DropTable(
                name: "Temporada");

            migrationBuilder.DropTable(
                name: "Cliente");

            migrationBuilder.DropTable(
                name: "Habitacion");

            migrationBuilder.DropTable(
                name: "Hotel");

            migrationBuilder.DropTable(
                name: "TipoHabitacion");
        }
    }
}
