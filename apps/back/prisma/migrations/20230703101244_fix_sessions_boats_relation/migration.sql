/*
  Warnings:

  - You are about to drop the `BoatsOnSessions` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `boatId` to the `Session` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "BoatsOnSessions";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
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
    "boatId" INTEGER NOT NULL,
    CONSTRAINT "Session_boatId_fkey" FOREIGN KEY ("boatId") REFERENCES "Boat" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Session_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES "Route" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Session_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Session" ("clubId", "createdAt", "distance", "endDateTime", "estimatedEndDateTime", "estimatedStartDateTime", "id", "routeId", "startDateTime", "updatedAt") SELECT "clubId", "createdAt", "distance", "endDateTime", "estimatedEndDateTime", "estimatedStartDateTime", "id", "routeId", "startDateTime", "updatedAt" FROM "Session";
DROP TABLE "Session";
ALTER TABLE "new_Session" RENAME TO "Session";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
