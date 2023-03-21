-- DropForeignKey
ALTER TABLE "Excercise" DROP CONSTRAINT "Excercise_muscleId_fkey";

-- AddForeignKey
ALTER TABLE "Excercise" ADD CONSTRAINT "Excercise_muscleId_fkey" FOREIGN KEY ("muscleId") REFERENCES "Muscle"("id") ON DELETE CASCADE ON UPDATE CASCADE;
