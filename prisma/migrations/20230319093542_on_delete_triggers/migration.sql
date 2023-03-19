-- DropForeignKey
ALTER TABLE "ActivityData" DROP CONSTRAINT "ActivityData_userId_fkey";

-- DropForeignKey
ALTER TABLE "ActivityDataOfDay" DROP CONSTRAINT "ActivityDataOfDay_activityDataId_fkey";

-- DropForeignKey
ALTER TABLE "ExcercisePerformed" DROP CONSTRAINT "ExcercisePerformed_activityDataOfDayId_fkey";

-- DropForeignKey
ALTER TABLE "ExcercisePerformed" DROP CONSTRAINT "ExcercisePerformed_excerciseId_fkey";

-- DropForeignKey
ALTER TABLE "NutritionData" DROP CONSTRAINT "NutritionData_userId_fkey";

-- DropForeignKey
ALTER TABLE "NutritionDataOfDay" DROP CONSTRAINT "NutritionDataOfDay_nutritionDataId_fkey";

-- AddForeignKey
ALTER TABLE "ActivityData" ADD CONSTRAINT "ActivityData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityDataOfDay" ADD CONSTRAINT "ActivityDataOfDay_activityDataId_fkey" FOREIGN KEY ("activityDataId") REFERENCES "ActivityData"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExcercisePerformed" ADD CONSTRAINT "ExcercisePerformed_excerciseId_fkey" FOREIGN KEY ("excerciseId") REFERENCES "Excercise"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExcercisePerformed" ADD CONSTRAINT "ExcercisePerformed_activityDataOfDayId_fkey" FOREIGN KEY ("activityDataOfDayId") REFERENCES "ActivityDataOfDay"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NutritionData" ADD CONSTRAINT "NutritionData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NutritionDataOfDay" ADD CONSTRAINT "NutritionDataOfDay_nutritionDataId_fkey" FOREIGN KEY ("nutritionDataId") REFERENCES "NutritionData"("id") ON DELETE CASCADE ON UPDATE CASCADE;
