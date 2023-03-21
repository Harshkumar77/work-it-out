/*
  Warnings:

  - Added the required column `img` to the `ExcercisePerformed` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ExcercisePerformed" ADD COLUMN     "img" TEXT NOT NULL;
