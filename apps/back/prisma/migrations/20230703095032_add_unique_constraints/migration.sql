/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `Boat` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `Route` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Boat_name_key" ON "Boat"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Route_name_key" ON "Route"("name");
