/*
  Warnings:

  - Added the required column `clubId` to the `Rower` table without a default value. This is not possible if the table is not empty.
  - Added the required column `clubId` to the `Session` table without a default value. This is not possible if the table is not empty.
  - Added the required column `clubId` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `clubId` to the `Boat` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "Club" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Rower" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "clubId" INTEGER NOT NULL,
    CONSTRAINT "Rower_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Rower" ("createdAt", "firstname", "id", "lastname", "updatedAt") SELECT "createdAt", "firstname", "id", "lastname", "updatedAt" FROM "Rower";
DROP TABLE "Rower";
ALTER TABLE "new_Rower" RENAME TO "Rower";
CREATE TABLE "new_Session" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "distance" REAL,
    "estimatedStartDateTime" DATETIME,
    "estimatedEndDateTime" DATETIME,
    "startDateTime" DATETIME,
    "endDateTime" DATETIME,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "routeId" INTEGER,
    "clubId" INTEGER NOT NULL,
    CONSTRAINT "Session_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES "Route" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Session_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Session" ("createdAt", "distance", "endDateTime", "estimatedEndDateTime", "estimatedStartDateTime", "id", "routeId", "startDateTime", "updatedAt") SELECT "createdAt", "distance", "endDateTime", "estimatedEndDateTime", "estimatedStartDateTime", "id", "routeId", "startDateTime", "updatedAt" FROM "Session";
DROP TABLE "Session";
ALTER TABLE "new_Session" RENAME TO "Session";
CREATE TABLE "new_Route" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "distance" REAL NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "clubId" INTEGER NOT NULL,
    CONSTRAINT "Route_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Route" ("createdAt", "distance", "id", "name", "updatedAt") SELECT "createdAt", "distance", "id", "name", "updatedAt" FROM "Route";
DROP TABLE "Route";
ALTER TABLE "new_Route" RENAME TO "Route";
CREATE UNIQUE INDEX "Route_name_key" ON "Route"("name");
CREATE TABLE "new_Boat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "clubId" INTEGER NOT NULL,
    CONSTRAINT "Boat_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Boat" ("createdAt", "id", "name", "updatedAt") SELECT "createdAt", "id", "name", "updatedAt" FROM "Boat";
DROP TABLE "Boat";
ALTER TABLE "new_Boat" RENAME TO "Boat";
CREATE UNIQUE INDEX "Boat_name_key" ON "Boat"("name");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "Club_name_key" ON "Club"("name");
