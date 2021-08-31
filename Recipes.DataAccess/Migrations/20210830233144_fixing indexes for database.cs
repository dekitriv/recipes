using Microsoft.EntityFrameworkCore.Migrations;

namespace Recipes.DataAccess.Migrations
{
    public partial class fixingindexesfordatabase : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Steps_Order",
                table: "Steps");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Steps_Order",
                table: "Steps",
                column: "Order",
                unique: true);
        }
    }
}
