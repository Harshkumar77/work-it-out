/*
  Warnings:

  - Added the required column `muscleId` to the `Excercise` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Excercise" ADD COLUMN     "muscleId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Muscle" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(20) NOT NULL,

    CONSTRAINT "Muscle_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Muscle_id_key" ON "Muscle"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Muscle_name_key" ON "Muscle"("name");

-- AddForeignKey
ALTER TABLE "Excercise" ADD CONSTRAINT "Excercise_muscleId_fkey" FOREIGN KEY ("muscleId") REFERENCES "Muscle"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
