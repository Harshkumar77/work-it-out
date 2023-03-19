/*
  Warnings:

  - You are about to drop the column `oneRepMax` on the `ExcercisePerformed` table. All the data in the column will be lost.
  - You are about to drop the column `rep` on the `ExcercisePerformed` table. All the data in the column will be lost.
  - You are about to drop the column `weight` on the `ExcercisePerformed` table. All the data in the column will be lost.
  - Added the required column `nutritionDataOfDayId` to the `MealTaken` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ExcercisePerformed" DROP COLUMN "oneRepMax",
DROP COLUMN "rep",
DROP COLUMN "weight";

-- AlterTable
ALTER TABLE "MealTaken" ADD COLUMN     "nutritionDataOfDayId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "SetPerformed" (
    "id" SERIAL NOT NULL,
    "rep" INTEGER NOT NULL DEFAULT 0,
    "weight" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "oneRepMax" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "excercisePerformedId" INTEGER NOT NULL,

    CONSTRAINT "SetPerformed_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "SetPerformed_id_key" ON "SetPerformed"("id");

-- AddForeignKey
ALTER TABLE "SetPerformed" ADD CONSTRAINT "SetPerformed_excercisePerformedId_fkey" FOREIGN KEY ("excercisePerformedId") REFERENCES "ExcercisePerformed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealTaken" ADD CONSTRAINT "MealTaken_nutritionDataOfDayId_fkey" FOREIGN KEY ("nutritionDataOfDayId") REFERENCES "NutritionDataOfDay"("id") ON DELETE CASCADE ON UPDATE CASCADE;
