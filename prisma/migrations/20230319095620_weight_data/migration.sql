-- CreateTable
CREATE TABLE "WeightData" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "WeightData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WeightOfDay" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "Weight" DECIMAL(65,30) NOT NULL,
    "weightDataId" INTEGER NOT NULL,

    CONSTRAINT "WeightOfDay_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "WeightData_id_key" ON "WeightData"("id");

-- CreateIndex
CREATE UNIQUE INDEX "WeightData_userId_key" ON "WeightData"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "WeightOfDay_id_key" ON "WeightOfDay"("id");

-- AddForeignKey
ALTER TABLE "WeightData" ADD CONSTRAINT "WeightData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WeightOfDay" ADD CONSTRAINT "WeightOfDay_weightDataId_fkey" FOREIGN KEY ("weightDataId") REFERENCES "WeightData"("id") ON DELETE CASCADE ON UPDATE CASCADE;
