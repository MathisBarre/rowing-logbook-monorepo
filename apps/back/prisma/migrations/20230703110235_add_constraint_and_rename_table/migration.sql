/*
  Warnings:

  - You are about to drop the `Boat` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Club` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Route` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Rower` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RowersOnSessions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Session` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Boat";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Club";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Route";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Rower";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "RowersOnSessions";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Session";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "rowers" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "clubId" INTEGER NOT NULL,
    CONSTRAINT "rowers_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "clubs" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "sessions" (
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
    "boatId" INTEGER NOT NULL,
    CONSTRAINT "sessions_boatId_fkey" FOREIGN KEY ("boatId") REFERENCES "boats" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "sessions_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES "routes" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "sessions_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "clubs" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "rowers_on_sessions" (
    "rowerId" INTEGER NOT NULL,
    "sessionId" INTEGER NOT NULL,

    PRIMARY KEY ("rowerId", "sessionId"),
    CONSTRAINT "rowers_on_sessions_rowerId_fkey" FOREIGN KEY ("rowerId") REFERENCES "rowers" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "rowers_on_sessions_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "sessions" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "boats" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "clubId" INTEGER NOT NULL,
    CONSTRAINT "boats_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "clubs" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "routes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "distance" REAL NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "clubId" INTEGER NOT NULL,
    CONSTRAINT "routes_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "clubs" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "clubs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "boats_clubId_name_key" ON "boats"("clubId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "routes_clubId_name_key" ON "routes"("clubId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "clubs_name_key" ON "clubs"("name");
