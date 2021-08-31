using Microsoft.EntityFrameworkCore.Migrations;

namespace Recipes.DataAccess.Migrations
{
    public partial class fixingindexes2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_NutritionRecipes_Amount",
                table: "NutritionRecipes");

            migrationBuilder.DropIndex(
                name: "IX_IngredientRecipes_Amount",
                table: "IngredientRecipes");

            migrationBuilder.AlterColumn<string>(
                name: "Amount",
                table: "IngredientRecipes",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Amount",
                table: "IngredientRecipes",
                type: "nvarchar(450)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.CreateIndex(
                name: "IX_NutritionRecipes_Amount",
                table: "NutritionRecipes",
                column: "Amount",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_IngredientRecipes_Amount",
                table: "IngredientRecipes",
                column: "Amount",
                unique: true);
        }
    }
}
