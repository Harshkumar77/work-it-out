/*
  Warnings:

  - You are about to drop the column `img` on the `ExcercisePerformed` table. All the data in the column will be lost.
  - Added the required column `img` to the `Excercise` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Excercise" ADD COLUMN     "img" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "ExcercisePerformed" DROP COLUMN "img";
