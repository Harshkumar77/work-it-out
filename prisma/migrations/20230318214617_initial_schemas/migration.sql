-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "dob" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ActivityData" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "ActivityData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ActivityDataOfDay" (
    "id" SERIAL NOT NULL,
    "activityDataId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "steps" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ActivityDataOfDay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Excercise" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(30) NOT NULL,

    CONSTRAINT "Excercise_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExcercisePerformed" (
    "id" SERIAL NOT NULL,
    "rep" INTEGER NOT NULL DEFAULT 0,
    "weight" INTEGER NOT NULL DEFAULT 0,
    "oneRepMax" INTEGER NOT NULL DEFAULT 0,
    "excerciseId" INTEGER NOT NULL,
    "activityDataOfDayId" INTEGER NOT NULL,

    CONSTRAINT "ExcercisePerformed_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NutritionData" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "NutritionData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NutritionDataOfDay" (
    "id" SERIAL NOT NULL,
    "nutritionDataId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "water" INTEGER NOT NULL DEFAULT 0,
    "calorie" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "NutritionDataOfDay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MealTaken" (
    "id" SERIAL NOT NULL,
    "meal_name" VARCHAR(300) NOT NULL,
    "calorie" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "MealTaken_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "ActivityData_id_key" ON "ActivityData"("id");

-- CreateIndex
CREATE UNIQUE INDEX "ActivityData_userId_key" ON "ActivityData"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ActivityDataOfDay_id_key" ON "ActivityDataOfDay"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Excercise_id_key" ON "Excercise"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Excercise_name_key" ON "Excercise"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ExcercisePerformed_id_key" ON "ExcercisePerformed"("id");

-- CreateIndex
CREATE UNIQUE INDEX "NutritionData_id_key" ON "NutritionData"("id");

-- CreateIndex
CREATE UNIQUE INDEX "NutritionData_userId_key" ON "NutritionData"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "NutritionDataOfDay_id_key" ON "NutritionDataOfDay"("id");

-- CreateIndex
CREATE UNIQUE INDEX "MealTaken_id_key" ON "MealTaken"("id");

-- AddForeignKey
ALTER TABLE "ActivityData" ADD CONSTRAINT "ActivityData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityDataOfDay" ADD CONSTRAINT "ActivityDataOfDay_activityDataId_fkey" FOREIGN KEY ("activityDataId") REFERENCES "ActivityData"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExcercisePerformed" ADD CONSTRAINT "ExcercisePerformed_excerciseId_fkey" FOREIGN KEY ("excerciseId") REFERENCES "Excercise"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExcercisePerformed" ADD CONSTRAINT "ExcercisePerformed_activityDataOfDayId_fkey" FOREIGN KEY ("activityDataOfDayId") REFERENCES "ActivityDataOfDay"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NutritionData" ADD CONSTRAINT "NutritionData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NutritionDataOfDay" ADD CONSTRAINT "NutritionDataOfDay_nutritionDataId_fkey" FOREIGN KEY ("nutritionDataId") REFERENCES "NutritionData"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
